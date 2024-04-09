#!/usr/bin/python3
"""Function to query subscribers on a given Reddit subreddit."""
import requests

def number_of_subscribers(subreddit):
    """Return the total number of subscribers on a given subreddit."""
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }
    response = requests.get(url, headers=headers, allow_redirects=False)
    
    # Check if the response is not empty and is in JSON format
    if response.status_code == 200 and response.text.strip():
        try:
            results = response.json().get("data")
            return results.get("subscribers")
        except ValueError:
            # Handle cases where the response is not valid JSON
            print("Error: Response is not valid JSON.")
            return 0
    else:
        # Handle cases where the subreddit does not exist or the response is empty
        print(f"Error: Request failed with status code {response.status_code}.")
        return 0

