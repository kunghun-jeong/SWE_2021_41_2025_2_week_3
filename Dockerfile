FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update \
 && apt-get install -y --no-install-recommends python3 \
 && rm -rf /var/lib/apt/lists/*

CMD ["python3", "-c", "\
def isHappy(n: int) -> bool:\\n\
    seen = set()\\n\
    while n != 1:\\n\
        if n in seen:\\n\
            return False\\n\
        seen.add(n)\\n\
        n = sum(int(d) ** 2 for d in str(n))\\n\
    return True\\n\
\\n\
print(isHappy(19))\\n\
print(isHappy(2))\\n\
"]
