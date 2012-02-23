universe        = vanilla
executable      = matlab_launcher

output          = condor/$(Process).out
error           = condor/$(Process).err
log             = condor.log
notification    = Always

arguments       = $(topology) $(lr) $(transf) $(trainf) $(Process)

Requirements    = stringListMember("LAB", DoC_Host_Classes)

lr = 0.01
transf = 'tansig'
trainf = 'trainlm'

topology = [$(layer1),$(layer2)]
layer1 = $$([($(Process) % 50) + 1])
layer2 = $$([(($(Process) / 50) % 50) + 1])
Queue 12500
