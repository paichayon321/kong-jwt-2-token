import jwt
import datetime

# Offset for GMT+7
timezone_offset = datetime.timedelta(hours=7)

# Function to calculate the expiration time and return the token
def generate_jwt(iss, secret, exp_minutes):
    # Get current time in GMT+7
    current_time = datetime.datetime.utcnow() + timezone_offset
    print("Current Time",current_time)
    # Calculate expiration time in UTC
    expiration_time = current_time + datetime.timedelta(minutes=exp_minutes)
    print("Expire Time:",expiration_time)
    # expiration_utc = expiration_time - timezone_offset  # Convert back to UTC
    # print(expiration_utc)
    exptime = int(expiration_time.timestamp()) 
    print("Expire SecTime:",exptime)
    # JWT header
    header = {
        "alg": "HS256",
        "typ": "JWT"
    }

    # JWT payload
    payload = {
        "iss": iss,
        "exp": exptime  # Expiration in UNIX timestamp
    }

    # Generate the JWT token
    token = jwt.encode(payload, secret, algorithm="HS256", headers=header)

    return token

# Example usage
issuer = "2cATOGXM6yFuwAcMc8qnWHtHvnZxU1ir"  # Example iss
secret_key = "2ZWQSZcGsJaVQ1q1uGwHGtJjEBJQhFgZ"  # Example secret
expiration_in_minutes = 1  # Token expires in 5 minutes

# Generate and print the token
jwt_token = generate_jwt(issuer, secret_key, expiration_in_minutes)
print(jwt_token)
