import json
import sys
from pathlib import Path


def count_dc_vulns(report_json: Path) -> dict:
    data = json.loads(report_json.read_text(encoding="utf-8"))
    deps = data.get("dependencies", [])
    vuln_count = 0
    vuln_ids = set()
    for d in deps:
        for v in d.get("vulnerabilities", []) or []:
            vuln_count += 1
            name = v.get("name") or v.get("source")
            if name:
                vuln_ids.add(name)
    return {"dependency_count": len(deps), "vulnerability_instances": vuln_count, "unique_ids": sorted(vuln_ids)}


if __name__ == "__main__":
    report = Path(sys.argv[1])
    out = Path(sys.argv[2])
    s = count_dc_vulns(report)
    out.write_text(json.dumps(s, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(s, ensure_ascii=False, indent=2))
