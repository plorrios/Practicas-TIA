package MantenimientoDeCarreteras;

import java.util.ArrayList;
import org.opt4j.core.Objectives;
import org.opt4j.core.Objective.Sign;
import org.opt4j.core.problem.Evaluator;

public class EvaluatorMantCarr implements Evaluator<ArrayList<Integer>>
{
	int turnos[] = new int[Datos.NUM_TURNOS];
	public Objectives evaluate (ArrayList<Integer> fenotipo) 
	{
		int resultado = 0; //costes
		int resultado2 = 0;//productividad
		
		for (int i = 0; i < fenotipo.size(); i++) 
		{
			int turno = fenotipo.get(i) - 1;
			turnos[turno] += 1;
			resultado += Datos.matrizCostes[turno][i];
			resultado2 += Datos.matrizProductividad[turno][i];
		}
		for (int j = 0; j < turnos.length; j++) 
		{
			if (turnos[j] < 2)
			{
				// restriccion del problema: no queremos turnos con menos de 3 cuadrillas
				resultado = Integer.MAX_VALUE;
				resultado2 = Integer.MIN_VALUE;
				break;
			}
		}
		
		//queremos minimizar el coste y maximizar la productividad total
		Objectives objetivos = new Objectives();
		objetivos.add("Coste-minimo", Sign.MIN, resultado);
		objetivos.add("Productividad-maxima", Sign.MAX, resultado2);
		
		return objetivos;
	}
}