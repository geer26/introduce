# Put your imports here
from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def index(request):
    context = {'title': 'Welcome'}
    #return render(request, 'index.html', context)
    return HttpResponse('Hello world!')