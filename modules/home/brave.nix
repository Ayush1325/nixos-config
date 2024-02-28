{ pkgs, ... }:

{
	programs.chromium = {
		enable = true;
		package = pkgs.brave;
		extensions = [
		  # Bitwarden
			{ id = "nngceckbapebfimnlniiiahkandclblb"; }
			# Simplify Copilot
			{ id = "pbanhockgagggenencehbnadejlgchfc"; }
			# Grammarly
			{ id = "kbfnbcaeplbcioakkpcpgfkobkghlhen"; }
		];
	};
}
