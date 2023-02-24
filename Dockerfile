FROM python:3.7

RUN apt-get update 
RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils

#download and install chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

#install python dependencies
COPY requirements.txt requirements.txt
RUN pip install chromedriver-binary
RUN pip install -r ./requirements.txt 

#some envs
ENV APP_HOME /app 
ENV PORT 5000

#set workspace
WORKDIR ${APP_HOME}

#copy local files
COPY . . 

CMD exec gunicorn --bind :${PORT} --workers 1 --threads 8 main:app 
