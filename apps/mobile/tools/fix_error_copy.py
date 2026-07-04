import os

root = os.path.join(os.path.dirname(__file__), "..", "lib")
root = os.path.normpath(root)

replacements = [
    ("body: error.toString()", "body: CustomerErrorCopy.message(error)"),
    ("body: auth.error.toString()", "body: CustomerErrorCopy.message(auth.error)"),
    ("body: onboarding.error.toString()", "body: CustomerErrorCopy.message(onboarding.error)"),
    ("ErrorState(body: error.toString())", "ErrorState(body: CustomerErrorCopy.message(error))"),
    ("showPremiumSnackBar(context, error.toString()", "showPremiumSnackBar(context, CustomerErrorCopy.message(error)"),
    ("SnackBar(content: Text(error.toString()))", "SnackBar(content: Text(CustomerErrorCopy.message(error)))"),
    ("_error = error.toString()", "_error = CustomerErrorCopy.message(error)"),
    ("_applyMessage = error.toString()", "_applyMessage = CustomerErrorCopy.message(error)"),
]

target = os.path.join(root, "core", "utils", "customer_error_copy.dart")
modified = []

for dirpath, _, files in os.walk(root):
    for name in files:
        if not name.endswith(".dart") or name == "customer_error_copy.dart":
            continue
        path = os.path.join(dirpath, name)
        with open(path, encoding="utf-8") as fh:
            content = fh.read()
        orig = content
        for old, new in replacements:
            content = content.replace(old, new)
        if content == orig:
            continue
        if "customer_error_copy.dart" not in content:
            rel = os.path.relpath(target, dirpath).replace("\\", "/")
            imp = f"import '{rel}';\n"
            marker = "import 'package:flutter/material.dart';"
            if marker in content:
                content = content.replace(marker, marker + "\n" + imp, 1)
            else:
                content = imp + content
        with open(path, "w", encoding="utf-8", newline="\n") as fh:
            fh.write(content)
        modified.append(os.path.relpath(path, root))

print("\n".join(modified))
print("TOTAL", len(modified))
