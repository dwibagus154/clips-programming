(deffunction ask-question (?question)
	(printout t ?question)
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer))
	)
?answer)



(defrule questionMain
	?x <- (initial-fact)
	=>
	(retract ?x)
	(bind ?meanCP (ask-question "mean concave points?"))
	(assert (meanConcavePoints ?meanCP))	
)


(defrule questionMeanConcavePoints
	?m <- (meanConcavePoints ?meanCP)
	=>
	(if (> ?meanCP 0.05) then (bind ?perimeter (ask-question "worst perimeter?")) (assert (worstperimeter ?perimeter))
	else then (bind ?radius (ask-question "worst radius?")) (assert (worstradius ?radius))
	)
	(retract ?m)	
)


(defrule questionWorstPerimeter
	?p <- (worstperimeter ?perimeter)
	=>
	(if (> ?perimeter 114.45) then (assert (found false))
	else then (bind ?texture (ask-question "worst texture?")) (assert (worsttexture ?texture))
	)
	(retract ?p)	
)



(defrule questionWorstTexture
	?t <- (worsttexture ?texture)
	=>
	(if (> ?texture 25.65) then (bind ?pError (ask-question "perimeter error?")) (assert (perimeterError ?pError))
	else then (bind ?wCP (ask-question "worst concave points?")) (assert (worstconcavepoints ?wCP))
	)
	(retract ?t)	
)


(defrule questionWorstConcavePoints
	?w <- (worstconcavepoints ?wCP)
	=>
	(if (> ?wCP 0.17) then (assert (found false))
	else then (assert (found true))
	)
	(retract ?w)	
)

(defrule questionPerimeterError
	?p <- (perimeterError ?pError)
	=>
	(if (> ?pError 1.56) then (assert (found false))
	else then (bind ?mRadius (ask-question "worst concave points?")) (assert (meanRadius ?mRadius))
	)
	(retract ?p)	
)


(defrule questionMeanRadius
	?m <- (meanRadius ?mRadius)
	=>
	(if (> ?mRadius 13.34) then (assert (found false))
	else then (assert (found true))
	)
	(retract ?m)	
)


(defrule questionWorstRadius
	?w <- (worstradius ?radius)
	=>
	(if (> ?radius 16.83) then (bind ?mTexture (ask-question "mean texture?")) (assert (meantexture ?mTexture))
	else then (bind ?rError (ask-question "radius error?")) (assert (radiuserror ?rError))
	)
	(retract ?w)	
)


(defrule questionMeanTexture
	?m <- (meantexture ?mTexture)
	=>
	(if (> ?mTexture 16.19) then (bind ?concavePE (ask-question "concave points error?")) (assert (concavepointserror ?concavePE))
	else then (assert (found true))
	)
	(retract ?m)	
)


(defrule questionConcavePointsError
	?c <- (concavepointserror ?concavePE)
	=>
	(if (> ?concavePE 0.01) then  (assert (found true))
	else then (assert (found false))
	)
	(retract ?c)	
)


(defrule questionRadiusError
	?w <- (radiuserror ?rError)
	=>
	(if (> ?rError 0.63) then (bind ?mSmoothness (ask-question "mean smoothness?")) (assert (meanSmoothness ?mSmoothness))
	else then (bind ?wTexture (ask-question "worst texture?")) (assert (worsttexturefromradius ?wTexture))
	)
	(retract ?w)	
)


(defrule questionMeanSmoothness
	?m <- (meanSmoothness ?mSmoothness)
	=>
	(if (> ?mSmoothness 0.09) then (assert (found false))
	else then (assert (found true))
	)
	(retract ?m)	
)


(defrule questionWorstTextureFromRadius
	?w <- (worsttexturefromradius ?wTexture)
	=>
	(if (> ?wTexture 30.15) then (bind ?wArea (ask-question "worst area?")) (assert (worstarea ?wArea))
	else then (assert (found true))
	)
	(retract ?w)	
)


(defrule questionWorstArea
	?w <- (worstarea ?wArea)
	=>
	(if (> ?wArea 641.60) then (bind ?mRadius (ask-question "mean radius?")) (assert (meanRadiusfromArea ?mRadius))
	else then (assert (found true))
	)
	(retract ?w)	
)


(defrule questionMeanRadiusFromArea
	?m <- (meanRadiusfromArea ?mRadius)
	=>
	(if (> ?mRadius 13.45) then (assert (found true)) 
	else then (bind ?mTexture (ask-question "mean texture?")) (assert (meantexturefromradius ?mTexture))
	)
	(retract ?m)	
)


(defrule questionMeanTextureFromRadius
	?m <- (meantexturefromradius ?mTexture)
	=>
	(if (> ?mTexture 28.79) then (assert (found true)) 
	else then (assert (found false)) 
	)
	(retract ?m)	
)


(defrule matchFound
	?f <- (found true)
	=>
	(retract ?f)
	(printout t "Terprediksi Kanker Payudara" crlf)
)


(defrule matchNotFound
	?f <- (found false)
	=>
	(printout t "Terprediksi tidak terkena kangker payudara" crlf)
)