package MantenimientoDeCarreteras;

import java.util.ArrayList;
import org.opt4j.core.genotype.PermutationGenotype;
import org.opt4j.core.problem.Decoder;

public class DecoderMantCarr implements Decoder<PermutationGenotype<Integer>, ArrayList<Integer>>
{
	public ArrayList<Integer> decode(PermutationGenotype<Integer> genotipo)
	{
		ArrayList<Integer> fenotipo = new ArrayList<Integer>();
		
		//copiamos los valores del IntegerGenotype en la coleccion
		for (int i = 0 ; i<genotipo.size(); i++)
		{
			fenotipo.add(genotipo.get(i));
		}
		return fenotipo;
	}
}
