# kong-jwt-2-token
This Project built for help to generate token (Bearer Token) from jwt json data that generate from Kong Gateway JWT plugin.
To modify python code require Python Versin 3.19.x


## Build Image
```
docker build -t paichayon/jwt2token .
docker push paichayon/jwt2token
```

## Usage: 
```
docker run paichayon/jwt2token <iss> <secret> <exp_minutes>
```

## Run with Sample Data:
```
docker run paichayon/jwt2token "2cATOGXM6yFuwAcMc8qnWHtHvnZxU1ir" "2ZWQSZcGsJaVQ1q1uGwHGtJjEBJQhFgZ" 1
```

## Result
```
Current Time 2024-10-06 19:22:37.555516+00:00
Expire Time: 2024-10-06 19:23:37.555516+00:00
Expire SecTime: 1728242617
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIyY0FUT0dYTTZ5RnV3QWNNYzhxbldIdEh2blp4VTFpciIsImV4cCI6MTcyODI0MjYxN30.SD3J-TF4PFT8FJYwLZtlV-Yh8TAs9V5L1ZnhPq-DbbI
```
