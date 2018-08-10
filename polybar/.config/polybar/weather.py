#!/usr/bin/env python

import json
import urllib
import urllib.parse
import urllib.request
import os


def main():
    city = "Berkeley"
    api_key = "910e54f4cf0f7c9f5f9c6d3cfebcc7d2"

    try:
        data = urllib.parse.urlencode({'q': city, 'appid': api_key, 'units': 'imperial'})
        weather = json.loads(urllib.request.urlopen(
            'http://api.openweathermap.org/data/2.5/weather?' + data)
            .read())
        desc = weather['weather'][0]['description'].capitalize()
        temp = int(float(weather['main']['temp']))
        #return '{}, {}°F'.format(desc, temp)
        return '{}°F'.format(temp)
    except:
        return ''


if __name__ == "__main__":
	print(main())
