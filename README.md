# Apod
Approach:

1. Protocol oriented programming and Delegation
2. MVP layers exposed to each other through protocols - to achieve maintainability, testability, reusability
3. UTs - remaining as I couldn't spend sufficient time. Can be done easily.

Basic features:
1. REST API integration - https://github.com/nasa/apod-api) - https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2021-11-2
2. Data - Date, title, image, video, explanation for the current day’s APOD 
3. UI - View with handling details above, Date selection
4. Sample responce:

For image:
	{
  "date": "2022-02-06",
  "explanation": "Welcome to planet Earth, the third planet from a star named the Sun.  The Earth is shaped like a sphere and composed mostly of rock.  Over 70 percent of the Earth's surface is water.  The planet has a relatively thin atmosphere composed mostly of nitrogen and oxygen.  The featured picture of Earth, dubbed The Blue Marble, was taken from Apollo 17 in 1972 and features Africa and Antarctica.  It is thought to be one of the most widely distributed photographs of any kind.  Earth has a single large Moon that is about 1/4 of its diameter and, from the planet's surface, is seen to have almost exactly the same angular size as the Sun.  With its abundance of liquid water, Earth supports a large variety of life forms, including potentially intelligent species such as dolphins and humans.  Please enjoy your stay on planet Earth.",
  "hdurl": "https://apod.nasa.gov/apod/image/2202/bluemarble_apollo17_3000.jpg",
  "media_type": "image",
  "service_version": "v1",
  "title": "Blue Marble Earth",
  "url": "https://apod.nasa.gov/apod/image/2202/bluemarble_apollo17_960.jpg"
}

For video:
{
  "date": "2021-10-11",
  "explanation": "What would it be like to fly over the largest moon in the Solar System? In June, the robotic Juno spacecraft flew past Jupiter's huge moon Ganymede and took images that have been digitally constructed into a detailed flyby. As the featured video begins, Juno swoops over the two-toned surface of the 2,000-km wide moon, revealing an icy alien landscape\u00a0filled with grooves and craters. The grooves are likely caused by shifting surface plates, while the craters are caused by violent impacts. Continuing on in its orbit, Juno then performed its\u00a034th close pass over Jupiter's clouds. The digitally-constructed video shows numerous swirling clouds in the north, colorful planet-circling zones and bands across the middle -- featuring several white-oval clouds from the String of Pearls, and finally more swirling clouds in the south.  Next September, Juno is scheduled to make a close pass over another of Jupiter's large moons: Europa.",
  "media_type": "video",
  "service_version": "v1",
  "title": "Juno Flyby of Ganymede and Jupiter",
  "url": "https://www.youtube.com/embed/CC7OJ7gFLvE?rel=0"
}


5. Use Kingfisher lib for image view - Didn’t require
6. Encodable and Decodable structs to store response
7. MVP - >

Presenter{
apodForDate(date) -> void
}

PresenterViewDelegate{
apodDetailsReceived()->ApodDetails
}

ViewController : PresenterViewDelegate{
	apodDetailsReceived()->ApodDetails{
		updateUI
	}
}
