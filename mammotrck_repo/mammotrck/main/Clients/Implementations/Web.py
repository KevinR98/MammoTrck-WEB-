from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.conf import settings
from django.contrib import messages
from django.contrib.auth import authenticate, login
import json
import csv
import os
import time
import numpy as np
import requests

class web_client:
    def __init__(self):
        self.name = "web"

