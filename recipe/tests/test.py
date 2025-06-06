import os
import platform

import oracledb
import pytest

def test_instant_client():
    print("Running test . . . ")
    assert 2 > 1, "2 was not bigger than 1"
    print("Initializing client")
    oracledb.init_oracle_client()
    assert(True, "Failed to initialize client")
    print("Client initialized successfully")