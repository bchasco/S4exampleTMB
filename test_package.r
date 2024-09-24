tmb_list <- new("tmb_list",
                TMB = list(data = list(y = rnorm(100)),
                           parameters = list(beta = 0,
                                             sigma = 0))
)

tmb_out <- build_tmb(tmb_list)
print(tmb_out@TMB$opt)
