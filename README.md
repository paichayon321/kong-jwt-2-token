# kong-jwt-2-token
This Project built for help to generate token (Bearer Token) from jwt json data that generate from Kong Gateway JWT plugin.
To modify python code require Python Versin 3.19.x

```
{"tags":null,"secret":"2ZWQSZcGsJaVQ1q1uGwHGtJjEBJQhFgZ","id":"7763c17e-86c8-4261-bcf6-4d51e7704544","consumer":{"id":"20d65404-c322-443f-98af-1bf5ae2910e3"},"created_at":1728193872,"rsa_public_key":null,"algorithm":"HS256","key":"2cATOGXM6yFuwAcMc8qnWHtHvnZxU1ir"}
```

## Build Image
```
docker build -t paichayon/jwt2token .
docker push paichayon/jwt2token
```

## Usage: 
```
docker run --rm paichayon/jwt2token <iss(key)> <secret> <exp_minutes>
```

## Run with Sample Data:
```
docker run --rm paichayon/jwt2token "2cATOGXM6yFuwAcMc8qnWHtHvnZxU1ir" "2ZWQSZcGsJaVQ1q1uGwHGtJjEBJQhFgZ" 1
```

## Result
```
Current Time 2024-10-06 19:22:37.555516+00:00
Expire Time: 2024-10-06 19:23:37.555516+00:00
Expire SecTime: 1728242617
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIyY0FUT0dYTTZ5RnV3QWNNYzhxbldIdEh2blp4VTFpciIsImV4cCI6MTcyODI0MjYxN30.SD3J-TF4PFT8FJYwLZtlV-Yh8TAs9V5L1ZnhPq-DbbI
```

---
## Tips Cleanup exited container
```
docker ps --filter "status=exited" --format "{{.ID}}" | xargs docker rm
```

---
# Run Shell Script

```
Usage: ./jwt2token.sh <iss(key)> <exp_in_minutes> <secret>
```

Sample Result

```
./jwt2token.sh qj5FTZVHORlnRiEpinzyjfkp2oGC8F4y 1 NKEG9GYMzG4lvF9AQLGkerfFsMOb5I0e
```
```
eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJpc3MiOiJxajVGVFpWSE9SbG5SaUVwaW56eWpma3Ayb0dDOEY0eSIsImV4cCI6MTcyODMwNTA3NH0.pM8BVasX8qQSs_gJ09MmqJTy_gcLVKUnD9uhehK06c8
```
