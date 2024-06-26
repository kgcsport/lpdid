% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/func.R
\name{lpdid}
\alias{lpdid}
\title{Local Projections Difference-in-Differences}
\usage{
lpdid(
  df,
  window = c(NA, NA),
  y,
  unit_index,
  time_index,
  treat_status = "",
  cluster = NULL,
  controls = NULL,
  controls_t = NULL,
  outcome_lags = 0,
  reweight = FALSE,
  pmd = FALSE,
  pmd_lag,
  composition_correction = FALSE,
  pooled = FALSE,
  nonabsorbing_lag = NULL
)
}
\arguments{
\item{df}{The dataset used in the analysis.}

\item{window}{A vector of length two that denotes the length of the pre- and post-periods.
The first number, denoting the number of pre-periods before treamtent, should be negative and second, denoting the number of post periods after treatment, should be positive.}

\item{y}{The outcome variable.  This should be input as a character, the name of the outcome variable in the data.}

\item{unit_index}{The name of the column that represents the unit ID.  This should be a character.}

\item{time_index}{The name of the column that represents the calendar time.  This should be a character.}

\item{treat_status}{The name of the column that denotes treatment status.
This vector should take on a value of 1 for each time the unit is treated.
As an example, in a state-year panel, if a state is treated in 1990 and 2010, the state should have 1's for 1990 and 2010 only.  All other year observations of this variable for this unit should be equal to 0.}

\item{cluster}{The name of the column by which to cluster the standard errors.  Default is the unit ID.}

\item{controls}{A formula of control variables to be included in the regression formula. The form should be: `~ X1 + X2 | FE1 + FE2`. These controls will be time invariant.}

\item{controls_t}{A formula of control variables to be included in the regression formula. The form should be: `~ X1 + X2 | FE1 + FE2`. These controls will be time varying.}

\item{outcome_lags}{The number of outcome lags to be included in the analysis.
For an example of this, simulate endogenous data via genr_sim_data(FALSE), and include one outcome lag.}

\item{reweight}{A boolean (TRUE or FALSE) value that will re-weight the regression and generate ATT rather than VWATT. The default is FALSE, which corresponds to the estimator calculating the VWATT (variance weighted average treatment effect on the treated).}

\item{pmd}{A boolean (TRUE or FALSE) value that, if equal to TRUE, will use pre-treatment means rather than a single value from t-1.}

\item{pmd_lag}{The number of pre-treatment periods to include in taking the mean.}

\item{composition_correction}{A boolean value that will remove later-treated observations from the control group even before they are treated.  See Section 2.10 "Composition effects".}

\item{pooled}{A boolean value (TRUE or FALSE) that, if equal to TRUE, will calculate the treatment effect pooled over all post-periods.}

\item{nonabsorbing_lag}{Sets the number of periods after which dynamic effects stabilize. This number must be greater than zero, and will indicate to the function that you'd like to estimate a nonabsorbing treatment effect.}
}
\value{
A list including a coefficient table and window vector.
}
\description{
This function estimates LP-DiD regressions as outlined in Dube et al. (2023) <doi:10.3386/w31184>.
}
