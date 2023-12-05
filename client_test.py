import requests


def main():
    response = requests.get(
        url="http://127.0.0.1/8080",
        data="hello",
    )
    print(response)


if __name__ == "__main__":
    main()
