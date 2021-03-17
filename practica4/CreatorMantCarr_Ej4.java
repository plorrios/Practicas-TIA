package MantenimientoDeCarreteras;

import java.util.Arrays;
import java.util.Random;

import org.opt4j.core.genotype.PermutationGenotype;
import org.opt4j.core.problem.Creator;

public class CreatorMantCarr implements Creator<PermutationGenotype<Integer>> 
{
	public PermutationGenotype<Integer> create() 
	{
		// el genotipo estara formado por turnos elegidos al azar en el rango [1..3]
		// en nuestro caso la poblacion sera un conjunto de invididuos, donde cada invididuo son 10 enteros (las cuadrillas)
		//genotipo.init(new Random(), Datos.NUM_CUADRILLAS);
		PermutationGenotype<Integer> genotipo = new PermutationGenotype<Integer>(Arrays.asList(0,1,2,3,4,5,6,7,8,9));  // paso1
		genotipo.init(new Random());  // paso2

		return genotipo;
	}
	
}
