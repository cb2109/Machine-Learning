universe        = vanilla
executable      = matlab_launcher

log             = condor.log
notification    = Error

arguments       = $(topology) $(lr) $(transf) $(trainf) $$([60000 + $(idx)])

Requirements    = stringListMember("LAB", DoC_Host_Classes) && \
                  DoC_Package_Version_matlab =?= UNDEFINED

lr = 0.01
transf = 'tansig'
trainf = 'trainlm'

# topology = [$(layer1),$(layer2)]

idx = $(Process)
# layer1 = $$([($(idx) % 50) + 1])
# layer2 = $$([(($(idx) / 50) % 50) + 1])
# Queue 1

topology = [50,50]

transf = 'compet'
Queue 5
transf = 'hardlim'
Queue 5
transf = 'hardlims'
Queue 5
transf = 'logsig'
Queue 5
transf = 'netinv'
Queue 5
transf = 'poslin'
Queue 5
transf = 'purelin'
Queue 5
transf = 'radbas'
Queue 5
transf = 'radbasn'
Queue 5
transf = 'satlin'
Queue 5
transf = 'satlins'
Queue 5
transf = 'softmax'
Queue 5
transf = 'tansig'
Queue 5
transf = 'tribas'
Queue 5
