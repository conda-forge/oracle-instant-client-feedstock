import os
import platform

import oracledb
import pytest

from ctypes import *

def test_instant_client():
    print("Initializing client thick mode")
    oracledb.init_oracle_client()
    print("Client initialized successfully")


