#!/usr/bin/env python3

"""
prints the titles of ten top posts for a given subreddit
"""

from requests import get

def top_ten(subreddit):

    if subreddit is None or not isinstance(subreddit, str):
        print("None")

    user_agent = {'User_agent': 'Google Chrome Version 81.0.4044.129'}
    params = {'limit': 10}
    url = 'https://www.reddit.com/r/{}/hot/.json'.format(subreddit)


    response = get(url, headers=user_agent, params=params)
    results = response.json()


    try:
        my_data = results.get('data').get('chidren')

        for i in my_data:
            print(i.get('data').get('title'))

    except Exception:
        print("None")
