from django.http import HttpResponse, JsonResponse
from django.middleware.csrf import get_token
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login
from django.db.models.query import QuerySet
from django.forms.models import model_to_dict
from io import BytesIO
#import requests
import json


class android_client:
    def __init__(self):
        self.name = "android"
