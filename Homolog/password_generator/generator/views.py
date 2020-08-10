from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def home(request):
    #return HttpResponse('Hello mano')
    return render(request, 'generator/home.html')

def password(request):
    return render(request, 'generator/password.html')