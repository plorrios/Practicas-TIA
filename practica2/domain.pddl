(define (domain  carreteras)
(:requirements :durative-actions :typing: fluents)

(:types cisterna pavimentadora compactadora cuadrilla tramo -object)

(:predicates	(at ?x - (either cuadrilla cisterna pavimentadora compactadora) ?t - tramo)
				(compactado ?t - tramo)
                (pavimentado ?t - tramo)
                (aplastado ?t - tramo)
                (pintado ?t - tramo)
                (vallado ?t - tramo)
                (iluminado ?t - tramo)
				(camino ?t1 ?t2 - tramo)
                (disponible ?x - (either tramo cuadrilla cisterna pavimentadora compactadora))
)
(:functions	(duracion ?t1 ?t2 - tramo)
            (coste-total)
            (costecisterna)
            (costepavimentadora)
            (costecompactadora)
)

(:durative-action mover-cuadrilla
	:parameters(?c - cuadrilla ?t1 ?t2 - tramo)
    
	:duration(= ?duration (duracion ?t1 ?t2))
    
	:condition(and (at start (at ?c ?t1))
                   (over all (disponible ?t1))
                   (over all (disponible ?t2))
                   (at start (disponible ?c))
				   (over all (camino ?t1 ?t2)))
                   
	:effect(and (at start (not(disponible ?c)))
                (at end (disponible ?c))
                (at end (not (at ?c ?t1)))
                (at end (at ?c ?t2)))
)

	
(:durative-action mover-maquinaria
	:parameters(?m - (either cisterna pavimentadora compactadora) ?t1 ?t2 - tramo)
    
	:duration(= ?duration (*(duracion ?t1 ?t2)2))
    
	:condition(and (at start (at ?m ?t1))
                   (at start (disponible ?m))
                   (over all (disponible ?t1))
                   (over all (disponible ?t2))
				   (over all (camino ?t1 ?t2)))
                   
	:effect(and (at start (not(disponible ?m)))
                (at end (disponible ?m))
                (at end (not (at ?m ?t1)))
                (at end (at ?m ?t2)))
)


(:durative-action compactar
	:parameters(?t - tramo)
    
	:duration(= ?duration 250)
    
	:condition(and (at start (disponible ?t))
                   (at start (not(compactado ?t))))
                   
	:effect(and (at start (not(disponible ?t)))
                (at end (disponible ?t))
                (at end (compactado ?t)))
)


(:durative-action pavimentar
	:parameters(?c - cisterna ?p - pavimentadora ?t - tramo)
    
	:duration(= ?duration 190)
    
	:condition(and (at start (disponible ?t))
                   (at start (disponible ?c))
                   (at start (disponible ?p))
                   (at start (compactado ?t))
                   (at start (not(pavimentado ?t)))
                   (over all (at ?c ?t))
                   (over all (at ?p ?t)))
                   
	:effect(and (at start (not(disponible ?t)))
                (at start (not(disponible ?c)))
                (at start (not(disponible ?p)))
                (at end (disponible ?t))
                (at end (disponible ?c))
                (at end (disponible ?p))
                (at end (pavimentado ?t))
                (at end (increase(coste-total)(+(costecisterna)(costepavimentadora)))))
)


(:durative-action aplastar
	:parameters(?c - compactadora ?t - tramo)
    
	:duration(= ?duration 150)
    
	:condition(and (at start (disponible ?t))
                   (at start (disponible ?c))
                   (at start (compactado ?t))
                   (at start (pavimentado ?t))
                   (at start (not(aplastado ?t)))
                   (over all (at ?c ?t)))

	:effect(and (at start (not(disponible ?t)))
                (at start (not(disponible ?c)))
                (at end (disponible ?t))
                (at end (disponible ?c))
                (at end (aplastado ?t))
                (at end (increase(coste-total)(costecompactadora))))
)


(:durative-action pintar
	:parameters(?c - cuadrilla ?t - tramo)
    
	:duration(= ?duration 30)

    :condition(and (at start (disponible ?t))
                   (at start (disponible ?c))
                   (at start (compactado ?t))
                   (at start (pavimentado ?t))
                   (at start (aplastado ?t))
                   (at start (not(pintado ?t)))
                   (over all (at ?c ?t)))
                   
	:effect(and (at start (not(disponible ?t)))
                (at start (not(disponible ?c)))
                (at end (disponible ?t))
                (at end (disponible ?c))
                (at end (pintado ?t)))
)


(:durative-action vallar
	:parameters(?c - cuadrilla ?t - tramo)
    
	:duration(= ?duration 120)
    
	:condition(and (at start (disponible ?t))
                   (at start (disponible ?c))
                   (at start (compactado ?t))
                   (at start (pavimentado ?t))
                   (at start (aplastado ?t))
                   (at start (not(vallado ?t)))
                   (over all (at ?c ?t)))
                   
	:effect(and (at start (not(disponible ?t)))
                (at start (not(disponible ?c)))
                (at end (disponible ?t))
                (at end (disponible ?c))
                (at end (vallado ?t)))
)


(:durative-action pluces
	:parameters(?c - cuadrilla ?t - tramo)
    
	:duration(= ?duration 70)
    
	:condition(and (at start (disponible ?t))
                   (at start (disponible ?c))
                   (at start (compactado ?t))
                   (at start (pavimentado ?t))
                   (at start (aplastado ?t))
                   (at start (not(iluminado ?t)))
                   (over all (at ?c ?t)))
                   
	:effect(and (at start (not(disponible ?t)))
                (at start (not(disponible ?c)))
                (at end (disponible ?t))
                (at end (disponible ?c))
                (at end (iluminado ?t)))
)
)