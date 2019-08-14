# pip install beautifulsoup4

Video_folder = 'Вкус Счастья'
TAGS_FILES = ['CXdLmKNeSLg.html']


def read_file():
    html = ''
    for f in TAGS_FILES:
        with open(Video_folder + '/tags/' + TAGS_FILES[0], 'r') as file:
            html += file.read().replace('\n', '')
    return html


def get_tags(html_doc):
    from bs4 import BeautifulSoup
    soup = BeautifulSoup(html_doc, 'html.parser')
    tags = soup.findAll("span", {"class": "tb-videolytics-tag"})
    array = []
    for tag in tags:
        tag = tag['title']
        array.append(tag)
    s_tags = ','.join(array)
    return s_tags


def main():
    html = read_file()
    tags = get_tags(html)
    pass


if __name__ == '__main__':
    main()
