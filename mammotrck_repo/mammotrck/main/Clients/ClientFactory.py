from .Client_list import clients

def get_client(request):
    #Peticiones url implementan el cliente mediante el parametro "client", por ejemplo "client=android"
    type = None
    if (request.GET.get('client')):
        type = request.GET.get('client')
    elif (request.POST.get('client')):
        type = request.POST.get('client')

    if (type in clients):
        return clients[type]()

    return clients['web']()
