library(prophet)

df <- read.csv('https://github.com/gumdropsteve/datasets/raw/master/views.csv')
tail(df)

names(df) <- c('ds', 'y') 

m <- prophet(df)

future <- make_future_dataframe(m, periods=365)

forecast <- predict(m, future)
tail(forecast)

plot(m, forecast)

prophet_plot_components(m, forecast)

df.cv <- cross_validation(m, initial=180, period=60, horizon=120, units='days')
tail(df.cv)

plot_cross_validation_metric(df.cv, metric = 'mape')
