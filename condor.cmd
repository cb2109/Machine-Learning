universe        = vanilla
executable      = matlab_launcher

output          = condor/$(Process).out
error           = condor/$(Process).err
log             = condor.log
notification    = Never

arguments       = $(topology) $(lr) $(transf) $(trainf) $(Process)

Requirements    = stringListMember("LAB", DoC_Host_Classes)

lr = 0.01
transf = 'tansig'
trainf = 'trainlm'

topology = [$(layer1)]
layer1 = 1
Queue 5
layer1 = 2
Queue 5
layer1 = 3
Queue 5
layer1 = 4
Queue 5
layer1 = 5
Queue 5
layer1 = 6
Queue 5
layer1 = 7
Queue 5
layer1 = 8
Queue 5
layer1 = 9
Queue 5
layer1 = 10
Queue 5
layer1 = 15
Queue 5
layer1 = 20
Queue 5
layer1 = 25
Queue 5
layer1 = 50
Queue 5
layer1 = 75
Queue 5
layer1 = 100
Queue 5

topology = [$(layer1),$(layer2)]
layer1 = 1
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 2
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 3
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 4
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 5
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 6
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 7
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 8
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 9
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 10
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 15
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 20
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 25
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 50
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 75
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
layer1 = 100
layer2 = 1
Queue 5
layer2 = 2
Queue 5
layer2 = 3
Queue 5
layer2 = 4
Queue 5
layer2 = 5
Queue 5
layer2 = 6
Queue 5
layer2 = 7
Queue 5
layer2 = 8
Queue 5
layer2 = 9
Queue 5
layer2 = 10
Queue 5
layer2 = 15
Queue 5
layer2 = 20
Queue 5
layer2 = 25
Queue 5
layer2 = 50
Queue 5
layer2 = 75
Queue 5
layer2 = 100
Queue 5
