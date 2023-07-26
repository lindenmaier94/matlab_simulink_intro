function normalizedForce = magicFormula(slip, modelParams)

D = modelParams.maxFrictionCoeff;
C = modelParams.shapeFactor;
B = modelParams.stiffnessFactor;
E = modelParams.curvatureFactor;

normalizedForce = D .* sin(C .* atan(B .* slip - E .* ...
    (B .* slip - atan(B .* slip))));
end