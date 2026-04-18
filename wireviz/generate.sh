#!/bin/bash
# Generate wiring diagram from YAML specification

echo "=========================================="
echo "Satu Vending Machine - Wiring Diagram Generator"
echo "=========================================="
echo ""

# Check if wireviz is installed
if ! command -v wireviz &> /dev/null; then
    echo "ERROR: wireviz not found. Install with: pip install wireviz"
    echo "Also requires GraphViz: https://graphviz.org/download/"
    exit 1
fi

# Generate the diagram
echo "Generating wiring diagram from satu_harness.yaml..."
wireviz satu_harness.yaml

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Generation complete!"
    echo ""
    echo "Output files created:"
    echo "  - satu_harness.html (interactive diagram)"
    echo "  - satu_harness.png  (PNG image)"
    echo "  - satu_harness.svg  (vector graphic)"
    echo "  - satu_harness.bom.csv (Bill of Materials)"
    echo ""
    echo "To view: open satu_harness.html in your browser"
else
    echo "❌ Generation failed. Check YAML syntax."
    exit 1
fi
