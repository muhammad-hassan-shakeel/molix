import 'package:mocktail/mocktail.dart';
import 'package:molix/config/facade/network_facade.dart';

class NetworkFacadeMock extends Mock implements NetworkFacade {}

const movieResponse = '''
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/5YZbUmjbMa3ClvSW1Wj3D6XGolb.jpg",
      "genre_ids": [
        878,
        12,
        28
      ],
      "id": 447365,
      "original_language": "en",
      "original_title": "Guardians of the Galaxy Vol. 3",
      "overview": "Peter Quill, still reeling from the loss of Gamora, must rally his team around him to defend the universe along with protecting one of their own. A mission that, if not completed successfully, could quite possibly lead to the end of the Guardians as we know them.",
      "popularity": 6145.684,
      "poster_path": "/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg",
      "release_date": "2023-05-03",
      "title": "Guardians of the Galaxy Vol. 3",
      "video": false,
      "vote_average": 8.2,
      "vote_count": 2771
    },
    {
      "adult": false,
      "backdrop_path": "/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg",
      "genre_ids": [
        28,
        80,
        53
      ],
      "id": 385687,
      "original_language": "en",
      "original_title": "Fast X",
      "overview": "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
      "popularity": 2583.164,
      "poster_path": "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg",
      "release_date": "2023-05-17",
      "title": "Fast X",
      "video": false,
      "vote_average": 7.4,
      "vote_count": 2587
    },
    {
      "adult": false,
      "backdrop_path": "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg",
      "genre_ids": [
        14,
        28,
        12
      ],
      "id": 455476,
      "original_language": "en",
      "original_title": "Knights of the Zodiac",
      "overview": "When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?",
      "popularity": 2459.93,
      "poster_path": "/tBiUXvCqz34GDeuY7jK14QQdtat.jpg",
      "release_date": "2023-04-27",
      "title": "Knights of the Zodiac",
      "video": false,
      "vote_average": 6.5,
      "vote_count": 404
    },
    {
      "adult": false,
      "backdrop_path": "/zcySy6dnSmyqiichtDgO7AEeZoq.jpg",
      "genre_ids": [
        28,
        18,
        53
      ],
      "id": 254128,
      "original_language": "en",
      "original_title": "San Andreas",
      "overview": "In the aftermath of a massive earthquake in California, a rescue-chopper pilot makes a dangerous journey across the state in order to rescue his estranged daughter.",
      "popularity": 1799.907,
      "poster_path": "/2Gfjn962aaFSD6eST6QU3oLDZTo.jpg",
      "release_date": "2015-05-27",
      "title": "San Andreas",
      "video": false,
      "vote_average": 6.2,
      "vote_count": 7761
    },
    {
      "adult": false,
      "backdrop_path": "/woJbg7ZqidhpvqFGGMRhWQNoxwa.jpg",
      "genre_ids": [
        28,
        12,
        878
      ],
      "id": 667538,
      "original_language": "en",
      "original_title": "Transformers: Rise of the Beasts",
      "overview": "When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.",
      "popularity": 1971.248,
      "poster_path": "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg",
      "release_date": "2023-06-06",
      "title": "Transformers: Rise of the Beasts",
      "video": false,
      "vote_average": 7.3,
      "vote_count": 625
    },
    {
      "adult": false,
      "backdrop_path": "/rPBeEi1tU8IhQ9rbdnlLU0d0NR.jpg",
      "genre_ids": [
        28,
        12,
        18
      ],
      "id": 445651,
      "original_language": "en",
      "original_title": "The Darkest Minds",
      "overview": "After a disease kills 98% of America's children, the surviving 2% develop superpowers and are placed in internment camps. A 16-year-old girl escapes her camp and joins a group of other teens on the run from the government.",
      "popularity": 1380.194,
      "poster_path": "/94RaS52zmsqaiAe1TG20pdbJCZr.jpg",
      "release_date": "2018-07-25",
      "title": "The Darkest Minds",
      "video": false,
      "vote_average": 7,
      "vote_count": 2468
    },
    {
      "adult": false,
      "backdrop_path": "/euO884625eFLfKLoc0MtFs5QiOS.jpg",
      "genre_ids": [
        9648,
        53,
        28
      ],
      "id": 1070802,
      "original_language": "en",
      "original_title": "Confidential Informant",
      "overview": "During a crack epidemic two narcotics agents hunting for a cop killer. Hoping for leads, Moran and Thorton pay off a junkie informant. To provide for his wife and son, Moran involves the stool pigeon in a deadly scheme. This causes the partners to come under the scrutiny of a suspicious internal affairs agent.",
      "popularity": 1432.665,
      "poster_path": "/kCyAyqF6TKylJFuddaHtqq20b62.jpg",
      "release_date": "2023-06-27",
      "title": "Confidential Informant",
      "video": false,
      "vote_average": 6.3,
      "vote_count": 33
    },
    {
      "adult": false,
      "backdrop_path": "/PwI3EfasE9fVuXsmMu9ffJh0Re.jpg",
      "genre_ids": [
        27,
        9648,
        53
      ],
      "id": 406563,
      "original_language": "en",
      "original_title": "Insidious: The Last Key",
      "overview": "Parapsychologist Elise Rainier and her team travel to Five Keys, NM, to investigate a man’s claim of a haunting. Terror soon strikes when Rainier realizes that the house he lives in was her family’s old home.",
      "popularity": 1307.981,
      "poster_path": "/nb9fc9INMg8kQ8L7sE7XTNsZnUX.jpg",
      "release_date": "2018-01-03",
      "title": "Insidious: The Last Key",
      "video": false,
      "vote_average": 6.3,
      "vote_count": 2506
    },
    {
      "adult": false,
      "backdrop_path": "/7I6VUdPj6tQECNHdviJkUHD2u89.jpg",
      "genre_ids": [
        28,
        53,
        80
      ],
      "id": 603692,
      "original_language": "en",
      "original_title": "John Wick: Chapter 4",
      "overview": "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.",
      "popularity": 1241.495,
      "poster_path": "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
      "release_date": "2023-03-22",
      "title": "John Wick: Chapter 4",
      "video": false,
      "vote_average": 7.9,
      "vote_count": 3603
    },
    {
      "adult": false,
      "backdrop_path": "/4HodYYKEIsGOdinkGi2Ucz6X9i0.jpg",
      "genre_ids": [
        28,
        12,
        16,
        878
      ],
      "id": 569094,
      "original_language": "en",
      "original_title": "Spider-Man: Across the Spider-Verse",
      "overview": "After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.",
      "popularity": 1307.679,
      "poster_path": "/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
      "release_date": "2023-05-31",
      "title": "Spider-Man: Across the Spider-Verse",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 2159
    },
    {
      "adult": false,
      "backdrop_path": "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg",
      "genre_ids": [
        16,
        10751,
        12,
        14,
        35
      ],
      "id": 502356,
      "original_language": "en",
      "original_title": "The Super Mario Bros. Movie",
      "overview": "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
      "popularity": 1169.751,
      "poster_path": "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
      "release_date": "2023-04-05",
      "title": "The Super Mario Bros. Movie",
      "video": false,
      "vote_average": 7.8,
      "vote_count": 5528
    },
    {
      "adult": false,
      "backdrop_path": "/mV1HOCbUqx7nfFPwledYsvMYHrw.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 47964,
      "original_language": "en",
      "original_title": "A Good Day to Die Hard",
      "overview": "Iconoclastic, take-no-prisoners cop John McClane, finds himself for the first time on foreign soil after traveling to Moscow to help his wayward son Jack - unaware that Jack is really a highly-trained CIA operative out to stop a nuclear weapons heist. With the Russian underworld in pursuit, and battling a countdown to war, the two McClanes discover that their opposing methods make them unstoppable heroes.",
      "popularity": 1079.942,
      "poster_path": "/evxtv4e8Amm436Y5rW16RkGu8pX.jpg",
      "release_date": "2013-02-06",
      "title": "A Good Day to Die Hard",
      "video": false,
      "vote_average": 5.3,
      "vote_count": 5918
    },
    {
      "adult": false,
      "backdrop_path": "/zxnfMi4qW0bdAtcwCogrR9dRrqd.jpg",
      "genre_ids": [
        878,
        9648,
        53
      ],
      "id": 1103825,
      "original_language": "en",
      "original_title": "War of the Worlds: The Attack",
      "overview": "Three young astronomers fight to survive a deadly Martian invasion.",
      "popularity": 1036.516,
      "poster_path": "/c3CUKHtQUvPvp9NSFsKwYsPLAdW.jpg",
      "release_date": "2023-04-21",
      "title": "War of the Worlds: The Attack",
      "video": false,
      "vote_average": 5,
      "vote_count": 17
    },
    {
      "adult": false,
      "backdrop_path": "/84cS9oEm33jD05T0p39TbwADY8.jpg",
      "genre_ids": [
        28,
        18
      ],
      "id": 678512,
      "original_language": "en",
      "original_title": "Sound of Freedom",
      "overview": "The story of Tim Ballard, a former US government agent, who quits his job in order to devote his life to rescuing children from global sex traffickers.",
      "popularity": 1635.498,
      "poster_path": "/mx4O9OEvIB265VM3UATLslsSW5t.jpg",
      "release_date": "2023-07-03",
      "title": "Sound of Freedom",
      "video": false,
      "vote_average": 8.3,
      "vote_count": 41
    },
    {
      "adult": false,
      "backdrop_path": "/wRxLAw4l17LqiFcPLkobriPTZAw.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 697843,
      "original_language": "en",
      "original_title": "Extraction 2",
      "overview": "Tasked with extracting a family who is at the mercy of a Georgian gangster, Tyler Rake infiltrates one of the world's deadliest prisons in order to save them. But when the extraction gets hot, and the gangster dies in the heat of battle, his equally ruthless brother tracks down Rake and his team to Vienna, in order to get revenge.",
      "popularity": 1001.428,
      "poster_path": "/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg",
      "release_date": "2023-06-09",
      "title": "Extraction 2",
      "video": false,
      "vote_average": 7.6,
      "vote_count": 1267
    },
    {
      "adult": false,
      "backdrop_path": "/aO6hDsqTIAtQFUBoPWklmPFsSTW.jpg",
      "genre_ids": [
        27,
        9648,
        53
      ],
      "id": 614479,
      "original_language": "en",
      "original_title": "Insidious: The Red Door",
      "overview": "To put their demons to rest once and for all, Josh Lambert and a college-aged Dalton Lambert must go deeper into The Further than ever before, facing their family's dark past and a host of new and more horrifying terrors that lurk behind the red door.",
      "popularity": 992.841,
      "poster_path": "/uS1AIL7I1Ycgs8PTfqUeN6jYNsQ.jpg",
      "release_date": "2023-07-05",
      "title": "Insidious: The Red Door",
      "video": false,
      "vote_average": 5.8,
      "vote_count": 119
    },
    {
      "adult": false,
      "backdrop_path": "/qe0oK0A5ovrlgH39Ga13dxxw9MU.jpg",
      "genre_ids": [
        28,
        35,
        80
      ],
      "id": 1130818,
      "original_language": "en",
      "original_title": "Sheroes",
      "overview": "When four thick-as-thieves friends arrive in Thailand they quickly find themselves in over their heads. Fighting to stay alive they employ their unique set of skills and unleash their fierce loyalty in a heart-pumping battle for survival.",
      "popularity": 1426.462,
      "poster_path": "/itUAkQmihFmRxMYTa3AkvIzMCV4.jpg",
      "release_date": "2023-06-23",
      "title": "Sheroes",
      "video": false,
      "vote_average": 4.9,
      "vote_count": 28
    },
    {
      "adult": false,
      "backdrop_path": "/vw3zNfzvnVNF7nIjpiEgcdznfeC.jpg",
      "genre_ids": [
        16,
        28,
        14
      ],
      "id": 664767,
      "original_language": "en",
      "original_title": "Mortal Kombat Legends: Scorpion's Revenge",
      "overview": "After the vicious slaughter of his family by stone-cold mercenary Sub-Zero, Hanzo Hasashi is exiled to the torturous Netherrealm. There, in exchange for his servitude to the sinister Quan Chi, he’s given a chance to avenge his family – and is resurrected as Scorpion, a lost soul bent on revenge. Back on Earthrealm, Lord Raiden gathers a team of elite warriors – Shaolin monk Liu Kang, Special Forces officer Sonya Blade and action star Johnny Cage – an unlikely band of heroes with one chance to save humanity. To do this, they must defeat Shang Tsung’s horde of Outworld gladiators and reign over the Mortal Kombat tournament.",
      "popularity": 913.663,
      "poster_path": "/4VlXER3FImHeFuUjBShFamhIp9M.jpg",
      "release_date": "2020-04-12",
      "title": "Mortal Kombat Legends: Scorpion's Revenge",
      "video": false,
      "vote_average": 8.2,
      "vote_count": 1234
    },
    {
      "adult": false,
      "backdrop_path": "/qi6Edc1OPcyENecGtz8TF0DUr9e.jpg",
      "genre_ids": [
        27,
        9648,
        53
      ],
      "id": 423108,
      "original_language": "en",
      "original_title": "The Conjuring: The Devil Made Me Do It",
      "overview": "Paranormal investigators Ed and Lorraine Warren encounter what would become one of the most sensational cases from their files. The fight for the soul of a young boy takes them beyond anything they'd ever seen before, to mark the first time in U.S. history that a murder suspect would claim demonic possession as a defense.",
      "popularity": 888.691,
      "poster_path": "/xbSuFiJbbBWCkyCCKIMfuDCA4yV.jpg",
      "release_date": "2021-05-25",
      "title": "The Conjuring: The Devil Made Me Do It",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 5187
    },
    {
      "adult": false,
      "backdrop_path": "/cSYLX73WskxCgvpN3MtRkYUSj1T.jpg",
      "genre_ids": [
        16,
        35,
        10751,
        14,
        10749
      ],
      "id": 976573,
      "original_language": "en",
      "original_title": "Elemental",
      "overview": "In a city where fire, water, land and air residents live together, a fiery young woman and a go-with-the-flow guy will discover something elemental: how much they have in common.",
      "popularity": 1050.704,
      "poster_path": "/8riWcADI1ekEiBguVB9vkilhiQm.jpg",
      "release_date": "2023-06-14",
      "title": "Elemental",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 410
    }
  ],
  "total_pages": 39073,
  "total_results": 781452
}
''';
