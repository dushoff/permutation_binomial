sprob <- function(ns, nf){
	vals <- c(0, sort(runif(ns+nf)), 1)
	return(c(low=vals[ns+1], high=vals[ns+2]))
}

btest <- function(ns, nf, reps=5000, P=0.025){
	offset <- round(reps*P)
	r <- replicate(reps, sprob(ns=ns, nf=nf))
	return(c(
		low=sort(r["low", ])[offset],
		high=sort(r["high", ])[1+reps-offset]
	))
}

rr <- function(ts, tf, us, uf){
	t <- sprob(ts, tf)
	u <- sprob(us, uf)
	return(c(
		low = t[["low"]]/u[["high"]],
		high = t[["high"]]/u[["low"]]
	))
}

rrtest <- function(ts, tf, us, uf, reps=5000, P=0.025){
	offset <- round(reps*P)
	r <- replicate(reps, rr(ts, tf, us, uf))
	return(c(
		low=sort(r["low", ])[offset],
		high=sort(r["high", ])[1+reps-offset]
	))
}

rrtest(2, 9, 837, 466)
