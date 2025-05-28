#!/bin/bash

LOG_FILE="logs/run_$(date +'%Y%m%d_%H%M%S').log"

echo "🔄 Activating virtualenv..."
source env/bin/activate

echo "📦 Installing dependencies..."
pip install -r requirements.txt

deactivate

echo "🚀 Running Spark job..."
python3 jobs/main.py 2>&1 | tee "$LOG_FILE"

echo "✅ Job finished. Logs saved at: $LOG_FILE"

