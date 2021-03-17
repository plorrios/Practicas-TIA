package MantenimientoDeCarreteras;

import org.opt4j.core.problem.ProblemModule; 

public class ModuleMantCarr extends ProblemModule
{
	public void config() 
	{
		bindProblem(CreatorMantCarr.class, DecoderMantCarr.class, EvaluatorMantCarr.class);
	}
}
