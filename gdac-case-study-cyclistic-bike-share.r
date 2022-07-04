{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "fa78a8a3",
   "metadata": {
    "papermill": {
     "duration": 0.016483,
     "end_time": "2022-07-04T14:52:05.692872",
     "exception": false,
     "start_time": "2022-07-04T14:52:05.676389",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **This case study is part of the Google Data Analytics Professional Certificate.**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "44fe5def",
   "metadata": {
    "papermill": {
     "duration": 0.015118,
     "end_time": "2022-07-04T14:52:05.723830",
     "exception": false,
     "start_time": "2022-07-04T14:52:05.708712",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Scenario\n",
    "You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aba925d1",
   "metadata": {
    "papermill": {
     "duration": 0.015457,
     "end_time": "2022-07-04T14:52:05.754261",
     "exception": false,
     "start_time": "2022-07-04T14:52:05.738804",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# About the Company\n",
    "In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. \n",
    "Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c4577727",
   "metadata": {
    "papermill": {
     "duration": 0.015042,
     "end_time": "2022-07-04T14:52:05.784237",
     "exception": false,
     "start_time": "2022-07-04T14:52:05.769195",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 1: Collect Data"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1747ea1f",
   "metadata": {
    "papermill": {
     "duration": 0.014912,
     "end_time": "2022-07-04T14:52:05.814311",
     "exception": false,
     "start_time": "2022-07-04T14:52:05.799399",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Install required packages"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "9a907d9d",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:05.849164Z",
     "iopub.status.busy": "2022-07-04T14:52:05.846794Z",
     "iopub.status.idle": "2022-07-04T14:52:07.045915Z",
     "shell.execute_reply": "2022-07-04T14:52:07.043561Z"
    },
    "papermill": {
     "duration": 1.21886,
     "end_time": "2022-07-04T14:52:07.048505",
     "exception": false,
     "start_time": "2022-07-04T14:52:05.829645",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.7     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.9\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘zoo’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    as.Date, as.Date.numeric\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(\"tidyverse\")\n",
    "library(\"lubridate\")\n",
    "library(\"zoo\")\n",
    "library(\"janitor\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aa02473b",
   "metadata": {
    "papermill": {
     "duration": 0.015617,
     "end_time": "2022-07-04T14:52:07.080021",
     "exception": false,
     "start_time": "2022-07-04T14:52:07.064404",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Loading the files"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "fe8d90bc",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:07.140677Z",
     "iopub.status.busy": "2022-07-04T14:52:07.113258Z",
     "iopub.status.idle": "2022-07-04T14:52:42.688731Z",
     "shell.execute_reply": "2022-07-04T14:52:42.686385Z"
    },
    "papermill": {
     "duration": 35.595868,
     "end_time": "2022-07-04T14:52:42.692484",
     "exception": false,
     "start_time": "2022-07-04T14:52:07.096616",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“One or more parsing issues, see `problems()` for details”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m337230\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "Warning message:\n",
      "“One or more parsing issues, see `problems()` for details”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m531633\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "Warning message:\n",
      "“One or more parsing issues, see `problems()` for details”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m729595\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "Warning message:\n",
      "“One or more parsing issues, see `problems()` for details”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m822410\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "Warning message:\n",
      "“One or more parsing issues, see `problems()` for details”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m804352\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m756128\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m631226\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "Warning message:\n",
      "“One or more parsing issues, see `problems()` for details”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m359978\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m247540\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m103770\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m115609\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "Warning message:\n",
      "“One or more parsing issues, see `problems()` for details”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m284042\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (9): ride_id, rideable_type, started_at, ended_at, start_station_name, ...\n",
      "\u001b[32mdbl\u001b[39m  (5): start_lat, start_lng, end_lat, end_lng, day_of_week\n",
      "\u001b[34mtime\u001b[39m (1): ride_length\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "Apr_2021 <- read_csv(\"../input/cyclistic-trip-data/202104-divvy-tripdata.csv\")\n",
    "May_2021 <- read_csv(\"../input/cyclistic-trip-data/202105-divvy-tripdata.csv\")\n",
    "Jun_2021 <- read_csv(\"../input/cyclistic-trip-data/202106-divvy-tripdata.csv\")\n",
    "Jul_2021 <- read_csv(\"../input/cyclistic-trip-data/202107-divvy-tripdata.csv\")\n",
    "Aug_2021 <- read_csv(\"../input/cyclistic-trip-data/202108-divvy-tripdata.csv\")\n",
    "Sep_2021 <- read_csv(\"../input/cyclistic-trip-data/202109-divvy-tripdata.csv\")\n",
    "Oct_2021 <- read_csv(\"../input/cyclistic-trip-data/202110-divvy-tripdata.csv\")\n",
    "Nov_2021 <- read_csv(\"../input/cyclistic-trip-data/202111-divvy-tripdata.csv\")\n",
    "Dec_2021 <- read_csv(\"../input/cyclistic-trip-data/202112-divvy-tripdata.csv\")\n",
    "Jan_2022 <- read_csv(\"../input/cyclistic-trip-data/202201-divvy-tripdata.csv\")\n",
    "Feb_2022 <- read_csv(\"../input/cyclistic-trip-data/202202-divvy-tripdata.csv\")\n",
    "Mar_2022 <- read_csv(\"../input/cyclistic-trip-data/202203-divvy-tripdata.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "85aefaeb",
   "metadata": {
    "papermill": {
     "duration": 0.018594,
     "end_time": "2022-07-04T14:52:42.730998",
     "exception": false,
     "start_time": "2022-07-04T14:52:42.712404",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 2: Wrangle Data and Combine Files into a Single File\n",
    "## Compare column names for all the files"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "263228e2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:42.769473Z",
     "iopub.status.busy": "2022-07-04T14:52:42.767901Z",
     "iopub.status.idle": "2022-07-04T14:52:42.847420Z",
     "shell.execute_reply": "2022-07-04T14:52:42.845674Z"
    },
    "papermill": {
     "duration": 0.101277,
     "end_time": "2022-07-04T14:52:42.849820",
     "exception": false,
     "start_time": "2022-07-04T14:52:42.748543",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"ride_length\"        \"day_of_week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(Apr_2021)\n",
    "colnames(May_2021)\n",
    "colnames(Jun_2021)\n",
    "colnames(Jul_2021)\n",
    "colnames(Aug_2021)\n",
    "colnames(Sep_2021)\n",
    "colnames(Oct_2021)\n",
    "colnames(Nov_2021)\n",
    "colnames(Dec_2021)\n",
    "colnames(Jan_2022)\n",
    "colnames(Feb_2022)\n",
    "colnames(Mar_2022)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b3ec406a",
   "metadata": {
    "papermill": {
     "duration": 0.019716,
     "end_time": "2022-07-04T14:52:42.889720",
     "exception": false,
     "start_time": "2022-07-04T14:52:42.870004",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Inspect the dataframes and look for incongruencies"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "c47cb733",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:42.932509Z",
     "iopub.status.busy": "2022-07-04T14:52:42.931066Z",
     "iopub.status.idle": "2022-07-04T14:52:43.000296Z",
     "shell.execute_reply": "2022-07-04T14:52:42.997760Z"
    },
    "papermill": {
     "duration": 0.093218,
     "end_time": "2022-07-04T14:52:43.002707",
     "exception": false,
     "start_time": "2022-07-04T14:52:42.909489",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spec_tbl_df [337,230 × 15] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:337230] \"6C992BD37A98A63F\" \"1E0145613A209000\" \"E498E15508A80BAD\" \"1887262AD101C604\" ...\n",
      " $ rideable_type     : chr [1:337230] \"classic_bike\" \"docked_bike\" \"docked_bike\" \"classic_bike\" ...\n",
      " $ started_at        : chr [1:337230] \"12/04/2021 18:25\" \"27/04/2021 17:27\" \"03/04/2021 12:42\" \"17/04/2021 09:17\" ...\n",
      " $ ended_at          : chr [1:337230] \"12/04/2021 18:56\" \"27/04/2021 18:31\" \"07/04/2021 11:40\" \"17/04/2021 09:42\" ...\n",
      " $ start_station_name: chr [1:337230] \"State St & Pearson St\" \"Dorchester Ave & 49th St\" \"Loomis Blvd & 84th St\" \"Honore St & Division St\" ...\n",
      " $ start_station_id  : chr [1:337230] \"TA1307000061\" \"KA1503000069\" \"20121\" \"TA1305000034\" ...\n",
      " $ end_station_name  : chr [1:337230] \"Southport Ave & Waveland Ave\" \"Dorchester Ave & 49th St\" \"Loomis Blvd & 84th St\" \"Southport Ave & Waveland Ave\" ...\n",
      " $ end_station_id    : chr [1:337230] \"13235\" \"KA1503000069\" \"20121\" \"13235\" ...\n",
      " $ start_lat         : num [1:337230] 41.9 41.8 41.7 41.9 41.7 ...\n",
      " $ start_lng         : num [1:337230] -87.6 -87.6 -87.7 -87.7 -87.7 ...\n",
      " $ end_lat           : num [1:337230] 41.9 41.8 41.7 41.9 41.7 ...\n",
      " $ end_lng           : num [1:337230] -87.7 -87.6 -87.7 -87.7 -87.7 ...\n",
      " $ member_casual     : chr [1:337230] \"member\" \"casual\" \"casual\" \"member\" ...\n",
      " $ ride_length       : 'hms' num [1:337230] 00:31:19 01:04:18 22:57:39 00:25:06 ...\n",
      "  ..- attr(*, \"units\")= chr \"secs\"\n",
      " $ day_of_week       : num [1:337230] 2 3 7 7 7 1 7 3 2 7 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   ended_at = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   ride_length = \u001b[34mcol_time(format = \"\")\u001b[39m,\n",
      "  ..   day_of_week = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spec_tbl_df [531,633 × 15] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:531633] \"C809ED75D6160B2A\" \"DD59FDCE0ACACAF3\" \"0AB83CB88C43EFC2\" \"7881AC6D39110C60\" ...\n",
      " $ rideable_type     : chr [1:531633] \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr [1:531633] \"30/05/2021 11:58\" \"30/05/2021 11:29\" \"30/05/2021 14:24\" \"30/05/2021 14:25\" ...\n",
      " $ ended_at          : chr [1:531633] \"30/05/2021 12:10\" \"30/05/2021 12:14\" \"30/05/2021 14:25\" \"30/05/2021 14:41\" ...\n",
      " $ start_station_name: chr [1:531633] NA NA NA NA ...\n",
      " $ start_station_id  : chr [1:531633] NA NA NA NA ...\n",
      " $ end_station_name  : chr [1:531633] NA NA NA NA ...\n",
      " $ end_station_id    : chr [1:531633] NA NA NA NA ...\n",
      " $ start_lat         : num [1:531633] 41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num [1:531633] -87.6 -87.6 -87.7 -87.7 -87.7 ...\n",
      " $ end_lat           : num [1:531633] 41.9 41.8 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num [1:531633] -87.6 -87.6 -87.7 -87.7 -87.7 ...\n",
      " $ member_casual     : chr [1:531633] \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      " $ ride_length       : 'hms' num [1:531633] 00:12:24 00:44:55 00:01:12 00:15:13 ...\n",
      "  ..- attr(*, \"units\")= chr \"secs\"\n",
      " $ day_of_week       : num [1:531633] 1 1 1 1 1 1 1 4 4 3 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   ended_at = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   ride_length = \u001b[34mcol_time(format = \"\")\u001b[39m,\n",
      "  ..   day_of_week = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "str(Apr_2021)\n",
    "str(May_2021)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "57fde21f",
   "metadata": {
    "papermill": {
     "duration": 0.020891,
     "end_time": "2022-07-04T14:52:43.043974",
     "exception": false,
     "start_time": "2022-07-04T14:52:43.023083",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Stack individual  data frames into one big data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "0efd8ca4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:43.087377Z",
     "iopub.status.busy": "2022-07-04T14:52:43.085667Z",
     "iopub.status.idle": "2022-07-04T14:52:52.402775Z",
     "shell.execute_reply": "2022-07-04T14:52:52.401158Z"
    },
    "papermill": {
     "duration": 9.3417,
     "end_time": "2022-07-04T14:52:52.405753",
     "exception": false,
     "start_time": "2022-07-04T14:52:43.064053",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips <- bind_rows(Apr_2021, May_2021, Jun_2021, Jul_2021, Aug_2021, Sep_2021, Oct_2021, Nov_2021, Dec_2021, Jan_2022, Feb_2022, Mar_2022)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ae268026",
   "metadata": {
    "papermill": {
     "duration": 0.020569,
     "end_time": "2022-07-04T14:52:52.446623",
     "exception": false,
     "start_time": "2022-07-04T14:52:52.426054",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Rename columns to make them consistent"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "c0c51412",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:52.490067Z",
     "iopub.status.busy": "2022-07-04T14:52:52.488772Z",
     "iopub.status.idle": "2022-07-04T14:52:52.630245Z",
     "shell.execute_reply": "2022-07-04T14:52:52.628048Z"
    },
    "papermill": {
     "duration": 0.165423,
     "end_time": "2022-07-04T14:52:52.633154",
     "exception": false,
     "start_time": "2022-07-04T14:52:52.467731",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A spec_tbl_df: 5723513 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>bike_type</th><th scope=col>start_time</th><th scope=col>end_time</th><th scope=col>from_station</th><th scope=col>start_station_id</th><th scope=col>to_station</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>user_type</th><th scope=col>ride_length</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>6C992BD37A98A63F</td><td>classic_bike </td><td>12/04/2021 18:25</td><td>12/04/2021 18:56</td><td><span style=white-space:pre-wrap>State St &amp; Pearson St   </span></td><td>TA1307000061</td><td>Southport Ave &amp; Waveland Ave</td><td><span style=white-space:pre-wrap>13235       </span></td><td>41.89745</td><td>-87.62872</td><td>41.94815</td><td>-87.66394</td><td>member</td><td>00:31:19</td><td>2</td></tr>\n",
       "\t<tr><td>1E0145613A209000</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>27/04/2021 17:27</td><td>27/04/2021 18:31</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>01:04:18</td><td>3</td></tr>\n",
       "\t<tr><td>E498E15508A80BAD</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>03/04/2021 12:42</td><td>07/04/2021 11:40</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74149</td><td>-87.65841</td><td>41.74149</td><td>-87.65841</td><td>casual</td><td>22:57:39</td><td>7</td></tr>\n",
       "\t<tr><td>1887262AD101C604</td><td>classic_bike </td><td>17/04/2021 09:17</td><td>17/04/2021 09:42</td><td>Honore St &amp; Division St </td><td>TA1305000034</td><td>Southport Ave &amp; Waveland Ave</td><td><span style=white-space:pre-wrap>13235       </span></td><td>41.90312</td><td>-87.67394</td><td>41.94815</td><td>-87.66394</td><td>member</td><td>00:25:06</td><td>7</td></tr>\n",
       "\t<tr><td>C123548CAB2A32A5</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>03/04/2021 12:42</td><td>03/04/2021 14:13</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74149</td><td>-87.65841</td><td>41.74149</td><td>-87.65841</td><td>casual</td><td>01:31:17</td><td>7</td></tr>\n",
       "\t<tr><td>097E76F3651B1AC1</td><td>classic_bike </td><td>25/04/2021 18:43</td><td>25/04/2021 18:43</td><td><span style=white-space:pre-wrap>Clinton St &amp; Polk St    </span></td><td><span style=white-space:pre-wrap>15542       </span></td><td><span style=white-space:pre-wrap>Clinton St &amp; Polk St        </span></td><td><span style=white-space:pre-wrap>15542       </span></td><td>41.87147</td><td>-87.64095</td><td>41.87147</td><td>-87.64095</td><td>casual</td><td>00:00:41</td><td>1</td></tr>\n",
       "\t<tr><td>53C38EB01E6FA5C4</td><td>classic_bike </td><td>03/04/2021 16:28</td><td>03/04/2021 16:29</td><td><span style=white-space:pre-wrap>Ashland Ave &amp; 63rd St   </span></td><td><span style=white-space:pre-wrap>16948       </span></td><td><span style=white-space:pre-wrap>Ashland Ave &amp; 63rd St       </span></td><td><span style=white-space:pre-wrap>16948       </span></td><td>41.77937</td><td>-87.66484</td><td>41.77937</td><td>-87.66484</td><td>casual</td><td>00:01:26</td><td>7</td></tr>\n",
       "\t<tr><td>D53AC014EFD6E2BA</td><td>electric_bike</td><td>06/04/2021 16:35</td><td>06/04/2021 17:00</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80583</td><td>-87.59248</td><td>41.80580</td><td>-87.59266</td><td>casual</td><td>00:25:50</td><td>3</td></tr>\n",
       "\t<tr><td>6E2F7CA1FA9E0AFB</td><td>classic_bike </td><td>12/04/2021 15:22</td><td>12/04/2021 16:15</td><td><span style=white-space:pre-wrap>Ashland Ave &amp; 63rd St   </span></td><td><span style=white-space:pre-wrap>16948       </span></td><td><span style=white-space:pre-wrap>Ashland Ave &amp; 63rd St       </span></td><td><span style=white-space:pre-wrap>16948       </span></td><td>41.77937</td><td>-87.66484</td><td>41.77937</td><td>-87.66484</td><td>casual</td><td>00:52:54</td><td>2</td></tr>\n",
       "\t<tr><td>04218447AAC80BD1</td><td>classic_bike </td><td>24/04/2021 15:04</td><td>24/04/2021 15:06</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:01:21</td><td>7</td></tr>\n",
       "\t<tr><td>B45BBE0734834247</td><td>electric_bike</td><td>03/04/2021 18:03</td><td>03/04/2021 19:13</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74156</td><td>-87.65842</td><td>41.74160</td><td>-87.65842</td><td>casual</td><td>01:09:42</td><td>7</td></tr>\n",
       "\t<tr><td>70DEC4E102F00DC2</td><td>electric_bike</td><td>24/04/2021 18:01</td><td>24/04/2021 19:39</td><td><span style=white-space:pre-wrap>Halsted St &amp; 69th St    </span></td><td><span style=white-space:pre-wrap>15597       </span></td><td><span style=white-space:pre-wrap>Halsted St &amp; 69th St        </span></td><td><span style=white-space:pre-wrap>15597       </span></td><td>41.76901</td><td>-87.64463</td><td>41.76901</td><td>-87.64458</td><td>casual</td><td>01:37:31</td><td>7</td></tr>\n",
       "\t<tr><td>B33484FA16A9A0FE</td><td>classic_bike </td><td>27/04/2021 18:31</td><td>27/04/2021 19:17</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:45:28</td><td>3</td></tr>\n",
       "\t<tr><td>8670C65989291512</td><td>classic_bike </td><td>04/04/2021 14:19</td><td>04/04/2021 14:26</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:06:46</td><td>1</td></tr>\n",
       "\t<tr><td>EFF545B4881F0C25</td><td>classic_bike </td><td>13/04/2021 12:12</td><td>13/04/2021 13:12</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:59:21</td><td>3</td></tr>\n",
       "\t<tr><td>49658BDF5846360E</td><td>electric_bike</td><td>08/04/2021 17:59</td><td>08/04/2021 18:11</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80583</td><td>-87.59252</td><td>41.80594</td><td>-87.59247</td><td>casual</td><td>00:11:57</td><td>5</td></tr>\n",
       "\t<tr><td>E5261048A5E7365B</td><td>electric_bike</td><td>27/04/2021 16:22</td><td>27/04/2021 16:47</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74156</td><td>-87.65842</td><td>41.74157</td><td>-87.65844</td><td>casual</td><td>00:24:37</td><td>3</td></tr>\n",
       "\t<tr><td>9DADAD1E49747066</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>25/04/2021 17:42</td><td>25/04/2021 18:02</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:20:39</td><td>1</td></tr>\n",
       "\t<tr><td>440BBEEEEA9DD6FE</td><td>classic_bike </td><td>07/04/2021 14:24</td><td>07/04/2021 14:25</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:01:06</td><td>4</td></tr>\n",
       "\t<tr><td>B39DF385508E7DCF</td><td>classic_bike </td><td>27/04/2021 09:00</td><td>27/04/2021 09:30</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:30:21</td><td>3</td></tr>\n",
       "\t<tr><td>1E1D708751A45FBB</td><td>classic_bike </td><td>27/04/2021 18:20</td><td>27/04/2021 18:23</td><td><span style=white-space:pre-wrap>Clinton St &amp; Polk St    </span></td><td><span style=white-space:pre-wrap>15542       </span></td><td><span style=white-space:pre-wrap>Clinton St &amp; Polk St        </span></td><td><span style=white-space:pre-wrap>15542       </span></td><td>41.87147</td><td>-87.64095</td><td>41.87147</td><td>-87.64095</td><td>casual</td><td>00:03:04</td><td>3</td></tr>\n",
       "\t<tr><td>EF150999D6799927</td><td>electric_bike</td><td>26/04/2021 15:19</td><td>26/04/2021 15:47</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74154</td><td>-87.65837</td><td>41.74155</td><td>-87.65841</td><td>casual</td><td>00:28:25</td><td>2</td></tr>\n",
       "\t<tr><td>F01C5D9474B37874</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>27/04/2021 17:27</td><td>27/04/2021 17:56</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:28:42</td><td>3</td></tr>\n",
       "\t<tr><td>3241CB12D978A919</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>26/04/2021 16:39</td><td>26/04/2021 17:10</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:31:12</td><td>2</td></tr>\n",
       "\t<tr><td>3C1E34B72CF1DF6F</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>24/04/2021 14:13</td><td>24/04/2021 17:54</td><td><span style=white-space:pre-wrap>Halsted St &amp; 69th St    </span></td><td><span style=white-space:pre-wrap>15597       </span></td><td><span style=white-space:pre-wrap>Halsted St &amp; 69th St        </span></td><td><span style=white-space:pre-wrap>15597       </span></td><td>41.76906</td><td>-87.64461</td><td>41.76906</td><td>-87.64461</td><td>casual</td><td>03:41:02</td><td>7</td></tr>\n",
       "\t<tr><td>7780E5A193F16BAA</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>17/04/2021 12:19</td><td>17/04/2021 12:33</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:14:08</td><td>7</td></tr>\n",
       "\t<tr><td>A1250C4C180BDB7A</td><td>electric_bike</td><td>12/04/2021 13:28</td><td>12/04/2021 13:43</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80586</td><td>-87.59241</td><td>41.80585</td><td>-87.59250</td><td>casual</td><td>00:15:10</td><td>2</td></tr>\n",
       "\t<tr><td>DCE53F03D9E930BC</td><td>classic_bike </td><td>16/04/2021 19:12</td><td>16/04/2021 19:30</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>00:17:14</td><td>6</td></tr>\n",
       "\t<tr><td>C1C200854F4A4289</td><td>classic_bike </td><td>11/04/2021 17:12</td><td>11/04/2021 17:13</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74149</td><td>-87.65841</td><td>41.74149</td><td>-87.65841</td><td>casual</td><td>00:00:35</td><td>1</td></tr>\n",
       "\t<tr><td>4613417749115AB3</td><td>classic_bike </td><td>11/04/2021 17:13</td><td>11/04/2021 18:14</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74149</td><td>-87.65841</td><td>41.74149</td><td>-87.65841</td><td>casual</td><td>01:00:39</td><td>1</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>84932115AE84D51C</td><td>classic_bike </td><td>17/03/2022 17:31</td><td>17/03/2022 17:37</td><td><span style=white-space:pre-wrap>Clinton St &amp; Jackson Blvd             </span></td><td><span style=white-space:pre-wrap>638         </span></td><td><span style=white-space:pre-wrap>Aberdeen St &amp; Monroe St      </span></td><td><span style=white-space:pre-wrap>13156       </span></td><td>41.87832</td><td>-87.64098</td><td>41.88042</td><td>-87.65552</td><td>member</td><td>00:06:39</td><td>5</td></tr>\n",
       "\t<tr><td>5346BEADE60DF4CC</td><td>classic_bike </td><td>08/03/2022 17:42</td><td>08/03/2022 17:49</td><td><span style=white-space:pre-wrap>Clinton St &amp; Jackson Blvd             </span></td><td><span style=white-space:pre-wrap>638         </span></td><td><span style=white-space:pre-wrap>Aberdeen St &amp; Monroe St      </span></td><td><span style=white-space:pre-wrap>13156       </span></td><td>41.87832</td><td>-87.64098</td><td>41.88042</td><td>-87.65552</td><td>member</td><td>00:06:28</td><td>3</td></tr>\n",
       "\t<tr><td>799F0896CC2165A1</td><td>electric_bike</td><td>21/03/2022 15:09</td><td>21/03/2022 16:23</td><td><span style=white-space:pre-wrap>State St &amp; Van Buren St               </span></td><td>TA1305000035</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.87665</td><td>-87.62800</td><td>41.89228</td><td>-87.61204</td><td>casual</td><td>01:14:17</td><td>2</td></tr>\n",
       "\t<tr><td>4417CF79DFA8EFA0</td><td>electric_bike</td><td>15/03/2022 17:20</td><td>15/03/2022 17:37</td><td><span style=white-space:pre-wrap>Indiana Ave &amp; Roosevelt Rd            </span></td><td><span style=white-space:pre-wrap>SL-005      </span></td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.86804</td><td>-87.62311</td><td>41.89228</td><td>-87.61204</td><td>casual</td><td>00:17:44</td><td>3</td></tr>\n",
       "\t<tr><td>FD53CC132C891259</td><td>classic_bike </td><td>15/03/2022 17:16</td><td>15/03/2022 17:37</td><td><span style=white-space:pre-wrap>Indiana Ave &amp; Roosevelt Rd            </span></td><td><span style=white-space:pre-wrap>SL-005      </span></td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.86789</td><td>-87.62304</td><td>41.89228</td><td>-87.61204</td><td>casual</td><td>00:21:07</td><td>3</td></tr>\n",
       "\t<tr><td>3F0F55008C5FDD9A</td><td>classic_bike </td><td>10/03/2022 09:40</td><td>10/03/2022 09:42</td><td><span style=white-space:pre-wrap>Ravenswood Ave &amp; Irving Park Rd       </span></td><td>TA1307000149</td><td>Ravenswood Ave &amp; Berteau Ave </td><td>TA1309000018</td><td>41.95469</td><td>-87.67393</td><td>41.95792</td><td>-87.67357</td><td>member</td><td>00:02:05</td><td>5</td></tr>\n",
       "\t<tr><td>CA5BCBE936AA78AC</td><td>electric_bike</td><td>30/03/2022 08:52</td><td>30/03/2022 09:00</td><td><span style=white-space:pre-wrap>Larrabee St &amp; Kingsbury St            </span></td><td>TA1306000009</td><td>Franklin St &amp; Adams St (Temp)</td><td>TA1309000008</td><td>41.89762</td><td>-87.64330</td><td>41.87943</td><td>-87.63550</td><td>member</td><td>00:07:45</td><td>4</td></tr>\n",
       "\t<tr><td>D41190A1EACD4E5F</td><td>electric_bike</td><td>02/03/2022 09:15</td><td>02/03/2022 09:22</td><td><span style=white-space:pre-wrap>Larrabee St &amp; Kingsbury St            </span></td><td>TA1306000009</td><td>Franklin St &amp; Adams St (Temp)</td><td>TA1309000008</td><td>41.89772</td><td>-87.64291</td><td>41.87943</td><td>-87.63550</td><td>member</td><td>00:06:53</td><td>4</td></tr>\n",
       "\t<tr><td>4A317542FA86CD66</td><td>electric_bike</td><td>21/03/2022 19:50</td><td>21/03/2022 19:51</td><td><span style=white-space:pre-wrap>Aberdeen St &amp; Jackson Blvd            </span></td><td><span style=white-space:pre-wrap>13157       </span></td><td><span style=white-space:pre-wrap>Aberdeen St &amp; Monroe St      </span></td><td><span style=white-space:pre-wrap>13156       </span></td><td>41.87772</td><td>-87.65482</td><td>41.88042</td><td>-87.65552</td><td>member</td><td>00:01:06</td><td>2</td></tr>\n",
       "\t<tr><td>6E5550F87DDF75F6</td><td>electric_bike</td><td>22/03/2022 17:42</td><td>22/03/2022 17:43</td><td><span style=white-space:pre-wrap>Aberdeen St &amp; Jackson Blvd            </span></td><td><span style=white-space:pre-wrap>13157       </span></td><td><span style=white-space:pre-wrap>Aberdeen St &amp; Monroe St      </span></td><td><span style=white-space:pre-wrap>13156       </span></td><td>41.87771</td><td>-87.65493</td><td>41.88042</td><td>-87.65552</td><td>member</td><td>00:01:17</td><td>3</td></tr>\n",
       "\t<tr><td>5216A9EC09DB7A9F</td><td>electric_bike</td><td>05/03/2022 08:46</td><td>05/03/2022 08:49</td><td><span style=white-space:pre-wrap>Larrabee St &amp; Kingsbury St            </span></td><td>TA1306000009</td><td><span style=white-space:pre-wrap>Larrabee St &amp; Division St    </span></td><td>KA1504000079</td><td>41.89758</td><td>-87.64328</td><td>41.90349</td><td>-87.64335</td><td>member</td><td>00:02:44</td><td>7</td></tr>\n",
       "\t<tr><td>F8CC1C4C0D68C738</td><td>electric_bike</td><td>17/03/2022 16:35</td><td>17/03/2022 16:54</td><td><span style=white-space:pre-wrap>NA                                    </span></td><td><span style=white-space:pre-wrap>NA          </span></td><td><span style=white-space:pre-wrap>Sheridan Rd &amp; Greenleaf Ave  </span></td><td>KA1504000159</td><td>41.97000</td><td>-87.69000</td><td>42.01059</td><td>-87.66241</td><td>member</td><td>00:19:06</td><td>5</td></tr>\n",
       "\t<tr><td>E84C61616F07B3E6</td><td>electric_bike</td><td>16/03/2022 08:49</td><td>16/03/2022 08:54</td><td><span style=white-space:pre-wrap>Orleans St &amp; Merchandise Mart Plaza   </span></td><td>TA1305000022</td><td>Franklin St &amp; Adams St (Temp)</td><td>TA1309000008</td><td>41.88803</td><td>-87.63715</td><td>41.87943</td><td>-87.63550</td><td>member</td><td>00:04:40</td><td>4</td></tr>\n",
       "\t<tr><td>4C57806C54B9E7CE</td><td>electric_bike</td><td>09/03/2022 08:57</td><td>09/03/2022 09:01</td><td><span style=white-space:pre-wrap>Orleans St &amp; Merchandise Mart Plaza   </span></td><td>TA1305000022</td><td>Franklin St &amp; Adams St (Temp)</td><td>TA1309000008</td><td>41.88803</td><td>-87.63676</td><td>41.87943</td><td>-87.63550</td><td>member</td><td>00:04:37</td><td>4</td></tr>\n",
       "\t<tr><td>5C9B42397EC9AF78</td><td>electric_bike</td><td>15/03/2022 08:53</td><td>15/03/2022 08:58</td><td><span style=white-space:pre-wrap>Orleans St &amp; Merchandise Mart Plaza   </span></td><td>TA1305000022</td><td>Franklin St &amp; Adams St (Temp)</td><td>TA1309000008</td><td>41.88796</td><td>-87.63696</td><td>41.87943</td><td>-87.63550</td><td>member</td><td>00:04:34</td><td>3</td></tr>\n",
       "\t<tr><td>155C49327D325C09</td><td>electric_bike</td><td>22/03/2022 09:05</td><td>22/03/2022 09:09</td><td><span style=white-space:pre-wrap>Orleans St &amp; Merchandise Mart Plaza   </span></td><td>TA1305000022</td><td>Franklin St &amp; Adams St (Temp)</td><td>TA1309000008</td><td>41.88829</td><td>-87.63637</td><td>41.87943</td><td>-87.63550</td><td>member</td><td>00:04:25</td><td>3</td></tr>\n",
       "\t<tr><td>035E57A7EC67DDF4</td><td>electric_bike</td><td>25/03/2022 10:22</td><td>25/03/2022 10:37</td><td><span style=white-space:pre-wrap>New St &amp; Illinois St                  </span></td><td>TA1306000013</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.89068</td><td>-87.61809</td><td>41.89228</td><td>-87.61204</td><td>member</td><td>00:14:33</td><td>6</td></tr>\n",
       "\t<tr><td>C0AE978CAB160852</td><td>classic_bike </td><td>16/03/2022 13:40</td><td>16/03/2022 14:17</td><td>DuSable Lake Shore Dr &amp; Wellington Ave</td><td>TA1307000041</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.93669</td><td>-87.63683</td><td>41.89228</td><td>-87.61204</td><td>member</td><td>00:36:55</td><td>4</td></tr>\n",
       "\t<tr><td>5E0C2CDD50EBFC0B</td><td>classic_bike </td><td>16/03/2022 16:33</td><td>16/03/2022 17:33</td><td><span style=white-space:pre-wrap>Adler Planetarium                     </span></td><td><span style=white-space:pre-wrap>13431       </span></td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.86610</td><td>-87.60727</td><td>41.89228</td><td>-87.61204</td><td>casual</td><td>01:00:22</td><td>4</td></tr>\n",
       "\t<tr><td>E3A68406C43058A9</td><td>classic_bike </td><td>30/03/2022 07:31</td><td>30/03/2022 07:40</td><td><span style=white-space:pre-wrap>Stetson Ave &amp; South Water St          </span></td><td>TA1308000029</td><td>Franklin St &amp; Adams St (Temp)</td><td>TA1309000008</td><td>41.88683</td><td>-87.62232</td><td>41.87943</td><td>-87.63550</td><td>member</td><td>00:08:20</td><td>4</td></tr>\n",
       "\t<tr><td>025DA93C8471767C</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>05/03/2022 14:13</td><td>05/03/2022 14:45</td><td><span style=white-space:pre-wrap>Adler Planetarium                     </span></td><td><span style=white-space:pre-wrap>13431       </span></td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.86610</td><td>-87.60727</td><td>41.89228</td><td>-87.61204</td><td>casual</td><td>00:32:39</td><td>7</td></tr>\n",
       "\t<tr><td>7DF0716EA46DC1E1</td><td>classic_bike </td><td>16/03/2022 07:34</td><td>16/03/2022 07:44</td><td><span style=white-space:pre-wrap>Stetson Ave &amp; South Water St          </span></td><td>TA1308000029</td><td>Franklin St &amp; Adams St (Temp)</td><td>TA1309000008</td><td>41.88683</td><td>-87.62232</td><td>41.87943</td><td>-87.63550</td><td>member</td><td>00:10:33</td><td>4</td></tr>\n",
       "\t<tr><td>B591E39220EBC4BC</td><td>classic_bike </td><td>15/03/2022 18:09</td><td>15/03/2022 18:20</td><td><span style=white-space:pre-wrap>Daley Center Plaza                    </span></td><td>TA1306000010</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.88424</td><td>-87.62963</td><td>41.89228</td><td>-87.61204</td><td>member</td><td>00:11:14</td><td>3</td></tr>\n",
       "\t<tr><td>1CEE41690C73108B</td><td>classic_bike </td><td>21/03/2022 15:12</td><td>21/03/2022 15:23</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St                 </span></td><td><span style=white-space:pre-wrap>13042       </span></td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.90096</td><td>-87.62378</td><td>41.89228</td><td>-87.61204</td><td>member</td><td>00:10:44</td><td>2</td></tr>\n",
       "\t<tr><td>A2A6F07D3DF4D0D6</td><td>electric_bike</td><td>09/03/2022 20:29</td><td>09/03/2022 21:01</td><td><span style=white-space:pre-wrap>Sheridan Rd &amp; Irving Park Rd          </span></td><td><span style=white-space:pre-wrap>13063       </span></td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.95428</td><td>-87.65441</td><td>41.89228</td><td>-87.61204</td><td>casual</td><td>00:31:42</td><td>4</td></tr>\n",
       "\t<tr><td>E23BE3DB740BE3B4</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>13/03/2022 16:31</td><td>13/03/2022 16:39</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St                 </span></td><td><span style=white-space:pre-wrap>13042       </span></td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.90096</td><td>-87.62378</td><td>41.89228</td><td>-87.61204</td><td>casual</td><td>00:08:29</td><td>1</td></tr>\n",
       "\t<tr><td>15AF71F3220F2A75</td><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>09/03/2022 06:56</td><td>09/03/2022 07:42</td><td><span style=white-space:pre-wrap>Broadway &amp; Barry Ave                  </span></td><td><span style=white-space:pre-wrap>13137       </span></td><td>Ravenswood Ave &amp; Berteau Ave </td><td>TA1309000018</td><td>41.93758</td><td>-87.64410</td><td>41.95792</td><td>-87.67357</td><td>casual</td><td>00:46:12</td><td>4</td></tr>\n",
       "\t<tr><td>9C4CE6CC19F8225B</td><td>electric_bike</td><td>09/03/2022 15:55</td><td>09/03/2022 16:08</td><td><span style=white-space:pre-wrap>NA                                    </span></td><td><span style=white-space:pre-wrap>NA          </span></td><td><span style=white-space:pre-wrap>Albany Ave &amp; Montrose Ave    </span></td><td><span style=white-space:pre-wrap>15621       </span></td><td>41.94000</td><td>-87.71000</td><td>41.96104</td><td>-87.70587</td><td>member</td><td>00:13:28</td><td>4</td></tr>\n",
       "\t<tr><td>F4E136DEF696F3AE</td><td>electric_bike</td><td>21/03/2022 16:12</td><td>21/03/2022 16:18</td><td><span style=white-space:pre-wrap>NA                                    </span></td><td><span style=white-space:pre-wrap>NA          </span></td><td><span style=white-space:pre-wrap>Larrabee St &amp; Division St    </span></td><td>KA1504000079</td><td>41.91000</td><td>-87.65000</td><td>41.90349</td><td>-87.64335</td><td>member</td><td>00:05:40</td><td>2</td></tr>\n",
       "\t<tr><td>5AEC5F39AF711895</td><td>classic_bike </td><td>03/03/2022 18:13</td><td>03/03/2022 18:23</td><td><span style=white-space:pre-wrap>Clark St &amp; Randolph St                </span></td><td>TA1305000030</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave      </span></td><td><span style=white-space:pre-wrap>13022       </span></td><td>41.88458</td><td>-87.63189</td><td>41.89228</td><td>-87.61204</td><td>member</td><td>00:09:59</td><td>5</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A spec\\_tbl\\_df: 5723513 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " ride\\_id & bike\\_type & start\\_time & end\\_time & from\\_station & start\\_station\\_id & to\\_station & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & user\\_type & ride\\_length & day\\_of\\_week\\\\\n",
       " <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <time> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 6C992BD37A98A63F & classic\\_bike  & 12/04/2021 18:25 & 12/04/2021 18:56 & State St \\& Pearson St    & TA1307000061 & Southport Ave \\& Waveland Ave & 13235        & 41.89745 & -87.62872 & 41.94815 & -87.66394 & member & 00:31:19 & 2\\\\\n",
       "\t 1E0145613A209000 & docked\\_bike   & 27/04/2021 17:27 & 27/04/2021 18:31 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 01:04:18 & 3\\\\\n",
       "\t E498E15508A80BAD & docked\\_bike   & 03/04/2021 12:42 & 07/04/2021 11:40 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74149 & -87.65841 & 41.74149 & -87.65841 & casual & 22:57:39 & 7\\\\\n",
       "\t 1887262AD101C604 & classic\\_bike  & 17/04/2021 09:17 & 17/04/2021 09:42 & Honore St \\& Division St  & TA1305000034 & Southport Ave \\& Waveland Ave & 13235        & 41.90312 & -87.67394 & 41.94815 & -87.66394 & member & 00:25:06 & 7\\\\\n",
       "\t C123548CAB2A32A5 & docked\\_bike   & 03/04/2021 12:42 & 03/04/2021 14:13 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74149 & -87.65841 & 41.74149 & -87.65841 & casual & 01:31:17 & 7\\\\\n",
       "\t 097E76F3651B1AC1 & classic\\_bike  & 25/04/2021 18:43 & 25/04/2021 18:43 & Clinton St \\& Polk St     & 15542        & Clinton St \\& Polk St         & 15542        & 41.87147 & -87.64095 & 41.87147 & -87.64095 & casual & 00:00:41 & 1\\\\\n",
       "\t 53C38EB01E6FA5C4 & classic\\_bike  & 03/04/2021 16:28 & 03/04/2021 16:29 & Ashland Ave \\& 63rd St    & 16948        & Ashland Ave \\& 63rd St        & 16948        & 41.77937 & -87.66484 & 41.77937 & -87.66484 & casual & 00:01:26 & 7\\\\\n",
       "\t D53AC014EFD6E2BA & electric\\_bike & 06/04/2021 16:35 & 06/04/2021 17:00 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80583 & -87.59248 & 41.80580 & -87.59266 & casual & 00:25:50 & 3\\\\\n",
       "\t 6E2F7CA1FA9E0AFB & classic\\_bike  & 12/04/2021 15:22 & 12/04/2021 16:15 & Ashland Ave \\& 63rd St    & 16948        & Ashland Ave \\& 63rd St        & 16948        & 41.77937 & -87.66484 & 41.77937 & -87.66484 & casual & 00:52:54 & 2\\\\\n",
       "\t 04218447AAC80BD1 & classic\\_bike  & 24/04/2021 15:04 & 24/04/2021 15:06 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:01:21 & 7\\\\\n",
       "\t B45BBE0734834247 & electric\\_bike & 03/04/2021 18:03 & 03/04/2021 19:13 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74156 & -87.65842 & 41.74160 & -87.65842 & casual & 01:09:42 & 7\\\\\n",
       "\t 70DEC4E102F00DC2 & electric\\_bike & 24/04/2021 18:01 & 24/04/2021 19:39 & Halsted St \\& 69th St     & 15597        & Halsted St \\& 69th St         & 15597        & 41.76901 & -87.64463 & 41.76901 & -87.64458 & casual & 01:37:31 & 7\\\\\n",
       "\t B33484FA16A9A0FE & classic\\_bike  & 27/04/2021 18:31 & 27/04/2021 19:17 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:45:28 & 3\\\\\n",
       "\t 8670C65989291512 & classic\\_bike  & 04/04/2021 14:19 & 04/04/2021 14:26 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:06:46 & 1\\\\\n",
       "\t EFF545B4881F0C25 & classic\\_bike  & 13/04/2021 12:12 & 13/04/2021 13:12 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:59:21 & 3\\\\\n",
       "\t 49658BDF5846360E & electric\\_bike & 08/04/2021 17:59 & 08/04/2021 18:11 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80583 & -87.59252 & 41.80594 & -87.59247 & casual & 00:11:57 & 5\\\\\n",
       "\t E5261048A5E7365B & electric\\_bike & 27/04/2021 16:22 & 27/04/2021 16:47 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74156 & -87.65842 & 41.74157 & -87.65844 & casual & 00:24:37 & 3\\\\\n",
       "\t 9DADAD1E49747066 & docked\\_bike   & 25/04/2021 17:42 & 25/04/2021 18:02 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:20:39 & 1\\\\\n",
       "\t 440BBEEEEA9DD6FE & classic\\_bike  & 07/04/2021 14:24 & 07/04/2021 14:25 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:01:06 & 4\\\\\n",
       "\t B39DF385508E7DCF & classic\\_bike  & 27/04/2021 09:00 & 27/04/2021 09:30 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:30:21 & 3\\\\\n",
       "\t 1E1D708751A45FBB & classic\\_bike  & 27/04/2021 18:20 & 27/04/2021 18:23 & Clinton St \\& Polk St     & 15542        & Clinton St \\& Polk St         & 15542        & 41.87147 & -87.64095 & 41.87147 & -87.64095 & casual & 00:03:04 & 3\\\\\n",
       "\t EF150999D6799927 & electric\\_bike & 26/04/2021 15:19 & 26/04/2021 15:47 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74154 & -87.65837 & 41.74155 & -87.65841 & casual & 00:28:25 & 2\\\\\n",
       "\t F01C5D9474B37874 & docked\\_bike   & 27/04/2021 17:27 & 27/04/2021 17:56 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:28:42 & 3\\\\\n",
       "\t 3241CB12D978A919 & docked\\_bike   & 26/04/2021 16:39 & 26/04/2021 17:10 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:31:12 & 2\\\\\n",
       "\t 3C1E34B72CF1DF6F & docked\\_bike   & 24/04/2021 14:13 & 24/04/2021 17:54 & Halsted St \\& 69th St     & 15597        & Halsted St \\& 69th St         & 15597        & 41.76906 & -87.64461 & 41.76906 & -87.64461 & casual & 03:41:02 & 7\\\\\n",
       "\t 7780E5A193F16BAA & docked\\_bike   & 17/04/2021 12:19 & 17/04/2021 12:33 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:14:08 & 7\\\\\n",
       "\t A1250C4C180BDB7A & electric\\_bike & 12/04/2021 13:28 & 12/04/2021 13:43 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80586 & -87.59241 & 41.80585 & -87.59250 & casual & 00:15:10 & 2\\\\\n",
       "\t DCE53F03D9E930BC & classic\\_bike  & 16/04/2021 19:12 & 16/04/2021 19:30 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 00:17:14 & 6\\\\\n",
       "\t C1C200854F4A4289 & classic\\_bike  & 11/04/2021 17:12 & 11/04/2021 17:13 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74149 & -87.65841 & 41.74149 & -87.65841 & casual & 00:00:35 & 1\\\\\n",
       "\t 4613417749115AB3 & classic\\_bike  & 11/04/2021 17:13 & 11/04/2021 18:14 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74149 & -87.65841 & 41.74149 & -87.65841 & casual & 01:00:39 & 1\\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t 84932115AE84D51C & classic\\_bike  & 17/03/2022 17:31 & 17/03/2022 17:37 & Clinton St \\& Jackson Blvd              & 638          & Aberdeen St \\& Monroe St       & 13156        & 41.87832 & -87.64098 & 41.88042 & -87.65552 & member & 00:06:39 & 5\\\\\n",
       "\t 5346BEADE60DF4CC & classic\\_bike  & 08/03/2022 17:42 & 08/03/2022 17:49 & Clinton St \\& Jackson Blvd              & 638          & Aberdeen St \\& Monroe St       & 13156        & 41.87832 & -87.64098 & 41.88042 & -87.65552 & member & 00:06:28 & 3\\\\\n",
       "\t 799F0896CC2165A1 & electric\\_bike & 21/03/2022 15:09 & 21/03/2022 16:23 & State St \\& Van Buren St                & TA1305000035 & Streeter Dr \\& Grand Ave       & 13022        & 41.87665 & -87.62800 & 41.89228 & -87.61204 & casual & 01:14:17 & 2\\\\\n",
       "\t 4417CF79DFA8EFA0 & electric\\_bike & 15/03/2022 17:20 & 15/03/2022 17:37 & Indiana Ave \\& Roosevelt Rd             & SL-005       & Streeter Dr \\& Grand Ave       & 13022        & 41.86804 & -87.62311 & 41.89228 & -87.61204 & casual & 00:17:44 & 3\\\\\n",
       "\t FD53CC132C891259 & classic\\_bike  & 15/03/2022 17:16 & 15/03/2022 17:37 & Indiana Ave \\& Roosevelt Rd             & SL-005       & Streeter Dr \\& Grand Ave       & 13022        & 41.86789 & -87.62304 & 41.89228 & -87.61204 & casual & 00:21:07 & 3\\\\\n",
       "\t 3F0F55008C5FDD9A & classic\\_bike  & 10/03/2022 09:40 & 10/03/2022 09:42 & Ravenswood Ave \\& Irving Park Rd        & TA1307000149 & Ravenswood Ave \\& Berteau Ave  & TA1309000018 & 41.95469 & -87.67393 & 41.95792 & -87.67357 & member & 00:02:05 & 5\\\\\n",
       "\t CA5BCBE936AA78AC & electric\\_bike & 30/03/2022 08:52 & 30/03/2022 09:00 & Larrabee St \\& Kingsbury St             & TA1306000009 & Franklin St \\& Adams St (Temp) & TA1309000008 & 41.89762 & -87.64330 & 41.87943 & -87.63550 & member & 00:07:45 & 4\\\\\n",
       "\t D41190A1EACD4E5F & electric\\_bike & 02/03/2022 09:15 & 02/03/2022 09:22 & Larrabee St \\& Kingsbury St             & TA1306000009 & Franklin St \\& Adams St (Temp) & TA1309000008 & 41.89772 & -87.64291 & 41.87943 & -87.63550 & member & 00:06:53 & 4\\\\\n",
       "\t 4A317542FA86CD66 & electric\\_bike & 21/03/2022 19:50 & 21/03/2022 19:51 & Aberdeen St \\& Jackson Blvd             & 13157        & Aberdeen St \\& Monroe St       & 13156        & 41.87772 & -87.65482 & 41.88042 & -87.65552 & member & 00:01:06 & 2\\\\\n",
       "\t 6E5550F87DDF75F6 & electric\\_bike & 22/03/2022 17:42 & 22/03/2022 17:43 & Aberdeen St \\& Jackson Blvd             & 13157        & Aberdeen St \\& Monroe St       & 13156        & 41.87771 & -87.65493 & 41.88042 & -87.65552 & member & 00:01:17 & 3\\\\\n",
       "\t 5216A9EC09DB7A9F & electric\\_bike & 05/03/2022 08:46 & 05/03/2022 08:49 & Larrabee St \\& Kingsbury St             & TA1306000009 & Larrabee St \\& Division St     & KA1504000079 & 41.89758 & -87.64328 & 41.90349 & -87.64335 & member & 00:02:44 & 7\\\\\n",
       "\t F8CC1C4C0D68C738 & electric\\_bike & 17/03/2022 16:35 & 17/03/2022 16:54 & NA                                     & NA           & Sheridan Rd \\& Greenleaf Ave   & KA1504000159 & 41.97000 & -87.69000 & 42.01059 & -87.66241 & member & 00:19:06 & 5\\\\\n",
       "\t E84C61616F07B3E6 & electric\\_bike & 16/03/2022 08:49 & 16/03/2022 08:54 & Orleans St \\& Merchandise Mart Plaza    & TA1305000022 & Franklin St \\& Adams St (Temp) & TA1309000008 & 41.88803 & -87.63715 & 41.87943 & -87.63550 & member & 00:04:40 & 4\\\\\n",
       "\t 4C57806C54B9E7CE & electric\\_bike & 09/03/2022 08:57 & 09/03/2022 09:01 & Orleans St \\& Merchandise Mart Plaza    & TA1305000022 & Franklin St \\& Adams St (Temp) & TA1309000008 & 41.88803 & -87.63676 & 41.87943 & -87.63550 & member & 00:04:37 & 4\\\\\n",
       "\t 5C9B42397EC9AF78 & electric\\_bike & 15/03/2022 08:53 & 15/03/2022 08:58 & Orleans St \\& Merchandise Mart Plaza    & TA1305000022 & Franklin St \\& Adams St (Temp) & TA1309000008 & 41.88796 & -87.63696 & 41.87943 & -87.63550 & member & 00:04:34 & 3\\\\\n",
       "\t 155C49327D325C09 & electric\\_bike & 22/03/2022 09:05 & 22/03/2022 09:09 & Orleans St \\& Merchandise Mart Plaza    & TA1305000022 & Franklin St \\& Adams St (Temp) & TA1309000008 & 41.88829 & -87.63637 & 41.87943 & -87.63550 & member & 00:04:25 & 3\\\\\n",
       "\t 035E57A7EC67DDF4 & electric\\_bike & 25/03/2022 10:22 & 25/03/2022 10:37 & New St \\& Illinois St                   & TA1306000013 & Streeter Dr \\& Grand Ave       & 13022        & 41.89068 & -87.61809 & 41.89228 & -87.61204 & member & 00:14:33 & 6\\\\\n",
       "\t C0AE978CAB160852 & classic\\_bike  & 16/03/2022 13:40 & 16/03/2022 14:17 & DuSable Lake Shore Dr \\& Wellington Ave & TA1307000041 & Streeter Dr \\& Grand Ave       & 13022        & 41.93669 & -87.63683 & 41.89228 & -87.61204 & member & 00:36:55 & 4\\\\\n",
       "\t 5E0C2CDD50EBFC0B & classic\\_bike  & 16/03/2022 16:33 & 16/03/2022 17:33 & Adler Planetarium                      & 13431        & Streeter Dr \\& Grand Ave       & 13022        & 41.86610 & -87.60727 & 41.89228 & -87.61204 & casual & 01:00:22 & 4\\\\\n",
       "\t E3A68406C43058A9 & classic\\_bike  & 30/03/2022 07:31 & 30/03/2022 07:40 & Stetson Ave \\& South Water St           & TA1308000029 & Franklin St \\& Adams St (Temp) & TA1309000008 & 41.88683 & -87.62232 & 41.87943 & -87.63550 & member & 00:08:20 & 4\\\\\n",
       "\t 025DA93C8471767C & docked\\_bike   & 05/03/2022 14:13 & 05/03/2022 14:45 & Adler Planetarium                      & 13431        & Streeter Dr \\& Grand Ave       & 13022        & 41.86610 & -87.60727 & 41.89228 & -87.61204 & casual & 00:32:39 & 7\\\\\n",
       "\t 7DF0716EA46DC1E1 & classic\\_bike  & 16/03/2022 07:34 & 16/03/2022 07:44 & Stetson Ave \\& South Water St           & TA1308000029 & Franklin St \\& Adams St (Temp) & TA1309000008 & 41.88683 & -87.62232 & 41.87943 & -87.63550 & member & 00:10:33 & 4\\\\\n",
       "\t B591E39220EBC4BC & classic\\_bike  & 15/03/2022 18:09 & 15/03/2022 18:20 & Daley Center Plaza                     & TA1306000010 & Streeter Dr \\& Grand Ave       & 13022        & 41.88424 & -87.62963 & 41.89228 & -87.61204 & member & 00:11:14 & 3\\\\\n",
       "\t 1CEE41690C73108B & classic\\_bike  & 21/03/2022 15:12 & 21/03/2022 15:23 & Michigan Ave \\& Oak St                  & 13042        & Streeter Dr \\& Grand Ave       & 13022        & 41.90096 & -87.62378 & 41.89228 & -87.61204 & member & 00:10:44 & 2\\\\\n",
       "\t A2A6F07D3DF4D0D6 & electric\\_bike & 09/03/2022 20:29 & 09/03/2022 21:01 & Sheridan Rd \\& Irving Park Rd           & 13063        & Streeter Dr \\& Grand Ave       & 13022        & 41.95428 & -87.65441 & 41.89228 & -87.61204 & casual & 00:31:42 & 4\\\\\n",
       "\t E23BE3DB740BE3B4 & docked\\_bike   & 13/03/2022 16:31 & 13/03/2022 16:39 & Michigan Ave \\& Oak St                  & 13042        & Streeter Dr \\& Grand Ave       & 13022        & 41.90096 & -87.62378 & 41.89228 & -87.61204 & casual & 00:08:29 & 1\\\\\n",
       "\t 15AF71F3220F2A75 & docked\\_bike   & 09/03/2022 06:56 & 09/03/2022 07:42 & Broadway \\& Barry Ave                   & 13137        & Ravenswood Ave \\& Berteau Ave  & TA1309000018 & 41.93758 & -87.64410 & 41.95792 & -87.67357 & casual & 00:46:12 & 4\\\\\n",
       "\t 9C4CE6CC19F8225B & electric\\_bike & 09/03/2022 15:55 & 09/03/2022 16:08 & NA                                     & NA           & Albany Ave \\& Montrose Ave     & 15621        & 41.94000 & -87.71000 & 41.96104 & -87.70587 & member & 00:13:28 & 4\\\\\n",
       "\t F4E136DEF696F3AE & electric\\_bike & 21/03/2022 16:12 & 21/03/2022 16:18 & NA                                     & NA           & Larrabee St \\& Division St     & KA1504000079 & 41.91000 & -87.65000 & 41.90349 & -87.64335 & member & 00:05:40 & 2\\\\\n",
       "\t 5AEC5F39AF711895 & classic\\_bike  & 03/03/2022 18:13 & 03/03/2022 18:23 & Clark St \\& Randolph St                 & TA1305000030 & Streeter Dr \\& Grand Ave       & 13022        & 41.88458 & -87.63189 & 41.89228 & -87.61204 & member & 00:09:59 & 5\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A spec_tbl_df: 5723513 × 15\n",
       "\n",
       "| ride_id &lt;chr&gt; | bike_type &lt;chr&gt; | start_time &lt;chr&gt; | end_time &lt;chr&gt; | from_station &lt;chr&gt; | start_station_id &lt;chr&gt; | to_station &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | user_type &lt;chr&gt; | ride_length &lt;time&gt; | day_of_week &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 6C992BD37A98A63F | classic_bike  | 12/04/2021 18:25 | 12/04/2021 18:56 | State St &amp; Pearson St    | TA1307000061 | Southport Ave &amp; Waveland Ave | 13235        | 41.89745 | -87.62872 | 41.94815 | -87.66394 | member | 00:31:19 | 2 |\n",
       "| 1E0145613A209000 | docked_bike   | 27/04/2021 17:27 | 27/04/2021 18:31 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 01:04:18 | 3 |\n",
       "| E498E15508A80BAD | docked_bike   | 03/04/2021 12:42 | 07/04/2021 11:40 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74149 | -87.65841 | 41.74149 | -87.65841 | casual | 22:57:39 | 7 |\n",
       "| 1887262AD101C604 | classic_bike  | 17/04/2021 09:17 | 17/04/2021 09:42 | Honore St &amp; Division St  | TA1305000034 | Southport Ave &amp; Waveland Ave | 13235        | 41.90312 | -87.67394 | 41.94815 | -87.66394 | member | 00:25:06 | 7 |\n",
       "| C123548CAB2A32A5 | docked_bike   | 03/04/2021 12:42 | 03/04/2021 14:13 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74149 | -87.65841 | 41.74149 | -87.65841 | casual | 01:31:17 | 7 |\n",
       "| 097E76F3651B1AC1 | classic_bike  | 25/04/2021 18:43 | 25/04/2021 18:43 | Clinton St &amp; Polk St     | 15542        | Clinton St &amp; Polk St         | 15542        | 41.87147 | -87.64095 | 41.87147 | -87.64095 | casual | 00:00:41 | 1 |\n",
       "| 53C38EB01E6FA5C4 | classic_bike  | 03/04/2021 16:28 | 03/04/2021 16:29 | Ashland Ave &amp; 63rd St    | 16948        | Ashland Ave &amp; 63rd St        | 16948        | 41.77937 | -87.66484 | 41.77937 | -87.66484 | casual | 00:01:26 | 7 |\n",
       "| D53AC014EFD6E2BA | electric_bike | 06/04/2021 16:35 | 06/04/2021 17:00 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80583 | -87.59248 | 41.80580 | -87.59266 | casual | 00:25:50 | 3 |\n",
       "| 6E2F7CA1FA9E0AFB | classic_bike  | 12/04/2021 15:22 | 12/04/2021 16:15 | Ashland Ave &amp; 63rd St    | 16948        | Ashland Ave &amp; 63rd St        | 16948        | 41.77937 | -87.66484 | 41.77937 | -87.66484 | casual | 00:52:54 | 2 |\n",
       "| 04218447AAC80BD1 | classic_bike  | 24/04/2021 15:04 | 24/04/2021 15:06 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:01:21 | 7 |\n",
       "| B45BBE0734834247 | electric_bike | 03/04/2021 18:03 | 03/04/2021 19:13 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74156 | -87.65842 | 41.74160 | -87.65842 | casual | 01:09:42 | 7 |\n",
       "| 70DEC4E102F00DC2 | electric_bike | 24/04/2021 18:01 | 24/04/2021 19:39 | Halsted St &amp; 69th St     | 15597        | Halsted St &amp; 69th St         | 15597        | 41.76901 | -87.64463 | 41.76901 | -87.64458 | casual | 01:37:31 | 7 |\n",
       "| B33484FA16A9A0FE | classic_bike  | 27/04/2021 18:31 | 27/04/2021 19:17 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:45:28 | 3 |\n",
       "| 8670C65989291512 | classic_bike  | 04/04/2021 14:19 | 04/04/2021 14:26 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:06:46 | 1 |\n",
       "| EFF545B4881F0C25 | classic_bike  | 13/04/2021 12:12 | 13/04/2021 13:12 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:59:21 | 3 |\n",
       "| 49658BDF5846360E | electric_bike | 08/04/2021 17:59 | 08/04/2021 18:11 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80583 | -87.59252 | 41.80594 | -87.59247 | casual | 00:11:57 | 5 |\n",
       "| E5261048A5E7365B | electric_bike | 27/04/2021 16:22 | 27/04/2021 16:47 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74156 | -87.65842 | 41.74157 | -87.65844 | casual | 00:24:37 | 3 |\n",
       "| 9DADAD1E49747066 | docked_bike   | 25/04/2021 17:42 | 25/04/2021 18:02 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:20:39 | 1 |\n",
       "| 440BBEEEEA9DD6FE | classic_bike  | 07/04/2021 14:24 | 07/04/2021 14:25 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:01:06 | 4 |\n",
       "| B39DF385508E7DCF | classic_bike  | 27/04/2021 09:00 | 27/04/2021 09:30 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:30:21 | 3 |\n",
       "| 1E1D708751A45FBB | classic_bike  | 27/04/2021 18:20 | 27/04/2021 18:23 | Clinton St &amp; Polk St     | 15542        | Clinton St &amp; Polk St         | 15542        | 41.87147 | -87.64095 | 41.87147 | -87.64095 | casual | 00:03:04 | 3 |\n",
       "| EF150999D6799927 | electric_bike | 26/04/2021 15:19 | 26/04/2021 15:47 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74154 | -87.65837 | 41.74155 | -87.65841 | casual | 00:28:25 | 2 |\n",
       "| F01C5D9474B37874 | docked_bike   | 27/04/2021 17:27 | 27/04/2021 17:56 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:28:42 | 3 |\n",
       "| 3241CB12D978A919 | docked_bike   | 26/04/2021 16:39 | 26/04/2021 17:10 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:31:12 | 2 |\n",
       "| 3C1E34B72CF1DF6F | docked_bike   | 24/04/2021 14:13 | 24/04/2021 17:54 | Halsted St &amp; 69th St     | 15597        | Halsted St &amp; 69th St         | 15597        | 41.76906 | -87.64461 | 41.76906 | -87.64461 | casual | 03:41:02 | 7 |\n",
       "| 7780E5A193F16BAA | docked_bike   | 17/04/2021 12:19 | 17/04/2021 12:33 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:14:08 | 7 |\n",
       "| A1250C4C180BDB7A | electric_bike | 12/04/2021 13:28 | 12/04/2021 13:43 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80586 | -87.59241 | 41.80585 | -87.59250 | casual | 00:15:10 | 2 |\n",
       "| DCE53F03D9E930BC | classic_bike  | 16/04/2021 19:12 | 16/04/2021 19:30 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 00:17:14 | 6 |\n",
       "| C1C200854F4A4289 | classic_bike  | 11/04/2021 17:12 | 11/04/2021 17:13 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74149 | -87.65841 | 41.74149 | -87.65841 | casual | 00:00:35 | 1 |\n",
       "| 4613417749115AB3 | classic_bike  | 11/04/2021 17:13 | 11/04/2021 18:14 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74149 | -87.65841 | 41.74149 | -87.65841 | casual | 01:00:39 | 1 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 84932115AE84D51C | classic_bike  | 17/03/2022 17:31 | 17/03/2022 17:37 | Clinton St &amp; Jackson Blvd              | 638          | Aberdeen St &amp; Monroe St       | 13156        | 41.87832 | -87.64098 | 41.88042 | -87.65552 | member | 00:06:39 | 5 |\n",
       "| 5346BEADE60DF4CC | classic_bike  | 08/03/2022 17:42 | 08/03/2022 17:49 | Clinton St &amp; Jackson Blvd              | 638          | Aberdeen St &amp; Monroe St       | 13156        | 41.87832 | -87.64098 | 41.88042 | -87.65552 | member | 00:06:28 | 3 |\n",
       "| 799F0896CC2165A1 | electric_bike | 21/03/2022 15:09 | 21/03/2022 16:23 | State St &amp; Van Buren St                | TA1305000035 | Streeter Dr &amp; Grand Ave       | 13022        | 41.87665 | -87.62800 | 41.89228 | -87.61204 | casual | 01:14:17 | 2 |\n",
       "| 4417CF79DFA8EFA0 | electric_bike | 15/03/2022 17:20 | 15/03/2022 17:37 | Indiana Ave &amp; Roosevelt Rd             | SL-005       | Streeter Dr &amp; Grand Ave       | 13022        | 41.86804 | -87.62311 | 41.89228 | -87.61204 | casual | 00:17:44 | 3 |\n",
       "| FD53CC132C891259 | classic_bike  | 15/03/2022 17:16 | 15/03/2022 17:37 | Indiana Ave &amp; Roosevelt Rd             | SL-005       | Streeter Dr &amp; Grand Ave       | 13022        | 41.86789 | -87.62304 | 41.89228 | -87.61204 | casual | 00:21:07 | 3 |\n",
       "| 3F0F55008C5FDD9A | classic_bike  | 10/03/2022 09:40 | 10/03/2022 09:42 | Ravenswood Ave &amp; Irving Park Rd        | TA1307000149 | Ravenswood Ave &amp; Berteau Ave  | TA1309000018 | 41.95469 | -87.67393 | 41.95792 | -87.67357 | member | 00:02:05 | 5 |\n",
       "| CA5BCBE936AA78AC | electric_bike | 30/03/2022 08:52 | 30/03/2022 09:00 | Larrabee St &amp; Kingsbury St             | TA1306000009 | Franklin St &amp; Adams St (Temp) | TA1309000008 | 41.89762 | -87.64330 | 41.87943 | -87.63550 | member | 00:07:45 | 4 |\n",
       "| D41190A1EACD4E5F | electric_bike | 02/03/2022 09:15 | 02/03/2022 09:22 | Larrabee St &amp; Kingsbury St             | TA1306000009 | Franklin St &amp; Adams St (Temp) | TA1309000008 | 41.89772 | -87.64291 | 41.87943 | -87.63550 | member | 00:06:53 | 4 |\n",
       "| 4A317542FA86CD66 | electric_bike | 21/03/2022 19:50 | 21/03/2022 19:51 | Aberdeen St &amp; Jackson Blvd             | 13157        | Aberdeen St &amp; Monroe St       | 13156        | 41.87772 | -87.65482 | 41.88042 | -87.65552 | member | 00:01:06 | 2 |\n",
       "| 6E5550F87DDF75F6 | electric_bike | 22/03/2022 17:42 | 22/03/2022 17:43 | Aberdeen St &amp; Jackson Blvd             | 13157        | Aberdeen St &amp; Monroe St       | 13156        | 41.87771 | -87.65493 | 41.88042 | -87.65552 | member | 00:01:17 | 3 |\n",
       "| 5216A9EC09DB7A9F | electric_bike | 05/03/2022 08:46 | 05/03/2022 08:49 | Larrabee St &amp; Kingsbury St             | TA1306000009 | Larrabee St &amp; Division St     | KA1504000079 | 41.89758 | -87.64328 | 41.90349 | -87.64335 | member | 00:02:44 | 7 |\n",
       "| F8CC1C4C0D68C738 | electric_bike | 17/03/2022 16:35 | 17/03/2022 16:54 | NA                                     | NA           | Sheridan Rd &amp; Greenleaf Ave   | KA1504000159 | 41.97000 | -87.69000 | 42.01059 | -87.66241 | member | 00:19:06 | 5 |\n",
       "| E84C61616F07B3E6 | electric_bike | 16/03/2022 08:49 | 16/03/2022 08:54 | Orleans St &amp; Merchandise Mart Plaza    | TA1305000022 | Franklin St &amp; Adams St (Temp) | TA1309000008 | 41.88803 | -87.63715 | 41.87943 | -87.63550 | member | 00:04:40 | 4 |\n",
       "| 4C57806C54B9E7CE | electric_bike | 09/03/2022 08:57 | 09/03/2022 09:01 | Orleans St &amp; Merchandise Mart Plaza    | TA1305000022 | Franklin St &amp; Adams St (Temp) | TA1309000008 | 41.88803 | -87.63676 | 41.87943 | -87.63550 | member | 00:04:37 | 4 |\n",
       "| 5C9B42397EC9AF78 | electric_bike | 15/03/2022 08:53 | 15/03/2022 08:58 | Orleans St &amp; Merchandise Mart Plaza    | TA1305000022 | Franklin St &amp; Adams St (Temp) | TA1309000008 | 41.88796 | -87.63696 | 41.87943 | -87.63550 | member | 00:04:34 | 3 |\n",
       "| 155C49327D325C09 | electric_bike | 22/03/2022 09:05 | 22/03/2022 09:09 | Orleans St &amp; Merchandise Mart Plaza    | TA1305000022 | Franklin St &amp; Adams St (Temp) | TA1309000008 | 41.88829 | -87.63637 | 41.87943 | -87.63550 | member | 00:04:25 | 3 |\n",
       "| 035E57A7EC67DDF4 | electric_bike | 25/03/2022 10:22 | 25/03/2022 10:37 | New St &amp; Illinois St                   | TA1306000013 | Streeter Dr &amp; Grand Ave       | 13022        | 41.89068 | -87.61809 | 41.89228 | -87.61204 | member | 00:14:33 | 6 |\n",
       "| C0AE978CAB160852 | classic_bike  | 16/03/2022 13:40 | 16/03/2022 14:17 | DuSable Lake Shore Dr &amp; Wellington Ave | TA1307000041 | Streeter Dr &amp; Grand Ave       | 13022        | 41.93669 | -87.63683 | 41.89228 | -87.61204 | member | 00:36:55 | 4 |\n",
       "| 5E0C2CDD50EBFC0B | classic_bike  | 16/03/2022 16:33 | 16/03/2022 17:33 | Adler Planetarium                      | 13431        | Streeter Dr &amp; Grand Ave       | 13022        | 41.86610 | -87.60727 | 41.89228 | -87.61204 | casual | 01:00:22 | 4 |\n",
       "| E3A68406C43058A9 | classic_bike  | 30/03/2022 07:31 | 30/03/2022 07:40 | Stetson Ave &amp; South Water St           | TA1308000029 | Franklin St &amp; Adams St (Temp) | TA1309000008 | 41.88683 | -87.62232 | 41.87943 | -87.63550 | member | 00:08:20 | 4 |\n",
       "| 025DA93C8471767C | docked_bike   | 05/03/2022 14:13 | 05/03/2022 14:45 | Adler Planetarium                      | 13431        | Streeter Dr &amp; Grand Ave       | 13022        | 41.86610 | -87.60727 | 41.89228 | -87.61204 | casual | 00:32:39 | 7 |\n",
       "| 7DF0716EA46DC1E1 | classic_bike  | 16/03/2022 07:34 | 16/03/2022 07:44 | Stetson Ave &amp; South Water St           | TA1308000029 | Franklin St &amp; Adams St (Temp) | TA1309000008 | 41.88683 | -87.62232 | 41.87943 | -87.63550 | member | 00:10:33 | 4 |\n",
       "| B591E39220EBC4BC | classic_bike  | 15/03/2022 18:09 | 15/03/2022 18:20 | Daley Center Plaza                     | TA1306000010 | Streeter Dr &amp; Grand Ave       | 13022        | 41.88424 | -87.62963 | 41.89228 | -87.61204 | member | 00:11:14 | 3 |\n",
       "| 1CEE41690C73108B | classic_bike  | 21/03/2022 15:12 | 21/03/2022 15:23 | Michigan Ave &amp; Oak St                  | 13042        | Streeter Dr &amp; Grand Ave       | 13022        | 41.90096 | -87.62378 | 41.89228 | -87.61204 | member | 00:10:44 | 2 |\n",
       "| A2A6F07D3DF4D0D6 | electric_bike | 09/03/2022 20:29 | 09/03/2022 21:01 | Sheridan Rd &amp; Irving Park Rd           | 13063        | Streeter Dr &amp; Grand Ave       | 13022        | 41.95428 | -87.65441 | 41.89228 | -87.61204 | casual | 00:31:42 | 4 |\n",
       "| E23BE3DB740BE3B4 | docked_bike   | 13/03/2022 16:31 | 13/03/2022 16:39 | Michigan Ave &amp; Oak St                  | 13042        | Streeter Dr &amp; Grand Ave       | 13022        | 41.90096 | -87.62378 | 41.89228 | -87.61204 | casual | 00:08:29 | 1 |\n",
       "| 15AF71F3220F2A75 | docked_bike   | 09/03/2022 06:56 | 09/03/2022 07:42 | Broadway &amp; Barry Ave                   | 13137        | Ravenswood Ave &amp; Berteau Ave  | TA1309000018 | 41.93758 | -87.64410 | 41.95792 | -87.67357 | casual | 00:46:12 | 4 |\n",
       "| 9C4CE6CC19F8225B | electric_bike | 09/03/2022 15:55 | 09/03/2022 16:08 | NA                                     | NA           | Albany Ave &amp; Montrose Ave     | 15621        | 41.94000 | -87.71000 | 41.96104 | -87.70587 | member | 00:13:28 | 4 |\n",
       "| F4E136DEF696F3AE | electric_bike | 21/03/2022 16:12 | 21/03/2022 16:18 | NA                                     | NA           | Larrabee St &amp; Division St     | KA1504000079 | 41.91000 | -87.65000 | 41.90349 | -87.64335 | member | 00:05:40 | 2 |\n",
       "| 5AEC5F39AF711895 | classic_bike  | 03/03/2022 18:13 | 03/03/2022 18:23 | Clark St &amp; Randolph St                 | TA1305000030 | Streeter Dr &amp; Grand Ave       | 13022        | 41.88458 | -87.63189 | 41.89228 | -87.61204 | member | 00:09:59 | 5 |\n",
       "\n"
      ],
      "text/plain": [
       "        ride_id          bike_type     start_time       end_time        \n",
       "1       6C992BD37A98A63F classic_bike  12/04/2021 18:25 12/04/2021 18:56\n",
       "2       1E0145613A209000 docked_bike   27/04/2021 17:27 27/04/2021 18:31\n",
       "3       E498E15508A80BAD docked_bike   03/04/2021 12:42 07/04/2021 11:40\n",
       "4       1887262AD101C604 classic_bike  17/04/2021 09:17 17/04/2021 09:42\n",
       "5       C123548CAB2A32A5 docked_bike   03/04/2021 12:42 03/04/2021 14:13\n",
       "6       097E76F3651B1AC1 classic_bike  25/04/2021 18:43 25/04/2021 18:43\n",
       "7       53C38EB01E6FA5C4 classic_bike  03/04/2021 16:28 03/04/2021 16:29\n",
       "8       D53AC014EFD6E2BA electric_bike 06/04/2021 16:35 06/04/2021 17:00\n",
       "9       6E2F7CA1FA9E0AFB classic_bike  12/04/2021 15:22 12/04/2021 16:15\n",
       "10      04218447AAC80BD1 classic_bike  24/04/2021 15:04 24/04/2021 15:06\n",
       "11      B45BBE0734834247 electric_bike 03/04/2021 18:03 03/04/2021 19:13\n",
       "12      70DEC4E102F00DC2 electric_bike 24/04/2021 18:01 24/04/2021 19:39\n",
       "13      B33484FA16A9A0FE classic_bike  27/04/2021 18:31 27/04/2021 19:17\n",
       "14      8670C65989291512 classic_bike  04/04/2021 14:19 04/04/2021 14:26\n",
       "15      EFF545B4881F0C25 classic_bike  13/04/2021 12:12 13/04/2021 13:12\n",
       "16      49658BDF5846360E electric_bike 08/04/2021 17:59 08/04/2021 18:11\n",
       "17      E5261048A5E7365B electric_bike 27/04/2021 16:22 27/04/2021 16:47\n",
       "18      9DADAD1E49747066 docked_bike   25/04/2021 17:42 25/04/2021 18:02\n",
       "19      440BBEEEEA9DD6FE classic_bike  07/04/2021 14:24 07/04/2021 14:25\n",
       "20      B39DF385508E7DCF classic_bike  27/04/2021 09:00 27/04/2021 09:30\n",
       "21      1E1D708751A45FBB classic_bike  27/04/2021 18:20 27/04/2021 18:23\n",
       "22      EF150999D6799927 electric_bike 26/04/2021 15:19 26/04/2021 15:47\n",
       "23      F01C5D9474B37874 docked_bike   27/04/2021 17:27 27/04/2021 17:56\n",
       "24      3241CB12D978A919 docked_bike   26/04/2021 16:39 26/04/2021 17:10\n",
       "25      3C1E34B72CF1DF6F docked_bike   24/04/2021 14:13 24/04/2021 17:54\n",
       "26      7780E5A193F16BAA docked_bike   17/04/2021 12:19 17/04/2021 12:33\n",
       "27      A1250C4C180BDB7A electric_bike 12/04/2021 13:28 12/04/2021 13:43\n",
       "28      DCE53F03D9E930BC classic_bike  16/04/2021 19:12 16/04/2021 19:30\n",
       "29      C1C200854F4A4289 classic_bike  11/04/2021 17:12 11/04/2021 17:13\n",
       "30      4613417749115AB3 classic_bike  11/04/2021 17:13 11/04/2021 18:14\n",
       "⋮       ⋮                ⋮             ⋮                ⋮               \n",
       "5723484 84932115AE84D51C classic_bike  17/03/2022 17:31 17/03/2022 17:37\n",
       "5723485 5346BEADE60DF4CC classic_bike  08/03/2022 17:42 08/03/2022 17:49\n",
       "5723486 799F0896CC2165A1 electric_bike 21/03/2022 15:09 21/03/2022 16:23\n",
       "5723487 4417CF79DFA8EFA0 electric_bike 15/03/2022 17:20 15/03/2022 17:37\n",
       "5723488 FD53CC132C891259 classic_bike  15/03/2022 17:16 15/03/2022 17:37\n",
       "5723489 3F0F55008C5FDD9A classic_bike  10/03/2022 09:40 10/03/2022 09:42\n",
       "5723490 CA5BCBE936AA78AC electric_bike 30/03/2022 08:52 30/03/2022 09:00\n",
       "5723491 D41190A1EACD4E5F electric_bike 02/03/2022 09:15 02/03/2022 09:22\n",
       "5723492 4A317542FA86CD66 electric_bike 21/03/2022 19:50 21/03/2022 19:51\n",
       "5723493 6E5550F87DDF75F6 electric_bike 22/03/2022 17:42 22/03/2022 17:43\n",
       "5723494 5216A9EC09DB7A9F electric_bike 05/03/2022 08:46 05/03/2022 08:49\n",
       "5723495 F8CC1C4C0D68C738 electric_bike 17/03/2022 16:35 17/03/2022 16:54\n",
       "5723496 E84C61616F07B3E6 electric_bike 16/03/2022 08:49 16/03/2022 08:54\n",
       "5723497 4C57806C54B9E7CE electric_bike 09/03/2022 08:57 09/03/2022 09:01\n",
       "5723498 5C9B42397EC9AF78 electric_bike 15/03/2022 08:53 15/03/2022 08:58\n",
       "5723499 155C49327D325C09 electric_bike 22/03/2022 09:05 22/03/2022 09:09\n",
       "5723500 035E57A7EC67DDF4 electric_bike 25/03/2022 10:22 25/03/2022 10:37\n",
       "5723501 C0AE978CAB160852 classic_bike  16/03/2022 13:40 16/03/2022 14:17\n",
       "5723502 5E0C2CDD50EBFC0B classic_bike  16/03/2022 16:33 16/03/2022 17:33\n",
       "5723503 E3A68406C43058A9 classic_bike  30/03/2022 07:31 30/03/2022 07:40\n",
       "5723504 025DA93C8471767C docked_bike   05/03/2022 14:13 05/03/2022 14:45\n",
       "5723505 7DF0716EA46DC1E1 classic_bike  16/03/2022 07:34 16/03/2022 07:44\n",
       "5723506 B591E39220EBC4BC classic_bike  15/03/2022 18:09 15/03/2022 18:20\n",
       "5723507 1CEE41690C73108B classic_bike  21/03/2022 15:12 21/03/2022 15:23\n",
       "5723508 A2A6F07D3DF4D0D6 electric_bike 09/03/2022 20:29 09/03/2022 21:01\n",
       "5723509 E23BE3DB740BE3B4 docked_bike   13/03/2022 16:31 13/03/2022 16:39\n",
       "5723510 15AF71F3220F2A75 docked_bike   09/03/2022 06:56 09/03/2022 07:42\n",
       "5723511 9C4CE6CC19F8225B electric_bike 09/03/2022 15:55 09/03/2022 16:08\n",
       "5723512 F4E136DEF696F3AE electric_bike 21/03/2022 16:12 21/03/2022 16:18\n",
       "5723513 5AEC5F39AF711895 classic_bike  03/03/2022 18:13 03/03/2022 18:23\n",
       "        from_station                           start_station_id\n",
       "1       State St & Pearson St                  TA1307000061    \n",
       "2       Dorchester Ave & 49th St               KA1503000069    \n",
       "3       Loomis Blvd & 84th St                  20121           \n",
       "4       Honore St & Division St                TA1305000034    \n",
       "5       Loomis Blvd & 84th St                  20121           \n",
       "6       Clinton St & Polk St                   15542           \n",
       "7       Ashland Ave & 63rd St                  16948           \n",
       "8       Dorchester Ave & 49th St               KA1503000069    \n",
       "9       Ashland Ave & 63rd St                  16948           \n",
       "10      Dorchester Ave & 49th St               KA1503000069    \n",
       "11      Loomis Blvd & 84th St                  20121           \n",
       "12      Halsted St & 69th St                   15597           \n",
       "13      Dorchester Ave & 49th St               KA1503000069    \n",
       "14      Dorchester Ave & 49th St               KA1503000069    \n",
       "15      Dorchester Ave & 49th St               KA1503000069    \n",
       "16      Dorchester Ave & 49th St               KA1503000069    \n",
       "17      Loomis Blvd & 84th St                  20121           \n",
       "18      Dorchester Ave & 49th St               KA1503000069    \n",
       "19      Dorchester Ave & 49th St               KA1503000069    \n",
       "20      Dorchester Ave & 49th St               KA1503000069    \n",
       "21      Clinton St & Polk St                   15542           \n",
       "22      Loomis Blvd & 84th St                  20121           \n",
       "23      Dorchester Ave & 49th St               KA1503000069    \n",
       "24      Dorchester Ave & 49th St               KA1503000069    \n",
       "25      Halsted St & 69th St                   15597           \n",
       "26      Dorchester Ave & 49th St               KA1503000069    \n",
       "27      Dorchester Ave & 49th St               KA1503000069    \n",
       "28      Dorchester Ave & 49th St               KA1503000069    \n",
       "29      Loomis Blvd & 84th St                  20121           \n",
       "30      Loomis Blvd & 84th St                  20121           \n",
       "⋮       ⋮                                      ⋮               \n",
       "5723484 Clinton St & Jackson Blvd              638             \n",
       "5723485 Clinton St & Jackson Blvd              638             \n",
       "5723486 State St & Van Buren St                TA1305000035    \n",
       "5723487 Indiana Ave & Roosevelt Rd             SL-005          \n",
       "5723488 Indiana Ave & Roosevelt Rd             SL-005          \n",
       "5723489 Ravenswood Ave & Irving Park Rd        TA1307000149    \n",
       "5723490 Larrabee St & Kingsbury St             TA1306000009    \n",
       "5723491 Larrabee St & Kingsbury St             TA1306000009    \n",
       "5723492 Aberdeen St & Jackson Blvd             13157           \n",
       "5723493 Aberdeen St & Jackson Blvd             13157           \n",
       "5723494 Larrabee St & Kingsbury St             TA1306000009    \n",
       "5723495 NA                                     NA              \n",
       "5723496 Orleans St & Merchandise Mart Plaza    TA1305000022    \n",
       "5723497 Orleans St & Merchandise Mart Plaza    TA1305000022    \n",
       "5723498 Orleans St & Merchandise Mart Plaza    TA1305000022    \n",
       "5723499 Orleans St & Merchandise Mart Plaza    TA1305000022    \n",
       "5723500 New St & Illinois St                   TA1306000013    \n",
       "5723501 DuSable Lake Shore Dr & Wellington Ave TA1307000041    \n",
       "5723502 Adler Planetarium                      13431           \n",
       "5723503 Stetson Ave & South Water St           TA1308000029    \n",
       "5723504 Adler Planetarium                      13431           \n",
       "5723505 Stetson Ave & South Water St           TA1308000029    \n",
       "5723506 Daley Center Plaza                     TA1306000010    \n",
       "5723507 Michigan Ave & Oak St                  13042           \n",
       "5723508 Sheridan Rd & Irving Park Rd           13063           \n",
       "5723509 Michigan Ave & Oak St                  13042           \n",
       "5723510 Broadway & Barry Ave                   13137           \n",
       "5723511 NA                                     NA              \n",
       "5723512 NA                                     NA              \n",
       "5723513 Clark St & Randolph St                 TA1305000030    \n",
       "        to_station                    end_station_id start_lat start_lng\n",
       "1       Southport Ave & Waveland Ave  13235          41.89745  -87.62872\n",
       "2       Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "3       Loomis Blvd & 84th St         20121          41.74149  -87.65841\n",
       "4       Southport Ave & Waveland Ave  13235          41.90312  -87.67394\n",
       "5       Loomis Blvd & 84th St         20121          41.74149  -87.65841\n",
       "6       Clinton St & Polk St          15542          41.87147  -87.64095\n",
       "7       Ashland Ave & 63rd St         16948          41.77937  -87.66484\n",
       "8       Dorchester Ave & 49th St      KA1503000069   41.80583  -87.59248\n",
       "9       Ashland Ave & 63rd St         16948          41.77937  -87.66484\n",
       "10      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "11      Loomis Blvd & 84th St         20121          41.74156  -87.65842\n",
       "12      Halsted St & 69th St          15597          41.76901  -87.64463\n",
       "13      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "14      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "15      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "16      Dorchester Ave & 49th St      KA1503000069   41.80583  -87.59252\n",
       "17      Loomis Blvd & 84th St         20121          41.74156  -87.65842\n",
       "18      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "19      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "20      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "21      Clinton St & Polk St          15542          41.87147  -87.64095\n",
       "22      Loomis Blvd & 84th St         20121          41.74154  -87.65837\n",
       "23      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "24      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "25      Halsted St & 69th St          15597          41.76906  -87.64461\n",
       "26      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "27      Dorchester Ave & 49th St      KA1503000069   41.80586  -87.59241\n",
       "28      Dorchester Ave & 49th St      KA1503000069   41.80577  -87.59246\n",
       "29      Loomis Blvd & 84th St         20121          41.74149  -87.65841\n",
       "30      Loomis Blvd & 84th St         20121          41.74149  -87.65841\n",
       "⋮       ⋮                             ⋮              ⋮         ⋮        \n",
       "5723484 Aberdeen St & Monroe St       13156          41.87832  -87.64098\n",
       "5723485 Aberdeen St & Monroe St       13156          41.87832  -87.64098\n",
       "5723486 Streeter Dr & Grand Ave       13022          41.87665  -87.62800\n",
       "5723487 Streeter Dr & Grand Ave       13022          41.86804  -87.62311\n",
       "5723488 Streeter Dr & Grand Ave       13022          41.86789  -87.62304\n",
       "5723489 Ravenswood Ave & Berteau Ave  TA1309000018   41.95469  -87.67393\n",
       "5723490 Franklin St & Adams St (Temp) TA1309000008   41.89762  -87.64330\n",
       "5723491 Franklin St & Adams St (Temp) TA1309000008   41.89772  -87.64291\n",
       "5723492 Aberdeen St & Monroe St       13156          41.87772  -87.65482\n",
       "5723493 Aberdeen St & Monroe St       13156          41.87771  -87.65493\n",
       "5723494 Larrabee St & Division St     KA1504000079   41.89758  -87.64328\n",
       "5723495 Sheridan Rd & Greenleaf Ave   KA1504000159   41.97000  -87.69000\n",
       "5723496 Franklin St & Adams St (Temp) TA1309000008   41.88803  -87.63715\n",
       "5723497 Franklin St & Adams St (Temp) TA1309000008   41.88803  -87.63676\n",
       "5723498 Franklin St & Adams St (Temp) TA1309000008   41.88796  -87.63696\n",
       "5723499 Franklin St & Adams St (Temp) TA1309000008   41.88829  -87.63637\n",
       "5723500 Streeter Dr & Grand Ave       13022          41.89068  -87.61809\n",
       "5723501 Streeter Dr & Grand Ave       13022          41.93669  -87.63683\n",
       "5723502 Streeter Dr & Grand Ave       13022          41.86610  -87.60727\n",
       "5723503 Franklin St & Adams St (Temp) TA1309000008   41.88683  -87.62232\n",
       "5723504 Streeter Dr & Grand Ave       13022          41.86610  -87.60727\n",
       "5723505 Franklin St & Adams St (Temp) TA1309000008   41.88683  -87.62232\n",
       "5723506 Streeter Dr & Grand Ave       13022          41.88424  -87.62963\n",
       "5723507 Streeter Dr & Grand Ave       13022          41.90096  -87.62378\n",
       "5723508 Streeter Dr & Grand Ave       13022          41.95428  -87.65441\n",
       "5723509 Streeter Dr & Grand Ave       13022          41.90096  -87.62378\n",
       "5723510 Ravenswood Ave & Berteau Ave  TA1309000018   41.93758  -87.64410\n",
       "5723511 Albany Ave & Montrose Ave     15621          41.94000  -87.71000\n",
       "5723512 Larrabee St & Division St     KA1504000079   41.91000  -87.65000\n",
       "5723513 Streeter Dr & Grand Ave       13022          41.88458  -87.63189\n",
       "        end_lat  end_lng   user_type ride_length day_of_week\n",
       "1       41.94815 -87.66394 member    00:31:19    2          \n",
       "2       41.80577 -87.59246 casual    01:04:18    3          \n",
       "3       41.74149 -87.65841 casual    22:57:39    7          \n",
       "4       41.94815 -87.66394 member    00:25:06    7          \n",
       "5       41.74149 -87.65841 casual    01:31:17    7          \n",
       "6       41.87147 -87.64095 casual    00:00:41    1          \n",
       "7       41.77937 -87.66484 casual    00:01:26    7          \n",
       "8       41.80580 -87.59266 casual    00:25:50    3          \n",
       "9       41.77937 -87.66484 casual    00:52:54    2          \n",
       "10      41.80577 -87.59246 casual    00:01:21    7          \n",
       "11      41.74160 -87.65842 casual    01:09:42    7          \n",
       "12      41.76901 -87.64458 casual    01:37:31    7          \n",
       "13      41.80577 -87.59246 casual    00:45:28    3          \n",
       "14      41.80577 -87.59246 casual    00:06:46    1          \n",
       "15      41.80577 -87.59246 casual    00:59:21    3          \n",
       "16      41.80594 -87.59247 casual    00:11:57    5          \n",
       "17      41.74157 -87.65844 casual    00:24:37    3          \n",
       "18      41.80577 -87.59246 casual    00:20:39    1          \n",
       "19      41.80577 -87.59246 casual    00:01:06    4          \n",
       "20      41.80577 -87.59246 casual    00:30:21    3          \n",
       "21      41.87147 -87.64095 casual    00:03:04    3          \n",
       "22      41.74155 -87.65841 casual    00:28:25    2          \n",
       "23      41.80577 -87.59246 casual    00:28:42    3          \n",
       "24      41.80577 -87.59246 casual    00:31:12    2          \n",
       "25      41.76906 -87.64461 casual    03:41:02    7          \n",
       "26      41.80577 -87.59246 casual    00:14:08    7          \n",
       "27      41.80585 -87.59250 casual    00:15:10    2          \n",
       "28      41.80577 -87.59246 casual    00:17:14    6          \n",
       "29      41.74149 -87.65841 casual    00:00:35    1          \n",
       "30      41.74149 -87.65841 casual    01:00:39    1          \n",
       "⋮       ⋮        ⋮         ⋮         ⋮           ⋮          \n",
       "5723484 41.88042 -87.65552 member    00:06:39    5          \n",
       "5723485 41.88042 -87.65552 member    00:06:28    3          \n",
       "5723486 41.89228 -87.61204 casual    01:14:17    2          \n",
       "5723487 41.89228 -87.61204 casual    00:17:44    3          \n",
       "5723488 41.89228 -87.61204 casual    00:21:07    3          \n",
       "5723489 41.95792 -87.67357 member    00:02:05    5          \n",
       "5723490 41.87943 -87.63550 member    00:07:45    4          \n",
       "5723491 41.87943 -87.63550 member    00:06:53    4          \n",
       "5723492 41.88042 -87.65552 member    00:01:06    2          \n",
       "5723493 41.88042 -87.65552 member    00:01:17    3          \n",
       "5723494 41.90349 -87.64335 member    00:02:44    7          \n",
       "5723495 42.01059 -87.66241 member    00:19:06    5          \n",
       "5723496 41.87943 -87.63550 member    00:04:40    4          \n",
       "5723497 41.87943 -87.63550 member    00:04:37    4          \n",
       "5723498 41.87943 -87.63550 member    00:04:34    3          \n",
       "5723499 41.87943 -87.63550 member    00:04:25    3          \n",
       "5723500 41.89228 -87.61204 member    00:14:33    6          \n",
       "5723501 41.89228 -87.61204 member    00:36:55    4          \n",
       "5723502 41.89228 -87.61204 casual    01:00:22    4          \n",
       "5723503 41.87943 -87.63550 member    00:08:20    4          \n",
       "5723504 41.89228 -87.61204 casual    00:32:39    7          \n",
       "5723505 41.87943 -87.63550 member    00:10:33    4          \n",
       "5723506 41.89228 -87.61204 member    00:11:14    3          \n",
       "5723507 41.89228 -87.61204 member    00:10:44    2          \n",
       "5723508 41.89228 -87.61204 casual    00:31:42    4          \n",
       "5723509 41.89228 -87.61204 casual    00:08:29    1          \n",
       "5723510 41.95792 -87.67357 casual    00:46:12    4          \n",
       "5723511 41.96104 -87.70587 member    00:13:28    4          \n",
       "5723512 41.90349 -87.64335 member    00:05:40    2          \n",
       "5723513 41.89228 -87.61204 member    00:09:59    5          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "(all_trips <- rename(all_trips\n",
    "                   ,bike_type = rideable_type\n",
    "                   ,start_time = started_at\n",
    "                   ,end_time = ended_at\n",
    "                   ,from_station  = start_station_name\n",
    "                   ,to_station = end_station_name\n",
    "                   ,user_type = member_casual))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "07596f4f",
   "metadata": {
    "papermill": {
     "duration": 0.021293,
     "end_time": "2022-07-04T14:52:52.676548",
     "exception": false,
     "start_time": "2022-07-04T14:52:52.655255",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 3: Clean and Add Data to Prepare for Analysis\n",
    "## Inspect the new table that has been created\n",
    "### List of column names"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "46fb67df",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:52.721747Z",
     "iopub.status.busy": "2022-07-04T14:52:52.720527Z",
     "iopub.status.idle": "2022-07-04T14:52:52.735914Z",
     "shell.execute_reply": "2022-07-04T14:52:52.734248Z"
    },
    "papermill": {
     "duration": 0.04089,
     "end_time": "2022-07-04T14:52:52.738524",
     "exception": false,
     "start_time": "2022-07-04T14:52:52.697634",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'bike_type'</li><li>'start_time'</li><li>'end_time'</li><li>'from_station'</li><li>'start_station_id'</li><li>'to_station'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'user_type'</li><li>'ride_length'</li><li>'day_of_week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'bike\\_type'\n",
       "\\item 'start\\_time'\n",
       "\\item 'end\\_time'\n",
       "\\item 'from\\_station'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'to\\_station'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'user\\_type'\n",
       "\\item 'ride\\_length'\n",
       "\\item 'day\\_of\\_week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'bike_type'\n",
       "3. 'start_time'\n",
       "4. 'end_time'\n",
       "5. 'from_station'\n",
       "6. 'start_station_id'\n",
       "7. 'to_station'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'user_type'\n",
       "14. 'ride_length'\n",
       "15. 'day_of_week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"          \"bike_type\"        \"start_time\"       \"end_time\"        \n",
       " [5] \"from_station\"     \"start_station_id\" \"to_station\"       \"end_station_id\"  \n",
       " [9] \"start_lat\"        \"start_lng\"        \"end_lat\"          \"end_lng\"         \n",
       "[13] \"user_type\"        \"ride_length\"      \"day_of_week\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "09737c06",
   "metadata": {
    "papermill": {
     "duration": 0.030252,
     "end_time": "2022-07-04T14:52:52.790276",
     "exception": false,
     "start_time": "2022-07-04T14:52:52.760024",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Total number of rows"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "6fad2e26",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:52.859369Z",
     "iopub.status.busy": "2022-07-04T14:52:52.857882Z",
     "iopub.status.idle": "2022-07-04T14:52:52.873569Z",
     "shell.execute_reply": "2022-07-04T14:52:52.871993Z"
    },
    "papermill": {
     "duration": 0.041136,
     "end_time": "2022-07-04T14:52:52.875797",
     "exception": false,
     "start_time": "2022-07-04T14:52:52.834661",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "5723513"
      ],
      "text/latex": [
       "5723513"
      ],
      "text/markdown": [
       "5723513"
      ],
      "text/plain": [
       "[1] 5723513"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nrow(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ca5efc6f",
   "metadata": {
    "papermill": {
     "duration": 0.021513,
     "end_time": "2022-07-04T14:52:52.918710",
     "exception": false,
     "start_time": "2022-07-04T14:52:52.897197",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Dimensions of the data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "35609a17",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:52.965455Z",
     "iopub.status.busy": "2022-07-04T14:52:52.964144Z",
     "iopub.status.idle": "2022-07-04T14:52:52.978680Z",
     "shell.execute_reply": "2022-07-04T14:52:52.977146Z"
    },
    "papermill": {
     "duration": 0.039903,
     "end_time": "2022-07-04T14:52:52.980894",
     "exception": false,
     "start_time": "2022-07-04T14:52:52.940991",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>5723513</li><li>15</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 5723513\n",
       "\\item 15\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 5723513\n",
       "2. 15\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 5723513      15"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5cdf2789",
   "metadata": {
    "papermill": {
     "duration": 0.021607,
     "end_time": "2022-07-04T14:52:53.024615",
     "exception": false,
     "start_time": "2022-07-04T14:52:53.003008",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### The first 6 rows of the data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "137cd54f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:53.071009Z",
     "iopub.status.busy": "2022-07-04T14:52:53.069663Z",
     "iopub.status.idle": "2022-07-04T14:52:53.097331Z",
     "shell.execute_reply": "2022-07-04T14:52:53.095666Z"
    },
    "papermill": {
     "duration": 0.05291,
     "end_time": "2022-07-04T14:52:53.099557",
     "exception": false,
     "start_time": "2022-07-04T14:52:53.046647",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>bike_type</th><th scope=col>start_time</th><th scope=col>end_time</th><th scope=col>from_station</th><th scope=col>start_station_id</th><th scope=col>to_station</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>user_type</th><th scope=col>ride_length</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>6C992BD37A98A63F</td><td>classic_bike</td><td>12/04/2021 18:25</td><td>12/04/2021 18:56</td><td><span style=white-space:pre-wrap>State St &amp; Pearson St   </span></td><td>TA1307000061</td><td>Southport Ave &amp; Waveland Ave</td><td><span style=white-space:pre-wrap>13235       </span></td><td>41.89745</td><td>-87.62872</td><td>41.94815</td><td>-87.66394</td><td>member</td><td>00:31:19</td><td>2</td></tr>\n",
       "\t<tr><td>1E0145613A209000</td><td>docked_bike </td><td>27/04/2021 17:27</td><td>27/04/2021 18:31</td><td>Dorchester Ave &amp; 49th St</td><td>KA1503000069</td><td><span style=white-space:pre-wrap>Dorchester Ave &amp; 49th St    </span></td><td>KA1503000069</td><td>41.80577</td><td>-87.59246</td><td>41.80577</td><td>-87.59246</td><td>casual</td><td>01:04:18</td><td>3</td></tr>\n",
       "\t<tr><td>E498E15508A80BAD</td><td>docked_bike </td><td>03/04/2021 12:42</td><td>07/04/2021 11:40</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74149</td><td>-87.65841</td><td>41.74149</td><td>-87.65841</td><td>casual</td><td>22:57:39</td><td>7</td></tr>\n",
       "\t<tr><td>1887262AD101C604</td><td>classic_bike</td><td>17/04/2021 09:17</td><td>17/04/2021 09:42</td><td>Honore St &amp; Division St </td><td>TA1305000034</td><td>Southport Ave &amp; Waveland Ave</td><td><span style=white-space:pre-wrap>13235       </span></td><td>41.90312</td><td>-87.67394</td><td>41.94815</td><td>-87.66394</td><td>member</td><td>00:25:06</td><td>7</td></tr>\n",
       "\t<tr><td>C123548CAB2A32A5</td><td>docked_bike </td><td>03/04/2021 12:42</td><td>03/04/2021 14:13</td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St   </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td><span style=white-space:pre-wrap>Loomis Blvd &amp; 84th St       </span></td><td><span style=white-space:pre-wrap>20121       </span></td><td>41.74149</td><td>-87.65841</td><td>41.74149</td><td>-87.65841</td><td>casual</td><td>01:31:17</td><td>7</td></tr>\n",
       "\t<tr><td>097E76F3651B1AC1</td><td>classic_bike</td><td>25/04/2021 18:43</td><td>25/04/2021 18:43</td><td><span style=white-space:pre-wrap>Clinton St &amp; Polk St    </span></td><td><span style=white-space:pre-wrap>15542       </span></td><td><span style=white-space:pre-wrap>Clinton St &amp; Polk St        </span></td><td><span style=white-space:pre-wrap>15542       </span></td><td>41.87147</td><td>-87.64095</td><td>41.87147</td><td>-87.64095</td><td>casual</td><td>00:00:41</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " ride\\_id & bike\\_type & start\\_time & end\\_time & from\\_station & start\\_station\\_id & to\\_station & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & user\\_type & ride\\_length & day\\_of\\_week\\\\\n",
       " <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <time> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 6C992BD37A98A63F & classic\\_bike & 12/04/2021 18:25 & 12/04/2021 18:56 & State St \\& Pearson St    & TA1307000061 & Southport Ave \\& Waveland Ave & 13235        & 41.89745 & -87.62872 & 41.94815 & -87.66394 & member & 00:31:19 & 2\\\\\n",
       "\t 1E0145613A209000 & docked\\_bike  & 27/04/2021 17:27 & 27/04/2021 18:31 & Dorchester Ave \\& 49th St & KA1503000069 & Dorchester Ave \\& 49th St     & KA1503000069 & 41.80577 & -87.59246 & 41.80577 & -87.59246 & casual & 01:04:18 & 3\\\\\n",
       "\t E498E15508A80BAD & docked\\_bike  & 03/04/2021 12:42 & 07/04/2021 11:40 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74149 & -87.65841 & 41.74149 & -87.65841 & casual & 22:57:39 & 7\\\\\n",
       "\t 1887262AD101C604 & classic\\_bike & 17/04/2021 09:17 & 17/04/2021 09:42 & Honore St \\& Division St  & TA1305000034 & Southport Ave \\& Waveland Ave & 13235        & 41.90312 & -87.67394 & 41.94815 & -87.66394 & member & 00:25:06 & 7\\\\\n",
       "\t C123548CAB2A32A5 & docked\\_bike  & 03/04/2021 12:42 & 03/04/2021 14:13 & Loomis Blvd \\& 84th St    & 20121        & Loomis Blvd \\& 84th St        & 20121        & 41.74149 & -87.65841 & 41.74149 & -87.65841 & casual & 01:31:17 & 7\\\\\n",
       "\t 097E76F3651B1AC1 & classic\\_bike & 25/04/2021 18:43 & 25/04/2021 18:43 & Clinton St \\& Polk St     & 15542        & Clinton St \\& Polk St         & 15542        & 41.87147 & -87.64095 & 41.87147 & -87.64095 & casual & 00:00:41 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 15\n",
       "\n",
       "| ride_id &lt;chr&gt; | bike_type &lt;chr&gt; | start_time &lt;chr&gt; | end_time &lt;chr&gt; | from_station &lt;chr&gt; | start_station_id &lt;chr&gt; | to_station &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | user_type &lt;chr&gt; | ride_length &lt;time&gt; | day_of_week &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 6C992BD37A98A63F | classic_bike | 12/04/2021 18:25 | 12/04/2021 18:56 | State St &amp; Pearson St    | TA1307000061 | Southport Ave &amp; Waveland Ave | 13235        | 41.89745 | -87.62872 | 41.94815 | -87.66394 | member | 00:31:19 | 2 |\n",
       "| 1E0145613A209000 | docked_bike  | 27/04/2021 17:27 | 27/04/2021 18:31 | Dorchester Ave &amp; 49th St | KA1503000069 | Dorchester Ave &amp; 49th St     | KA1503000069 | 41.80577 | -87.59246 | 41.80577 | -87.59246 | casual | 01:04:18 | 3 |\n",
       "| E498E15508A80BAD | docked_bike  | 03/04/2021 12:42 | 07/04/2021 11:40 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74149 | -87.65841 | 41.74149 | -87.65841 | casual | 22:57:39 | 7 |\n",
       "| 1887262AD101C604 | classic_bike | 17/04/2021 09:17 | 17/04/2021 09:42 | Honore St &amp; Division St  | TA1305000034 | Southport Ave &amp; Waveland Ave | 13235        | 41.90312 | -87.67394 | 41.94815 | -87.66394 | member | 00:25:06 | 7 |\n",
       "| C123548CAB2A32A5 | docked_bike  | 03/04/2021 12:42 | 03/04/2021 14:13 | Loomis Blvd &amp; 84th St    | 20121        | Loomis Blvd &amp; 84th St        | 20121        | 41.74149 | -87.65841 | 41.74149 | -87.65841 | casual | 01:31:17 | 7 |\n",
       "| 097E76F3651B1AC1 | classic_bike | 25/04/2021 18:43 | 25/04/2021 18:43 | Clinton St &amp; Polk St     | 15542        | Clinton St &amp; Polk St         | 15542        | 41.87147 | -87.64095 | 41.87147 | -87.64095 | casual | 00:00:41 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          bike_type    start_time       end_time        \n",
       "1 6C992BD37A98A63F classic_bike 12/04/2021 18:25 12/04/2021 18:56\n",
       "2 1E0145613A209000 docked_bike  27/04/2021 17:27 27/04/2021 18:31\n",
       "3 E498E15508A80BAD docked_bike  03/04/2021 12:42 07/04/2021 11:40\n",
       "4 1887262AD101C604 classic_bike 17/04/2021 09:17 17/04/2021 09:42\n",
       "5 C123548CAB2A32A5 docked_bike  03/04/2021 12:42 03/04/2021 14:13\n",
       "6 097E76F3651B1AC1 classic_bike 25/04/2021 18:43 25/04/2021 18:43\n",
       "  from_station             start_station_id to_station                  \n",
       "1 State St & Pearson St    TA1307000061     Southport Ave & Waveland Ave\n",
       "2 Dorchester Ave & 49th St KA1503000069     Dorchester Ave & 49th St    \n",
       "3 Loomis Blvd & 84th St    20121            Loomis Blvd & 84th St       \n",
       "4 Honore St & Division St  TA1305000034     Southport Ave & Waveland Ave\n",
       "5 Loomis Blvd & 84th St    20121            Loomis Blvd & 84th St       \n",
       "6 Clinton St & Polk St     15542            Clinton St & Polk St        \n",
       "  end_station_id start_lat start_lng end_lat  end_lng   user_type ride_length\n",
       "1 13235          41.89745  -87.62872 41.94815 -87.66394 member    00:31:19   \n",
       "2 KA1503000069   41.80577  -87.59246 41.80577 -87.59246 casual    01:04:18   \n",
       "3 20121          41.74149  -87.65841 41.74149 -87.65841 casual    22:57:39   \n",
       "4 13235          41.90312  -87.67394 41.94815 -87.66394 member    00:25:06   \n",
       "5 20121          41.74149  -87.65841 41.74149 -87.65841 casual    01:31:17   \n",
       "6 15542          41.87147  -87.64095 41.87147 -87.64095 casual    00:00:41   \n",
       "  day_of_week\n",
       "1 2          \n",
       "2 3          \n",
       "3 7          \n",
       "4 7          \n",
       "5 7          \n",
       "6 1          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1c05a434",
   "metadata": {
    "papermill": {
     "duration": 0.022153,
     "end_time": "2022-07-04T14:52:53.144227",
     "exception": false,
     "start_time": "2022-07-04T14:52:53.122074",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### List of columns and data types"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "25a3bbf0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:53.191153Z",
     "iopub.status.busy": "2022-07-04T14:52:53.189802Z",
     "iopub.status.idle": "2022-07-04T14:52:53.224957Z",
     "shell.execute_reply": "2022-07-04T14:52:53.222650Z"
    },
    "papermill": {
     "duration": 0.060854,
     "end_time": "2022-07-04T14:52:53.227316",
     "exception": false,
     "start_time": "2022-07-04T14:52:53.166462",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spec_tbl_df [5,723,513 × 15] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id         : chr [1:5723513] \"6C992BD37A98A63F\" \"1E0145613A209000\" \"E498E15508A80BAD\" \"1887262AD101C604\" ...\n",
      " $ bike_type       : chr [1:5723513] \"classic_bike\" \"docked_bike\" \"docked_bike\" \"classic_bike\" ...\n",
      " $ start_time      : chr [1:5723513] \"12/04/2021 18:25\" \"27/04/2021 17:27\" \"03/04/2021 12:42\" \"17/04/2021 09:17\" ...\n",
      " $ end_time        : chr [1:5723513] \"12/04/2021 18:56\" \"27/04/2021 18:31\" \"07/04/2021 11:40\" \"17/04/2021 09:42\" ...\n",
      " $ from_station    : chr [1:5723513] \"State St & Pearson St\" \"Dorchester Ave & 49th St\" \"Loomis Blvd & 84th St\" \"Honore St & Division St\" ...\n",
      " $ start_station_id: chr [1:5723513] \"TA1307000061\" \"KA1503000069\" \"20121\" \"TA1305000034\" ...\n",
      " $ to_station      : chr [1:5723513] \"Southport Ave & Waveland Ave\" \"Dorchester Ave & 49th St\" \"Loomis Blvd & 84th St\" \"Southport Ave & Waveland Ave\" ...\n",
      " $ end_station_id  : chr [1:5723513] \"13235\" \"KA1503000069\" \"20121\" \"13235\" ...\n",
      " $ start_lat       : num [1:5723513] 41.9 41.8 41.7 41.9 41.7 ...\n",
      " $ start_lng       : num [1:5723513] -87.6 -87.6 -87.7 -87.7 -87.7 ...\n",
      " $ end_lat         : num [1:5723513] 41.9 41.8 41.7 41.9 41.7 ...\n",
      " $ end_lng         : num [1:5723513] -87.7 -87.6 -87.7 -87.7 -87.7 ...\n",
      " $ user_type       : chr [1:5723513] \"member\" \"casual\" \"casual\" \"member\" ...\n",
      " $ ride_length     : 'hms' num [1:5723513] 00:31:19 01:04:18 22:57:39 00:25:06 ...\n",
      "  ..- attr(*, \"units\")= chr \"secs\"\n",
      " $ day_of_week     : num [1:5723513] 2 3 7 7 7 1 7 3 2 7 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   ended_at = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   ride_length = \u001b[34mcol_time(format = \"\")\u001b[39m,\n",
      "  ..   day_of_week = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "str(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9f58e455",
   "metadata": {
    "papermill": {
     "duration": 0.022054,
     "end_time": "2022-07-04T14:52:53.271914",
     "exception": false,
     "start_time": "2022-07-04T14:52:53.249860",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Statistical summary of the data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "648a0104",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:53.319858Z",
     "iopub.status.busy": "2022-07-04T14:52:53.318598Z",
     "iopub.status.idle": "2022-07-04T14:52:55.338743Z",
     "shell.execute_reply": "2022-07-04T14:52:55.336921Z"
    },
    "papermill": {
     "duration": 2.046257,
     "end_time": "2022-07-04T14:52:55.341283",
     "exception": false,
     "start_time": "2022-07-04T14:52:53.295026",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id           bike_type          start_time          end_time        \n",
       " Length:5723513     Length:5723513     Length:5723513     Length:5723513    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " from_station       start_station_id    to_station        end_station_id    \n",
       " Length:5723513     Length:5723513     Length:5723513     Length:5723513    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.64   Min.   :-87.84   Min.   :41.39   Min.   :-88.97  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :45.64   Max.   :-73.80   Max.   :42.17   Max.   :-87.49  \n",
       "                                  NA's   :4716    NA's   :4716    \n",
       "  user_type         ride_length        day_of_week   \n",
       " Length:5723513     Length:5723513    Min.   :1.000  \n",
       " Class :character   Class1:hms        1st Qu.:2.000  \n",
       " Mode  :character   Class2:difftime   Median :4.000  \n",
       "                    Mode  :numeric    Mean   :4.088  \n",
       "                                      3rd Qu.:6.000  \n",
       "                                      Max.   :7.000  \n",
       "                                                     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(all_trips) "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b30b5039",
   "metadata": {
    "papermill": {
     "duration": 0.022327,
     "end_time": "2022-07-04T14:52:55.386871",
     "exception": false,
     "start_time": "2022-07-04T14:52:55.364544",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Get a glimpse of the data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "379ee99d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:55.433871Z",
     "iopub.status.busy": "2022-07-04T14:52:55.432588Z",
     "iopub.status.idle": "2022-07-04T14:52:55.460647Z",
     "shell.execute_reply": "2022-07-04T14:52:55.458756Z"
    },
    "papermill": {
     "duration": 0.053933,
     "end_time": "2022-07-04T14:52:55.462878",
     "exception": false,
     "start_time": "2022-07-04T14:52:55.408945",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 5,723,513\n",
      "Columns: 15\n",
      "$ ride_id          \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"6C992BD37A98A63F\", \"1E0145613A209000\", \"E498E15508A8…\n",
      "$ bike_type        \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"classic_bike\", \"docked_bike\", \"docked_bike\", \"classi…\n",
      "$ start_time       \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"12/04/2021 18:25\", \"27/04/2021 17:27\", \"03/04/2021 1…\n",
      "$ end_time         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"12/04/2021 18:56\", \"27/04/2021 18:31\", \"07/04/2021 1…\n",
      "$ from_station     \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"State St & Pearson St\", \"Dorchester Ave & 49th St\", …\n",
      "$ start_station_id \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"TA1307000061\", \"KA1503000069\", \"20121\", \"TA130500003…\n",
      "$ to_station       \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Southport Ave & Waveland Ave\", \"Dorchester Ave & 49t…\n",
      "$ end_station_id   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"13235\", \"KA1503000069\", \"20121\", \"13235\", \"20121\", \"…\n",
      "$ start_lat        \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.89745, 41.80577, 41.74149, 41.90312, 41.74149, 41.…\n",
      "$ start_lng        \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.62872, -87.59246, -87.65841, -87.67394, -87.65841…\n",
      "$ end_lat          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.94815, 41.80577, 41.74149, 41.94815, 41.74149, 41.…\n",
      "$ end_lng          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.66394, -87.59246, -87.65841, -87.66394, -87.65841…\n",
      "$ user_type        \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"member\", \"casual\", \"casual\", \"member\", \"casual\", \"ca…\n",
      "$ ride_length      \u001b[3m\u001b[90m<time>\u001b[39m\u001b[23m 00:31:19, 01:04:18, 22:57:39, 00:25:06, 01:31:17, 00…\n",
      "$ day_of_week      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 2, 3, 7, 7, 7, 1, 7, 3, 2, 7, 7, 7, 3, 1, 3, 5, 3, 1,…\n"
     ]
    }
   ],
   "source": [
    "glimpse(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6f5988df",
   "metadata": {
    "papermill": {
     "duration": 0.022526,
     "end_time": "2022-07-04T14:52:55.508760",
     "exception": false,
     "start_time": "2022-07-04T14:52:55.486234",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Veryfing that we only have two values in the user_type column"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "b96efc94",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:55.556725Z",
     "iopub.status.busy": "2022-07-04T14:52:55.555470Z",
     "iopub.status.idle": "2022-07-04T14:52:55.684700Z",
     "shell.execute_reply": "2022-07-04T14:52:55.682838Z"
    },
    "papermill": {
     "duration": 0.155476,
     "end_time": "2022-07-04T14:52:55.687069",
     "exception": false,
     "start_time": "2022-07-04T14:52:55.531593",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'member'</li><li>'casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'member'\n",
       "\\item 'casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'member'\n",
       "2. 'casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"member\" \"casual\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "unique(all_trips$user_type)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2de94a92",
   "metadata": {
    "papermill": {
     "duration": 0.023266,
     "end_time": "2022-07-04T14:52:55.733308",
     "exception": false,
     "start_time": "2022-07-04T14:52:55.710042",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Extracting year, month and day columns "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "03a5156b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:52:55.780685Z",
     "iopub.status.busy": "2022-07-04T14:52:55.779454Z",
     "iopub.status.idle": "2022-07-04T14:53:06.486703Z",
     "shell.execute_reply": "2022-07-04T14:53:06.484409Z"
    },
    "papermill": {
     "duration": 10.733795,
     "end_time": "2022-07-04T14:53:06.489566",
     "exception": false,
     "start_time": "2022-07-04T14:52:55.755771",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$date <- as.Date(all_trips$start_time, format = \"%d/%m/%Y\")\n",
    "all_trips$year <- format(as.Date(all_trips$date), \"%Y\")\n",
    "all_trips$month <- format(as.Date(all_trips$date), \"%m\")\n",
    "all_trips$day <- format(as.Date(all_trips$date), \"%d\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a506a084",
   "metadata": {
    "papermill": {
     "duration": 0.022429,
     "end_time": "2022-07-04T14:53:06.535173",
     "exception": false,
     "start_time": "2022-07-04T14:53:06.512744",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Convert dates to quarters"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "ff25b738",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:06.583340Z",
     "iopub.status.busy": "2022-07-04T14:53:06.582025Z",
     "iopub.status.idle": "2022-07-04T14:53:07.296949Z",
     "shell.execute_reply": "2022-07-04T14:53:07.295272Z"
    },
    "papermill": {
     "duration": 0.741331,
     "end_time": "2022-07-04T14:53:07.299600",
     "exception": false,
     "start_time": "2022-07-04T14:53:06.558269",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$quarter <- as.yearqtr(all_trips$date, format = \"%Y-%M/%d\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c739908e",
   "metadata": {
    "papermill": {
     "duration": 0.022577,
     "end_time": "2022-07-04T14:53:07.345609",
     "exception": false,
     "start_time": "2022-07-04T14:53:07.323032",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Convert ride_length column to seconds"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "839e00fb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:07.394707Z",
     "iopub.status.busy": "2022-07-04T14:53:07.393347Z",
     "iopub.status.idle": "2022-07-04T14:53:07.438453Z",
     "shell.execute_reply": "2022-07-04T14:53:07.436904Z"
    },
    "papermill": {
     "duration": 0.072168,
     "end_time": "2022-07-04T14:53:07.440851",
     "exception": false,
     "start_time": "2022-07-04T14:53:07.368683",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$ride_length <- as.numeric(all_trips$ride_length, units = \"secs\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ff7bc041",
   "metadata": {
    "papermill": {
     "duration": 0.023014,
     "end_time": "2022-07-04T14:53:07.486726",
     "exception": false,
     "start_time": "2022-07-04T14:53:07.463712",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Confirm that ride_length column is numeric"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "439cb4c1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:07.534980Z",
     "iopub.status.busy": "2022-07-04T14:53:07.533591Z",
     "iopub.status.idle": "2022-07-04T14:53:07.549030Z",
     "shell.execute_reply": "2022-07-04T14:53:07.547490Z"
    },
    "papermill": {
     "duration": 0.04198,
     "end_time": "2022-07-04T14:53:07.551297",
     "exception": false,
     "start_time": "2022-07-04T14:53:07.509317",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "TRUE"
      ],
      "text/latex": [
       "TRUE"
      ],
      "text/markdown": [
       "TRUE"
      ],
      "text/plain": [
       "[1] TRUE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "is.numeric(all_trips$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "316ddcfe",
   "metadata": {
    "papermill": {
     "duration": 0.022537,
     "end_time": "2022-07-04T14:53:07.597295",
     "exception": false,
     "start_time": "2022-07-04T14:53:07.574758",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Omit all NA Values"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "bad987fe",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:07.645400Z",
     "iopub.status.busy": "2022-07-04T14:53:07.643911Z",
     "iopub.status.idle": "2022-07-04T14:53:10.468768Z",
     "shell.execute_reply": "2022-07-04T14:53:10.467118Z"
    },
    "papermill": {
     "duration": 2.851578,
     "end_time": "2022-07-04T14:53:10.471518",
     "exception": false,
     "start_time": "2022-07-04T14:53:07.619940",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips <- na.omit(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8473b771",
   "metadata": {
    "papermill": {
     "duration": 0.02328,
     "end_time": "2022-07-04T14:53:10.518539",
     "exception": false,
     "start_time": "2022-07-04T14:53:10.495259",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Remove rows where ride_length is less than or equal to zero"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "009e6c8f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:10.567124Z",
     "iopub.status.busy": "2022-07-04T14:53:10.565784Z",
     "iopub.status.idle": "2022-07-04T14:53:13.355861Z",
     "shell.execute_reply": "2022-07-04T14:53:13.351848Z"
    },
    "papermill": {
     "duration": 2.817803,
     "end_time": "2022-07-04T14:53:13.359079",
     "exception": false,
     "start_time": "2022-07-04T14:53:10.541276",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips <- all_trips[!(all_trips$ride_length <= 0),]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fed4eef4",
   "metadata": {
    "papermill": {
     "duration": 0.038386,
     "end_time": "2022-07-04T14:53:13.437572",
     "exception": false,
     "start_time": "2022-07-04T14:53:13.399186",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Check that no negative or zero values are present in the ride_length column"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "749404bc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:13.516363Z",
     "iopub.status.busy": "2022-07-04T14:53:13.514158Z",
     "iopub.status.idle": "2022-07-04T14:53:13.693630Z",
     "shell.execute_reply": "2022-07-04T14:53:13.690793Z"
    },
    "papermill": {
     "duration": 0.22259,
     "end_time": "2022-07-04T14:53:13.697662",
     "exception": false,
     "start_time": "2022-07-04T14:53:13.475072",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 0 × 20</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>bike_type</th><th scope=col>start_time</th><th scope=col>end_time</th><th scope=col>from_station</th><th scope=col>start_station_id</th><th scope=col>to_station</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>user_type</th><th scope=col>ride_length</th><th scope=col>day_of_week</th><th scope=col>date</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>quarter</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;yearqtr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 0 × 20\n",
       "\\begin{tabular}{llllllllllllllllllll}\n",
       " ride\\_id & bike\\_type & start\\_time & end\\_time & from\\_station & start\\_station\\_id & to\\_station & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & user\\_type & ride\\_length & day\\_of\\_week & date & year & month & day & quarter\\\\\n",
       " <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <dbl> & <dbl> & <date> & <chr> & <chr> & <chr> & <yearqtr>\\\\\n",
       "\\hline\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 0 × 20\n",
       "\n",
       "| ride_id &lt;chr&gt; | bike_type &lt;chr&gt; | start_time &lt;chr&gt; | end_time &lt;chr&gt; | from_station &lt;chr&gt; | start_station_id &lt;chr&gt; | to_station &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | user_type &lt;chr&gt; | ride_length &lt;dbl&gt; | day_of_week &lt;dbl&gt; | date &lt;date&gt; | year &lt;chr&gt; | month &lt;chr&gt; | day &lt;chr&gt; | quarter &lt;yearqtr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "\n"
      ],
      "text/plain": [
       "     ride_id bike_type start_time end_time from_station start_station_id\n",
       "     to_station end_station_id start_lat start_lng end_lat end_lng user_type\n",
       "     ride_length day_of_week date year month day quarter"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips %>% filter(ride_length <= 0)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "677314b3",
   "metadata": {
    "papermill": {
     "duration": 0.037195,
     "end_time": "2022-07-04T14:53:13.772840",
     "exception": false,
     "start_time": "2022-07-04T14:53:13.735645",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 4: Conduct Descriptive Analysis"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "828eea4b",
   "metadata": {
    "papermill": {
     "duration": 0.04679,
     "end_time": "2022-07-04T14:53:13.859283",
     "exception": false,
     "start_time": "2022-07-04T14:53:13.812493",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Descriptive analysis on ride_length"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "0de1ce2b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:13.955676Z",
     "iopub.status.busy": "2022-07-04T14:53:13.952968Z",
     "iopub.status.idle": "2022-07-04T14:53:14.283718Z",
     "shell.execute_reply": "2022-07-04T14:53:14.281855Z"
    },
    "papermill": {
     "duration": 0.381261,
     "end_time": "2022-07-04T14:53:14.286186",
     "exception": false,
     "start_time": "2022-07-04T14:53:13.904925",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n",
       "      1     407     717    1182    1300   86397 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(all_trips$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c00246af",
   "metadata": {
    "papermill": {
     "duration": 0.025657,
     "end_time": "2022-07-04T14:53:14.338615",
     "exception": false,
     "start_time": "2022-07-04T14:53:14.312958",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Compare members and casual users"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "efe820fd",
   "metadata": {
    "papermill": {
     "duration": 0.025494,
     "end_time": "2022-07-04T14:53:14.389874",
     "exception": false,
     "start_time": "2022-07-04T14:53:14.364380",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Average"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "24ad9776",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:14.444384Z",
     "iopub.status.busy": "2022-07-04T14:53:14.442521Z",
     "iopub.status.idle": "2022-07-04T14:53:18.847506Z",
     "shell.execute_reply": "2022-07-04T14:53:18.845598Z"
    },
    "papermill": {
     "duration": 4.434946,
     "end_time": "2022-07-04T14:53:18.850299",
     "exception": false,
     "start_time": "2022-07-04T14:53:14.415353",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips$user_type</th><th scope=col>all_trips$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1696.842</td></tr>\n",
       "\t<tr><td>member</td><td> 775.935</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\$user\\_type & all\\_trips\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 1696.842\\\\\n",
       "\t member &  775.935\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips$user_type &lt;chr&gt; | all_trips$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 1696.842 |\n",
       "| member |  775.935 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips$user_type all_trips$ride_length\n",
       "1 casual              1696.842             \n",
       "2 member               775.935             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips$ride_length ~ all_trips$user_type, FUN = mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9cd2b9a5",
   "metadata": {
    "papermill": {
     "duration": 0.024884,
     "end_time": "2022-07-04T14:53:18.899563",
     "exception": false,
     "start_time": "2022-07-04T14:53:18.874679",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Median"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "c12f4a26",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:18.948490Z",
     "iopub.status.busy": "2022-07-04T14:53:18.947288Z",
     "iopub.status.idle": "2022-07-04T14:53:21.801997Z",
     "shell.execute_reply": "2022-07-04T14:53:21.800091Z"
    },
    "papermill": {
     "duration": 2.881864,
     "end_time": "2022-07-04T14:53:21.804640",
     "exception": false,
     "start_time": "2022-07-04T14:53:18.922776",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips$user_type</th><th scope=col>all_trips$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>988</td></tr>\n",
       "\t<tr><td>member</td><td>570</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\$user\\_type & all\\_trips\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 988\\\\\n",
       "\t member & 570\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips$user_type &lt;chr&gt; | all_trips$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 988 |\n",
       "| member | 570 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips$user_type all_trips$ride_length\n",
       "1 casual              988                  \n",
       "2 member              570                  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips$ride_length ~ all_trips$user_type, FUN = median)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "210a5429",
   "metadata": {
    "papermill": {
     "duration": 0.023882,
     "end_time": "2022-07-04T14:53:21.852269",
     "exception": false,
     "start_time": "2022-07-04T14:53:21.828387",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Maximum"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "2b980dfa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:21.902198Z",
     "iopub.status.busy": "2022-07-04T14:53:21.900928Z",
     "iopub.status.idle": "2022-07-04T14:53:24.485352Z",
     "shell.execute_reply": "2022-07-04T14:53:24.483439Z"
    },
    "papermill": {
     "duration": 2.612281,
     "end_time": "2022-07-04T14:53:24.487976",
     "exception": false,
     "start_time": "2022-07-04T14:53:21.875695",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips$user_type</th><th scope=col>all_trips$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>86397</td></tr>\n",
       "\t<tr><td>member</td><td>86128</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\$user\\_type & all\\_trips\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 86397\\\\\n",
       "\t member & 86128\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips$user_type &lt;chr&gt; | all_trips$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 86397 |\n",
       "| member | 86128 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips$user_type all_trips$ride_length\n",
       "1 casual              86397                \n",
       "2 member              86128                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips$ride_length ~ all_trips$user_type, FUN = max)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ee32672b",
   "metadata": {
    "papermill": {
     "duration": 0.024511,
     "end_time": "2022-07-04T14:53:24.537488",
     "exception": false,
     "start_time": "2022-07-04T14:53:24.512977",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Minimum"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "90db5653",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:24.588507Z",
     "iopub.status.busy": "2022-07-04T14:53:24.587213Z",
     "iopub.status.idle": "2022-07-04T14:53:28.012595Z",
     "shell.execute_reply": "2022-07-04T14:53:28.010439Z"
    },
    "papermill": {
     "duration": 3.453363,
     "end_time": "2022-07-04T14:53:28.015270",
     "exception": false,
     "start_time": "2022-07-04T14:53:24.561907",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips$user_type</th><th scope=col>all_trips$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1</td></tr>\n",
       "\t<tr><td>member</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\$user\\_type & all\\_trips\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 1\\\\\n",
       "\t member & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips$user_type &lt;chr&gt; | all_trips$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 1 |\n",
       "| member | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips$user_type all_trips$ride_length\n",
       "1 casual              1                    \n",
       "2 member              1                    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips$ride_length ~ all_trips$user_type, FUN = min)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5193972e",
   "metadata": {
    "papermill": {
     "duration": 0.024549,
     "end_time": "2022-07-04T14:53:28.064877",
     "exception": false,
     "start_time": "2022-07-04T14:53:28.040328",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Convert day_of_week column to day names instead of numbers"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "23e00833",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:28.116594Z",
     "iopub.status.busy": "2022-07-04T14:53:28.114983Z",
     "iopub.status.idle": "2022-07-04T14:53:39.046333Z",
     "shell.execute_reply": "2022-07-04T14:53:39.044639Z"
    },
    "papermill": {
     "duration": 10.960346,
     "end_time": "2022-07-04T14:53:39.049278",
     "exception": false,
     "start_time": "2022-07-04T14:53:28.088932",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$day_of_week <- ifelse(all_trips$day_of_week == 1,\"Sunday\",all_trips$day_of_week)\n",
    "all_trips$day_of_week <- ifelse(all_trips$day_of_week == 2,\"Monday\",all_trips$day_of_week)\n",
    "all_trips$day_of_week <- ifelse(all_trips$day_of_week == 3,\"Tuesday\",all_trips$day_of_week)\n",
    "all_trips$day_of_week <- ifelse(all_trips$day_of_week == 4,\"Wednesday\",all_trips$day_of_week)\n",
    "all_trips$day_of_week <- ifelse(all_trips$day_of_week == 5,\"Thursday\",all_trips$day_of_week)\n",
    "all_trips$day_of_week <- ifelse(all_trips$day_of_week == 6,\"Friday\",all_trips$day_of_week)\n",
    "all_trips$day_of_week <- ifelse(all_trips$day_of_week == 7,\"Saturday\",all_trips$day_of_week)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2d873949",
   "metadata": {
    "papermill": {
     "duration": 0.024517,
     "end_time": "2022-07-04T14:53:39.098134",
     "exception": false,
     "start_time": "2022-07-04T14:53:39.073617",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Average ride time by each day for members and casual users"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "6e212aef",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:39.148242Z",
     "iopub.status.busy": "2022-07-04T14:53:39.146898Z",
     "iopub.status.idle": "2022-07-04T14:53:42.938462Z",
     "shell.execute_reply": "2022-07-04T14:53:42.936475Z"
    },
    "papermill": {
     "duration": 3.819194,
     "end_time": "2022-07-04T14:53:42.941154",
     "exception": false,
     "start_time": "2022-07-04T14:53:39.121960",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips$user_type</th><th scope=col>all_trips$day_of_week</th><th scope=col>all_trips$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>1582.7978</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 758.2456</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>1726.2944</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 750.1485</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>1833.2157</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 873.5756</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>1950.3462</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 894.7992</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>1455.8746</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 728.3242</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>1535.0761</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 724.7848</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>1477.2912</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 735.0049</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " all\\_trips\\$user\\_type & all\\_trips\\$day\\_of\\_week & all\\_trips\\$ride\\_length\\\\\n",
       " <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    & 1582.7978\\\\\n",
       "\t member & Friday    &  758.2456\\\\\n",
       "\t casual & Monday    & 1726.2944\\\\\n",
       "\t member & Monday    &  750.1485\\\\\n",
       "\t casual & Saturday  & 1833.2157\\\\\n",
       "\t member & Saturday  &  873.5756\\\\\n",
       "\t casual & Sunday    & 1950.3462\\\\\n",
       "\t member & Sunday    &  894.7992\\\\\n",
       "\t casual & Thursday  & 1455.8746\\\\\n",
       "\t member & Thursday  &  728.3242\\\\\n",
       "\t casual & Tuesday   & 1535.0761\\\\\n",
       "\t member & Tuesday   &  724.7848\\\\\n",
       "\t casual & Wednesday & 1477.2912\\\\\n",
       "\t member & Wednesday &  735.0049\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| all_trips$user_type &lt;chr&gt; | all_trips$day_of_week &lt;chr&gt; | all_trips$ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    | 1582.7978 |\n",
       "| member | Friday    |  758.2456 |\n",
       "| casual | Monday    | 1726.2944 |\n",
       "| member | Monday    |  750.1485 |\n",
       "| casual | Saturday  | 1833.2157 |\n",
       "| member | Saturday  |  873.5756 |\n",
       "| casual | Sunday    | 1950.3462 |\n",
       "| member | Sunday    |  894.7992 |\n",
       "| casual | Thursday  | 1455.8746 |\n",
       "| member | Thursday  |  728.3242 |\n",
       "| casual | Tuesday   | 1535.0761 |\n",
       "| member | Tuesday   |  724.7848 |\n",
       "| casual | Wednesday | 1477.2912 |\n",
       "| member | Wednesday |  735.0049 |\n",
       "\n"
      ],
      "text/plain": [
       "   all_trips$user_type all_trips$day_of_week all_trips$ride_length\n",
       "1  casual              Friday                1582.7978            \n",
       "2  member              Friday                 758.2456            \n",
       "3  casual              Monday                1726.2944            \n",
       "4  member              Monday                 750.1485            \n",
       "5  casual              Saturday              1833.2157            \n",
       "6  member              Saturday               873.5756            \n",
       "7  casual              Sunday                1950.3462            \n",
       "8  member              Sunday                 894.7992            \n",
       "9  casual              Thursday              1455.8746            \n",
       "10 member              Thursday               728.3242            \n",
       "11 casual              Tuesday               1535.0761            \n",
       "12 member              Tuesday                724.7848            \n",
       "13 casual              Wednesday             1477.2912            \n",
       "14 member              Wednesday              735.0049            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips$ride_length ~ all_trips$user_type + all_trips$day_of_week, FUN = mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c9aab488",
   "metadata": {
    "papermill": {
     "duration": 0.025326,
     "end_time": "2022-07-04T14:53:42.991409",
     "exception": false,
     "start_time": "2022-07-04T14:53:42.966083",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Fixing the days of week order"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "e70a8ab7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:43.043318Z",
     "iopub.status.busy": "2022-07-04T14:53:43.041923Z",
     "iopub.status.idle": "2022-07-04T14:53:43.138236Z",
     "shell.execute_reply": "2022-07-04T14:53:43.136669Z"
    },
    "papermill": {
     "duration": 0.125216,
     "end_time": "2022-07-04T14:53:43.140691",
     "exception": false,
     "start_time": "2022-07-04T14:53:43.015475",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$day_of_week <- ordered(all_trips$day_of_week, levels=c(\"Sunday\", \"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "46f38b10",
   "metadata": {
    "papermill": {
     "duration": 0.024763,
     "end_time": "2022-07-04T14:53:43.189972",
     "exception": false,
     "start_time": "2022-07-04T14:53:43.165209",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Average ride time by each day for members and casual users"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "d8399ccb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:43.241125Z",
     "iopub.status.busy": "2022-07-04T14:53:43.239823Z",
     "iopub.status.idle": "2022-07-04T14:53:46.603377Z",
     "shell.execute_reply": "2022-07-04T14:53:46.601232Z"
    },
    "papermill": {
     "duration": 3.391998,
     "end_time": "2022-07-04T14:53:46.606083",
     "exception": false,
     "start_time": "2022-07-04T14:53:43.214085",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips$user_type</th><th scope=col>all_trips$day_of_week</th><th scope=col>all_trips$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>1950.3462</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 894.7992</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>1726.2944</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 750.1485</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>1535.0761</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 724.7848</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>1477.2912</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 735.0049</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>1455.8746</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 728.3242</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>1582.7978</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 758.2456</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>1833.2157</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 873.5756</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " all\\_trips\\$user\\_type & all\\_trips\\$day\\_of\\_week & all\\_trips\\$ride\\_length\\\\\n",
       " <chr> & <ord> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sunday    & 1950.3462\\\\\n",
       "\t member & Sunday    &  894.7992\\\\\n",
       "\t casual & Monday    & 1726.2944\\\\\n",
       "\t member & Monday    &  750.1485\\\\\n",
       "\t casual & Tuesday   & 1535.0761\\\\\n",
       "\t member & Tuesday   &  724.7848\\\\\n",
       "\t casual & Wednesday & 1477.2912\\\\\n",
       "\t member & Wednesday &  735.0049\\\\\n",
       "\t casual & Thursday  & 1455.8746\\\\\n",
       "\t member & Thursday  &  728.3242\\\\\n",
       "\t casual & Friday    & 1582.7978\\\\\n",
       "\t member & Friday    &  758.2456\\\\\n",
       "\t casual & Saturday  & 1833.2157\\\\\n",
       "\t member & Saturday  &  873.5756\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| all_trips$user_type &lt;chr&gt; | all_trips$day_of_week &lt;ord&gt; | all_trips$ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Sunday    | 1950.3462 |\n",
       "| member | Sunday    |  894.7992 |\n",
       "| casual | Monday    | 1726.2944 |\n",
       "| member | Monday    |  750.1485 |\n",
       "| casual | Tuesday   | 1535.0761 |\n",
       "| member | Tuesday   |  724.7848 |\n",
       "| casual | Wednesday | 1477.2912 |\n",
       "| member | Wednesday |  735.0049 |\n",
       "| casual | Thursday  | 1455.8746 |\n",
       "| member | Thursday  |  728.3242 |\n",
       "| casual | Friday    | 1582.7978 |\n",
       "| member | Friday    |  758.2456 |\n",
       "| casual | Saturday  | 1833.2157 |\n",
       "| member | Saturday  |  873.5756 |\n",
       "\n"
      ],
      "text/plain": [
       "   all_trips$user_type all_trips$day_of_week all_trips$ride_length\n",
       "1  casual              Sunday                1950.3462            \n",
       "2  member              Sunday                 894.7992            \n",
       "3  casual              Monday                1726.2944            \n",
       "4  member              Monday                 750.1485            \n",
       "5  casual              Tuesday               1535.0761            \n",
       "6  member              Tuesday                724.7848            \n",
       "7  casual              Wednesday             1477.2912            \n",
       "8  member              Wednesday              735.0049            \n",
       "9  casual              Thursday              1455.8746            \n",
       "10 member              Thursday               728.3242            \n",
       "11 casual              Friday                1582.7978            \n",
       "12 member              Friday                 758.2456            \n",
       "13 casual              Saturday              1833.2157            \n",
       "14 member              Saturday               873.5756            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips$ride_length ~ all_trips$user_type + all_trips$day_of_week, FUN = mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ea2011ec",
   "metadata": {
    "papermill": {
     "duration": 0.024259,
     "end_time": "2022-07-04T14:53:46.655023",
     "exception": false,
     "start_time": "2022-07-04T14:53:46.630764",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Clean the bike_type column\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "154e1676",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:46.707065Z",
     "iopub.status.busy": "2022-07-04T14:53:46.705750Z",
     "iopub.status.idle": "2022-07-04T14:53:49.960063Z",
     "shell.execute_reply": "2022-07-04T14:53:49.958383Z"
    },
    "papermill": {
     "duration": 3.283299,
     "end_time": "2022-07-04T14:53:49.962992",
     "exception": false,
     "start_time": "2022-07-04T14:53:46.679693",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$bike_type <- ifelse(all_trips$bike_type == \"classic_bike\", \"Classic Bike\", all_trips$bike_type)\n",
    "all_trips$bike_type <- ifelse(all_trips$bike_type == \"docked_bike\", \"Docked Bike\",all_trips$bike_type)\n",
    "all_trips$bike_type <- ifelse(all_trips$bike_type == \"electric_bike\", \"Electric Bike\" ,all_trips$bike_type)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e4ca2490",
   "metadata": {
    "papermill": {
     "duration": 0.025162,
     "end_time": "2022-07-04T14:53:50.013670",
     "exception": false,
     "start_time": "2022-07-04T14:53:49.988508",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Check duplicated values in ride_id column "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "950f7974",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:53:50.065150Z",
     "iopub.status.busy": "2022-07-04T14:53:50.063726Z",
     "iopub.status.idle": "2022-07-04T14:56:22.364295Z",
     "shell.execute_reply": "2022-07-04T14:56:22.362041Z"
    },
    "papermill": {
     "duration": 152.368557,
     "end_time": "2022-07-04T14:56:22.406583",
     "exception": false,
     "start_time": "2022-07-04T14:53:50.038026",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 340 × 21</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>dupe_count</th><th scope=col>bike_type</th><th scope=col>start_time</th><th scope=col>end_time</th><th scope=col>from_station</th><th scope=col>start_station_id</th><th scope=col>to_station</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>⋯</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>user_type</th><th scope=col>ride_length</th><th scope=col>day_of_week</th><th scope=col>date</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>quarter</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>⋯</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;yearqtr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1.03E+15</td><td>2</td><td>Classic Bike </td><td>20/09/2021 21:06</td><td>20/09/2021 21:25</td><td><span style=white-space:pre-wrap>Broadway &amp; Barry Ave                               </span></td><td><span style=white-space:pre-wrap>13137       </span></td><td><span style=white-space:pre-wrap>Clarendon Ave &amp; Gordon Ter           </span></td><td><span style=white-space:pre-wrap>13379       </span></td><td>41.93758</td><td>⋯</td><td>41.95787</td><td>-87.64951</td><td>casual</td><td>1089</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>2021-09-20</td><td>2021</td><td>09</td><td>20</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.03E+15</td><td>2</td><td>Classic Bike </td><td>27/09/2021 08:26</td><td>27/09/2021 08:33</td><td><span style=white-space:pre-wrap>Halsted St &amp; Clybourn Ave                          </span></td><td><span style=white-space:pre-wrap>331         </span></td><td><span style=white-space:pre-wrap>Clybourn Ave &amp; Division St           </span></td><td>TA1307000115</td><td>41.90967</td><td>⋯</td><td>41.90461</td><td>-87.64055</td><td>member</td><td> 372</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>2021-09-27</td><td>2021</td><td>09</td><td>27</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.08E+15</td><td>2</td><td>Classic Bike </td><td>23/04/2021 21:16</td><td>23/04/2021 21:22</td><td><span style=white-space:pre-wrap>Damen Ave &amp; Division St                            </span></td><td><span style=white-space:pre-wrap>13136       </span></td><td><span style=white-space:pre-wrap>California Ave &amp; Division St         </span></td><td><span style=white-space:pre-wrap>13256       </span></td><td>41.90327</td><td>⋯</td><td>41.90303</td><td>-87.69747</td><td>casual</td><td> 389</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-04-23</td><td>2021</td><td>04</td><td>23</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td>1.08E+15</td><td>2</td><td>Classic Bike </td><td>05/09/2021 20:00</td><td>05/09/2021 20:41</td><td><span style=white-space:pre-wrap>Albany Ave &amp; Bloomingdale Ave                      </span></td><td><span style=white-space:pre-wrap>15655       </span></td><td><span style=white-space:pre-wrap>Central Park Ave &amp; Bloomingdale Ave  </span></td><td><span style=white-space:pre-wrap>18017       </span></td><td>41.91403</td><td>⋯</td><td>41.91417</td><td>-87.71676</td><td>casual</td><td>2490</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-09-05</td><td>2021</td><td>09</td><td>05</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.26E+15</td><td>2</td><td>Electric Bike</td><td>04/04/2021 17:03</td><td>04/04/2021 17:39</td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Winona St                            </span></td><td>KA1504000078</td><td><span style=white-space:pre-wrap>Damen Ave &amp; Division St              </span></td><td><span style=white-space:pre-wrap>13136       </span></td><td>41.97493</td><td>⋯</td><td>41.90324</td><td>-87.67842</td><td>casual</td><td>2177</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-04-04</td><td>2021</td><td>04</td><td>04</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td>1.26E+15</td><td>2</td><td>Electric Bike</td><td>25/09/2021 06:16</td><td>25/09/2021 07:14</td><td><span style=white-space:pre-wrap>Broadway &amp; Barry Ave                               </span></td><td><span style=white-space:pre-wrap>13137       </span></td><td><span style=white-space:pre-wrap>Broadway &amp; Barry Ave                 </span></td><td><span style=white-space:pre-wrap>13137       </span></td><td>41.93774</td><td>⋯</td><td>41.93782</td><td>-87.64419</td><td>casual</td><td>3492</td><td>Saturday </td><td>2021-09-25</td><td>2021</td><td>09</td><td>25</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.46E+15</td><td>2</td><td><span style=white-space:pre-wrap>Docked Bike  </span></td><td>21/09/2021 14:40</td><td>21/09/2021 14:58</td><td><span style=white-space:pre-wrap>Sheridan Rd &amp; Irving Park Rd                       </span></td><td><span style=white-space:pre-wrap>13063       </span></td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Waveland Ave           </span></td><td><span style=white-space:pre-wrap>13253       </span></td><td>41.95425</td><td>⋯</td><td>41.94880</td><td>-87.67528</td><td>casual</td><td>1069</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>2021-09-21</td><td>2021</td><td>09</td><td>21</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.46E+15</td><td>2</td><td>Electric Bike</td><td>19/11/2021 18:15</td><td>19/11/2021 18:21</td><td><span style=white-space:pre-wrap>Walsh Park                                         </span></td><td><span style=white-space:pre-wrap>18067       </span></td><td><span style=white-space:pre-wrap>Ashland Ave &amp; Division St            </span></td><td><span style=white-space:pre-wrap>13061       </span></td><td>41.91461</td><td>⋯</td><td>41.90347</td><td>-87.66797</td><td>casual</td><td> 336</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-11-19</td><td>2021</td><td>11</td><td>19</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td>1.49E+15</td><td>2</td><td>Classic Bike </td><td>19/09/2021 16:06</td><td>19/09/2021 16:29</td><td><span style=white-space:pre-wrap>Millennium Park                                    </span></td><td><span style=white-space:pre-wrap>13008       </span></td><td><span style=white-space:pre-wrap>Calumet Ave &amp; 18th St                </span></td><td><span style=white-space:pre-wrap>13102       </span></td><td>41.88103</td><td>⋯</td><td>41.85761</td><td>-87.61941</td><td>casual</td><td>1420</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-09-19</td><td>2021</td><td>09</td><td>19</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.49E+15</td><td>2</td><td>Classic Bike </td><td>14/09/2021 19:08</td><td>14/09/2021 19:29</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; 14th St                             </span></td><td>TA1307000124</td><td><span style=white-space:pre-wrap>Cityfront Plaza Dr &amp; Pioneer Ct      </span></td><td><span style=white-space:pre-wrap>13427       </span></td><td>41.86406</td><td>⋯</td><td>41.89057</td><td>-87.62207</td><td>casual</td><td>1267</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>2021-09-14</td><td>2021</td><td>09</td><td>14</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.53E+15</td><td>2</td><td>Classic Bike </td><td>25/04/2021 11:20</td><td>25/04/2021 11:46</td><td><span style=white-space:pre-wrap>State St &amp; Randolph St                             </span></td><td>TA1305000029</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Washington St         </span></td><td><span style=white-space:pre-wrap>13001       </span></td><td>41.88468</td><td>⋯</td><td>41.88398</td><td>-87.62468</td><td>casual</td><td>1557</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-04-25</td><td>2021</td><td>04</td><td>25</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td>1.53E+15</td><td>2</td><td>Electric Bike</td><td>09/11/2021 07:32</td><td>09/11/2021 07:55</td><td><span style=white-space:pre-wrap>Ashland Ave &amp; Division St                          </span></td><td><span style=white-space:pre-wrap>13061       </span></td><td><span style=white-space:pre-wrap>Clark St &amp; Montrose Ave              </span></td><td>KA1503000022</td><td>41.90343</td><td>⋯</td><td>41.96160</td><td>-87.66634</td><td>casual</td><td>1376</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>2021-11-09</td><td>2021</td><td>11</td><td>09</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td>1.56E+21</td><td>2</td><td>Classic Bike </td><td>18/08/2021 22:34</td><td>18/08/2021 22:44</td><td><span style=white-space:pre-wrap>Wells St &amp; Concord Ln                              </span></td><td>TA1308000050</td><td><span style=white-space:pre-wrap>St. Clair St &amp; Erie St               </span></td><td><span style=white-space:pre-wrap>13016       </span></td><td>41.91213</td><td>⋯</td><td>41.89435</td><td>-87.62280</td><td>member</td><td> 650</td><td>Wednesday</td><td>2021-08-18</td><td>2021</td><td>08</td><td>18</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.56E+21</td><td>2</td><td>Electric Bike</td><td>19/09/2021 03:08</td><td>19/09/2021 03:16</td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Fullerton Ave                        </span></td><td>TA1309000058</td><td><span style=white-space:pre-wrap>Clark St &amp; Drummond Pl               </span></td><td>TA1307000142</td><td>41.92597</td><td>⋯</td><td>41.93123</td><td>-87.64436</td><td>member</td><td> 470</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-09-19</td><td>2021</td><td>09</td><td>19</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.58E+14</td><td>2</td><td>Classic Bike </td><td>10/04/2021 11:10</td><td>10/04/2021 11:19</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Roosevelt Rd                          </span></td><td>TA1305000002</td><td><span style=white-space:pre-wrap>Calumet Ave &amp; 18th St                </span></td><td><span style=white-space:pre-wrap>13102       </span></td><td>41.86723</td><td>⋯</td><td>41.85761</td><td>-87.61941</td><td>member</td><td> 549</td><td>Saturday </td><td>2021-04-10</td><td>2021</td><td>04</td><td>10</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td>1.58E+14</td><td>2</td><td>Electric Bike</td><td>28/07/2021 20:36</td><td>28/07/2021 20:43</td><td><span style=white-space:pre-wrap>Calumet Ave &amp; 35th St                              </span></td><td><span style=white-space:pre-wrap>13345       </span></td><td><span style=white-space:pre-wrap>MLK Jr Dr &amp; 47th St                  </span></td><td>TA1308000007</td><td>41.83141</td><td>⋯</td><td>41.80998</td><td>-87.61628</td><td>casual</td><td> 459</td><td>Wednesday</td><td>2021-07-28</td><td>2021</td><td>07</td><td>28</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.58E+15</td><td>2</td><td>Electric Bike</td><td>26/09/2021 20:03</td><td>26/09/2021 20:07</td><td><span style=white-space:pre-wrap>Larrabee St &amp; Armitage Ave                         </span></td><td>TA1309000006</td><td><span style=white-space:pre-wrap>Wells St &amp; Concord Ln                </span></td><td>TA1308000050</td><td>41.91813</td><td>⋯</td><td>41.91219</td><td>-87.63483</td><td>member</td><td> 204</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-09-26</td><td>2021</td><td>09</td><td>26</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.58E+15</td><td>2</td><td>Classic Bike </td><td>25/11/2021 11:22</td><td>25/11/2021 11:25</td><td><span style=white-space:pre-wrap>Blackstone Ave &amp; Hyde Park Blvd                    </span></td><td><span style=white-space:pre-wrap>13398       </span></td><td><span style=white-space:pre-wrap>Blackstone Ave &amp; Hyde Park Blvd      </span></td><td><span style=white-space:pre-wrap>13398       </span></td><td>41.80256</td><td>⋯</td><td>41.80256</td><td>-87.59037</td><td>member</td><td> 157</td><td>Thursday </td><td>2021-11-25</td><td>2021</td><td>11</td><td>25</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td>1.68E+15</td><td>2</td><td>Classic Bike </td><td>07/09/2021 18:09</td><td>07/09/2021 18:19</td><td><span style=white-space:pre-wrap>Wells St &amp; Concord Ln                              </span></td><td>TA1308000050</td><td><span style=white-space:pre-wrap>Clark St &amp; Elm St                    </span></td><td>TA1307000039</td><td>41.91213</td><td>⋯</td><td>41.90297</td><td>-87.63128</td><td>casual</td><td> 593</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>2021-09-07</td><td>2021</td><td>09</td><td>07</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>1.68E+15</td><td>2</td><td>Classic Bike </td><td>30/10/2021 23:35</td><td>30/10/2021 23:47</td><td><span style=white-space:pre-wrap>Paulina Ave &amp; North Ave                            </span></td><td>TA1305000037</td><td><span style=white-space:pre-wrap>California Ave &amp; Milwaukee Ave       </span></td><td><span style=white-space:pre-wrap>13084       </span></td><td>41.90985</td><td>⋯</td><td>41.92269</td><td>-87.69715</td><td>casual</td><td> 686</td><td>Saturday </td><td>2021-10-30</td><td>2021</td><td>10</td><td>30</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td>1.70E+15</td><td>2</td><td>Electric Bike</td><td>12/05/2021 22:25</td><td>12/05/2021 22:40</td><td><span style=white-space:pre-wrap>Wallace St &amp; 35th St                               </span></td><td>TA1308000045</td><td><span style=white-space:pre-wrap>Racine Ave &amp; 35th St                 </span></td><td><span style=white-space:pre-wrap>15446       </span></td><td>41.83060</td><td>⋯</td><td>41.83072</td><td>-87.65617</td><td>casual</td><td> 923</td><td>Wednesday</td><td>2021-05-12</td><td>2021</td><td>05</td><td>12</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td>1.70E+15</td><td>2</td><td>Classic Bike </td><td>09/11/2021 09:21</td><td>09/11/2021 09:27</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St                              </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>University Ave &amp; 57th St             </span></td><td>KA1503000071</td><td>41.79957</td><td>⋯</td><td>41.79148</td><td>-87.59986</td><td>member</td><td> 336</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>2021-11-09</td><td>2021</td><td>11</td><td>09</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td>2.02E+15</td><td>5</td><td>Classic Bike </td><td>03/04/2021 11:40</td><td>03/04/2021 11:48</td><td><span style=white-space:pre-wrap>Paulina St &amp; Montrose Ave                          </span></td><td>TA1309000021</td><td><span style=white-space:pre-wrap>Western Ave &amp; Leland Ave             </span></td><td>TA1307000140</td><td>41.96151</td><td>⋯</td><td>41.96649</td><td>-87.68842</td><td>member</td><td> 478</td><td>Saturday </td><td>2021-04-03</td><td>2021</td><td>04</td><td>03</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td>2.02E+15</td><td>5</td><td>Classic Bike </td><td>16/04/2021 16:18</td><td>16/04/2021 18:27</td><td><span style=white-space:pre-wrap>Leavitt St &amp; Chicago Ave                           </span></td><td><span style=white-space:pre-wrap>18058       </span></td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Washington St         </span></td><td><span style=white-space:pre-wrap>13001       </span></td><td>41.89550</td><td>⋯</td><td>41.88398</td><td>-87.62468</td><td>casual</td><td>7736</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-04-16</td><td>2021</td><td>04</td><td>16</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td>2.02E+15</td><td>5</td><td>Classic Bike </td><td>02/04/2021 23:58</td><td>03/04/2021 00:02</td><td><span style=white-space:pre-wrap>Halsted St &amp; Dickens Ave                           </span></td><td><span style=white-space:pre-wrap>13192       </span></td><td><span style=white-space:pre-wrap>Larrabee St &amp; Webster Ave            </span></td><td><span style=white-space:pre-wrap>13193       </span></td><td>41.91994</td><td>⋯</td><td>41.92182</td><td>-87.64414</td><td>casual</td><td> 210</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-04-02</td><td>2021</td><td>04</td><td>02</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td>2.02E+15</td><td>5</td><td>Classic Bike </td><td>24/09/2021 19:35</td><td>24/09/2021 20:12</td><td><span style=white-space:pre-wrap>Paulina Ave &amp; North Ave                            </span></td><td>TA1305000037</td><td><span style=white-space:pre-wrap>Paulina Ave &amp; North Ave              </span></td><td>TA1305000037</td><td>41.90985</td><td>⋯</td><td>41.90985</td><td>-87.66993</td><td>member</td><td>2221</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-09-24</td><td>2021</td><td>09</td><td>24</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>2.02E+15</td><td>5</td><td>Electric Bike</td><td>18/09/2021 16:27</td><td>18/09/2021 16:51</td><td>Broadway &amp; Wilson - Truman College Vaccination Site</td><td><span style=white-space:pre-wrap>13074       </span></td><td><span style=white-space:pre-wrap>Clark St &amp; Lincoln Ave               </span></td><td><span style=white-space:pre-wrap>13179       </span></td><td>41.96516</td><td>⋯</td><td>41.91572</td><td>-87.63465</td><td>casual</td><td>1418</td><td>Saturday </td><td>2021-09-18</td><td>2021</td><td>09</td><td>18</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>2.11E+15</td><td>2</td><td>Classic Bike </td><td>11/04/2021 13:01</td><td>11/04/2021 13:06</td><td><span style=white-space:pre-wrap>LaSalle St &amp; Washington St                         </span></td><td><span style=white-space:pre-wrap>13006       </span></td><td><span style=white-space:pre-wrap>Green St &amp; Madison St                </span></td><td>TA1307000120</td><td>41.88266</td><td>⋯</td><td>41.88189</td><td>-87.64879</td><td>member</td><td> 317</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-04-11</td><td>2021</td><td>04</td><td>11</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td>2.11E+15</td><td>2</td><td>Electric Bike</td><td>12/12/2021 18:59</td><td>12/12/2021 19:06</td><td><span style=white-space:pre-wrap>Sheffield Ave &amp; Fullerton Ave                      </span></td><td>TA1306000016</td><td>DuSable Lake Shore Dr &amp; Diversey Pkwy</td><td>TA1309000039</td><td>41.92570</td><td>⋯</td><td>41.93259</td><td>-87.63643</td><td>casual</td><td> 393</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-12-12</td><td>2021</td><td>12</td><td>12</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td>2.28E+15</td><td>4</td><td>Classic Bike </td><td>14/04/2021 17:08</td><td>14/04/2021 17:36</td><td><span style=white-space:pre-wrap>Sedgwick St &amp; Huron St                             </span></td><td>TA1307000062</td><td><span style=white-space:pre-wrap>Clark St &amp; Lincoln Ave               </span></td><td><span style=white-space:pre-wrap>13179       </span></td><td>41.89467</td><td>⋯</td><td>41.91569</td><td>-87.63460</td><td>member</td><td>1651</td><td>Wednesday</td><td>2021-04-14</td><td>2021</td><td>04</td><td>14</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋱</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.24E+15   </span></td><td>3</td><td>Classic Bike </td><td>13/04/2021 08:14</td><td>13/04/2021 08:38</td><td><span style=white-space:pre-wrap>Wilton Ave &amp; Belmont Ave               </span></td><td>TA1307000134</td><td><span style=white-space:pre-wrap>Clark St &amp; Lake St                </span></td><td>KA1503000012</td><td>41.94018</td><td>⋯</td><td>41.88602</td><td>-87.63088</td><td>member</td><td>1444</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>2021-04-13</td><td>2021</td><td>04</td><td>13</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.24E+15   </span></td><td>3</td><td>Classic Bike </td><td>06/08/2021 14:11</td><td>06/08/2021 14:20</td><td><span style=white-space:pre-wrap>Honore St &amp; Division St                </span></td><td>TA1305000034</td><td><span style=white-space:pre-wrap>Campbell Ave &amp; North Ave          </span></td><td><span style=white-space:pre-wrap>13257       </span></td><td>41.90312</td><td>⋯</td><td>41.91054</td><td>-87.68956</td><td>member</td><td> 571</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-08-06</td><td>2021</td><td>08</td><td>06</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.24E+15   </span></td><td>3</td><td><span style=white-space:pre-wrap>Docked Bike  </span></td><td>03/09/2021 00:12</td><td>03/09/2021 00:30</td><td><span style=white-space:pre-wrap>Paulina Ave &amp; North Ave                </span></td><td>TA1305000037</td><td><span style=white-space:pre-wrap>Winchester Ave &amp; Elston Ave       </span></td><td>KA1504000140</td><td>41.90986</td><td>⋯</td><td>41.92409</td><td>-87.67646</td><td>casual</td><td>1098</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-09-03</td><td>2021</td><td>09</td><td>03</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.27E+15   </span></td><td>2</td><td>Classic Bike </td><td>02/04/2021 15:33</td><td>02/04/2021 15:49</td><td><span style=white-space:pre-wrap>Shore Dr &amp; 55th St                     </span></td><td>TA1308000009</td><td><span style=white-space:pre-wrap>Ellis Ave &amp; 60th St               </span></td><td>KA1503000014</td><td>41.79521</td><td>⋯</td><td>41.78510</td><td>-87.60107</td><td>member</td><td> 940</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-04-02</td><td>2021</td><td>04</td><td>02</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.27E+15   </span></td><td>2</td><td>Electric Bike</td><td>18/11/2021 13:22</td><td>18/11/2021 13:25</td><td><span style=white-space:pre-wrap>Franklin St &amp; Monroe St                </span></td><td>TA1309000007</td><td><span style=white-space:pre-wrap>Green St &amp; Madison St             </span></td><td>TA1307000120</td><td>41.87910</td><td>⋯</td><td>41.88180</td><td>-87.64870</td><td>member</td><td> 233</td><td>Thursday </td><td>2021-11-18</td><td>2021</td><td>11</td><td>18</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.30E+15   </span></td><td>2</td><td>Classic Bike </td><td>06/09/2021 12:44</td><td>06/09/2021 13:02</td><td><span style=white-space:pre-wrap>Green St &amp; Madison St                  </span></td><td>TA1307000120</td><td><span style=white-space:pre-wrap>Racine Ave &amp; 13th St              </span></td><td><span style=white-space:pre-wrap>13165       </span></td><td>41.88189</td><td>⋯</td><td>41.86505</td><td>-87.65696</td><td>casual</td><td>1087</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>2021-09-06</td><td>2021</td><td>09</td><td>06</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.30E+15   </span></td><td>2</td><td>Classic Bike </td><td>30/09/2021 11:55</td><td>30/09/2021 12:08</td><td><span style=white-space:pre-wrap>Elmwood Ave &amp; Austin St                </span></td><td><span style=white-space:pre-wrap>598         </span></td><td><span style=white-space:pre-wrap>Benson Ave &amp; Church St            </span></td><td><span style=white-space:pre-wrap>596         </span></td><td>42.02578</td><td>⋯</td><td>42.04821</td><td>-87.68349</td><td>member</td><td> 784</td><td>Thursday </td><td>2021-09-30</td><td>2021</td><td>09</td><td>30</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.31E+15   </span></td><td>2</td><td>Classic Bike </td><td>22/09/2021 22:29</td><td>22/09/2021 22:44</td><td><span style=white-space:pre-wrap>Sheffield Ave &amp; Waveland Ave           </span></td><td>TA1307000126</td><td><span style=white-space:pre-wrap>Ashland Ave &amp; Wellington Ave      </span></td><td><span style=white-space:pre-wrap>13269       </span></td><td>41.94940</td><td>⋯</td><td>41.93608</td><td>-87.66981</td><td>casual</td><td> 897</td><td>Wednesday</td><td>2021-09-22</td><td>2021</td><td>09</td><td>22</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.31E+15   </span></td><td>2</td><td>Classic Bike </td><td>11/09/2021 17:10</td><td>11/09/2021 17:21</td><td><span style=white-space:pre-wrap>Western Ave &amp; Leland Ave               </span></td><td>TA1307000140</td><td><span style=white-space:pre-wrap>Southport Ave &amp; Clark St          </span></td><td>TA1308000047</td><td>41.96640</td><td>⋯</td><td>41.95708</td><td>-87.66420</td><td>casual</td><td> 659</td><td>Saturday </td><td>2021-09-11</td><td>2021</td><td>09</td><td>11</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.35E+15   </span></td><td>2</td><td>Classic Bike </td><td>27/04/2021 20:01</td><td>27/04/2021 21:14</td><td><span style=white-space:pre-wrap>California Ave &amp; Francis Pl (Temp)     </span></td><td><span style=white-space:pre-wrap>13259       </span></td><td>California Ave &amp; Francis Pl (Temp)</td><td><span style=white-space:pre-wrap>13259       </span></td><td>41.91849</td><td>⋯</td><td>41.91849</td><td>-87.69742</td><td>casual</td><td>4389</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>2021-04-27</td><td>2021</td><td>04</td><td>27</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.35E+15   </span></td><td>2</td><td>Classic Bike </td><td>25/09/2021 09:18</td><td>25/09/2021 09:27</td><td><span style=white-space:pre-wrap>Dearborn Pkwy &amp; Delaware Pl            </span></td><td>TA1307000128</td><td><span style=white-space:pre-wrap>St. Clair St &amp; Erie St            </span></td><td><span style=white-space:pre-wrap>13016       </span></td><td>41.89897</td><td>⋯</td><td>41.89435</td><td>-87.62280</td><td>member</td><td> 537</td><td>Saturday </td><td>2021-09-25</td><td>2021</td><td>09</td><td>25</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.42E+15   </span></td><td>2</td><td>Electric Bike</td><td>10/09/2021 18:26</td><td>10/09/2021 19:20</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Madison St              </span></td><td><span style=white-space:pre-wrap>13036       </span></td><td><span style=white-space:pre-wrap>Columbus Dr &amp; Randolph St         </span></td><td><span style=white-space:pre-wrap>13263       </span></td><td>41.88206</td><td>⋯</td><td>41.88427</td><td>-87.61936</td><td>member</td><td>3233</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-09-10</td><td>2021</td><td>09</td><td>10</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.42E+15   </span></td><td>2</td><td>Classic Bike </td><td>17/11/2021 18:48</td><td>17/11/2021 18:54</td><td><span style=white-space:pre-wrap>Clark St &amp; Drummond Pl                 </span></td><td>TA1307000142</td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Fullerton Ave       </span></td><td>TA1309000058</td><td>41.93125</td><td>⋯</td><td>41.92416</td><td>-87.64638</td><td>member</td><td> 409</td><td>Wednesday</td><td>2021-11-17</td><td>2021</td><td>11</td><td>17</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.44E+15   </span></td><td>2</td><td>Classic Bike </td><td>25/04/2021 00:03</td><td>25/04/2021 00:16</td><td><span style=white-space:pre-wrap>Southport Ave &amp; Wellington Ave         </span></td><td>TA1307000006</td><td><span style=white-space:pre-wrap>Leavitt St &amp; Armitage Ave         </span></td><td>TA1309000029</td><td>41.93573</td><td>⋯</td><td>41.91781</td><td>-87.68244</td><td>member</td><td> 759</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-04-25</td><td>2021</td><td>04</td><td>25</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.44E+15   </span></td><td>2</td><td>Electric Bike</td><td>19/11/2021 16:47</td><td>19/11/2021 16:54</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St               </span></td><td>KA1503000043</td><td><span style=white-space:pre-wrap>St. Clair St &amp; Erie St            </span></td><td><span style=white-space:pre-wrap>13016       </span></td><td>41.88923</td><td>⋯</td><td>41.89429</td><td>-87.62320</td><td>member</td><td> 399</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-11-19</td><td>2021</td><td>11</td><td>19</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.50E+15   </span></td><td>2</td><td>Classic Bike </td><td>25/09/2021 12:35</td><td>25/09/2021 13:49</td><td><span style=white-space:pre-wrap>Canal St &amp; Madison St                  </span></td><td><span style=white-space:pre-wrap>13341       </span></td><td><span style=white-space:pre-wrap>Fairbanks Ct &amp; Grand Ave          </span></td><td>TA1305000003</td><td>41.88209</td><td>⋯</td><td>41.89185</td><td>-87.62058</td><td>casual</td><td>4424</td><td>Saturday </td><td>2021-09-25</td><td>2021</td><td>09</td><td>25</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.50E+15   </span></td><td>2</td><td>Classic Bike </td><td>18/09/2021 19:21</td><td>18/09/2021 19:24</td><td><span style=white-space:pre-wrap>California Ave &amp; Cortez St             </span></td><td><span style=white-space:pre-wrap>17660       </span></td><td><span style=white-space:pre-wrap>California Ave &amp; Division St      </span></td><td><span style=white-space:pre-wrap>13256       </span></td><td>41.90036</td><td>⋯</td><td>41.90303</td><td>-87.69747</td><td>member</td><td> 160</td><td>Saturday </td><td>2021-09-18</td><td>2021</td><td>09</td><td>18</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td>9.52266E+15</td><td>2</td><td>Classic Bike </td><td>17/10/2021 15:46</td><td>17/10/2021 16:05</td><td><span style=white-space:pre-wrap>New St &amp; Illinois St                   </span></td><td>TA1306000013</td><td><span style=white-space:pre-wrap>Desplaines St &amp; Jackson Blvd      </span></td><td><span style=white-space:pre-wrap>15539       </span></td><td>41.89085</td><td>⋯</td><td>41.87812</td><td>-87.64395</td><td>member</td><td>1141</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-10-17</td><td>2021</td><td>10</td><td>17</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td>9.52266E+15</td><td>2</td><td>Classic Bike </td><td>04/12/2021 18:12</td><td>04/12/2021 18:44</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Washington St           </span></td><td><span style=white-space:pre-wrap>13001       </span></td><td><span style=white-space:pre-wrap>Honore St &amp; Division St           </span></td><td>TA1305000034</td><td>41.88398</td><td>⋯</td><td>41.90312</td><td>-87.67394</td><td>member</td><td>1925</td><td>Saturday </td><td>2021-12-04</td><td>2021</td><td>12</td><td>04</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.65E+15   </span></td><td>3</td><td>Electric Bike</td><td>06/09/2021 20:31</td><td>06/09/2021 21:07</td><td><span style=white-space:pre-wrap>Avers Ave &amp; Belmont Ave                </span></td><td><span style=white-space:pre-wrap>15640       </span></td><td><span style=white-space:pre-wrap>Central Park Ave &amp; Elbridge Ave   </span></td><td><span style=white-space:pre-wrap>15644       </span></td><td>41.93945</td><td>⋯</td><td>41.93535</td><td>-87.71685</td><td>casual</td><td>2120</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>2021-09-06</td><td>2021</td><td>09</td><td>06</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.65E+15   </span></td><td>3</td><td>Classic Bike </td><td>06/09/2021 14:46</td><td>06/09/2021 15:13</td><td><span style=white-space:pre-wrap>Indiana Ave &amp; Roosevelt Rd             </span></td><td><span style=white-space:pre-wrap>SL-005      </span></td><td><span style=white-space:pre-wrap>Delano Ct &amp; Roosevelt Rd          </span></td><td>KA1706005007</td><td>41.86789</td><td>⋯</td><td>41.86749</td><td>-87.63219</td><td>member</td><td>1626</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>2021-09-06</td><td>2021</td><td>09</td><td>06</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.65E+15   </span></td><td>3</td><td>Classic Bike </td><td>29/09/2021 09:15</td><td>29/09/2021 09:28</td><td><span style=white-space:pre-wrap>Wells St &amp; Huron St                    </span></td><td>TA1306000012</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Adams St             </span></td><td>KA1503000015</td><td>41.89472</td><td>⋯</td><td>41.87947</td><td>-87.62569</td><td>member</td><td> 784</td><td>Wednesday</td><td>2021-09-29</td><td>2021</td><td>09</td><td>29</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.75E+15   </span></td><td>2</td><td>Classic Bike </td><td>18/04/2021 17:15</td><td>18/04/2021 17:23</td><td><span style=white-space:pre-wrap>Clark St &amp; Armitage Ave                </span></td><td><span style=white-space:pre-wrap>13146       </span></td><td><span style=white-space:pre-wrap>Wells St &amp; Elm St                 </span></td><td>KA1504000135</td><td>41.91831</td><td>⋯</td><td>41.90322</td><td>-87.63432</td><td>member</td><td> 480</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-04-18</td><td>2021</td><td>04</td><td>18</td><td>2021 Q2</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.75E+15   </span></td><td>2</td><td>Classic Bike </td><td>26/09/2021 09:36</td><td>26/09/2021 09:52</td><td><span style=white-space:pre-wrap>Clark St &amp; Drummond Pl                 </span></td><td>TA1307000142</td><td><span style=white-space:pre-wrap>Larrabee St &amp; Kingsbury St        </span></td><td>TA1306000009</td><td>41.93125</td><td>⋯</td><td>41.89776</td><td>-87.64288</td><td>member</td><td> 978</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>2021-09-26</td><td>2021</td><td>09</td><td>26</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.92E+15   </span></td><td>2</td><td><span style=white-space:pre-wrap>Docked Bike  </span></td><td>24/09/2021 12:55</td><td>24/09/2021 13:21</td><td>Wolcott (Ravenswood) Ave &amp; Montrose Ave</td><td>TA1307000144</td><td><span style=white-space:pre-wrap>Damen Ave &amp; Melrose Ave           </span></td><td><span style=white-space:pre-wrap>13143       </span></td><td>41.96141</td><td>⋯</td><td>41.94060</td><td>-87.67850</td><td>casual</td><td>1577</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-09-24</td><td>2021</td><td>09</td><td>24</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.92E+15   </span></td><td>2</td><td>Classic Bike </td><td>19/11/2021 17:20</td><td>19/11/2021 17:27</td><td><span style=white-space:pre-wrap>Clybourn Ave &amp; Division St             </span></td><td>TA1307000115</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Erie St            </span></td><td><span style=white-space:pre-wrap>13265       </span></td><td>41.90461</td><td>⋯</td><td>41.89381</td><td>-87.64170</td><td>casual</td><td> 458</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>2021-11-19</td><td>2021</td><td>11</td><td>19</td><td>2021 Q4</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.94E+15   </span></td><td>2</td><td>Classic Bike </td><td>04/09/2021 10:40</td><td>04/09/2021 12:33</td><td><span style=white-space:pre-wrap>Clinton St &amp; Jackson Blvd              </span></td><td><span style=white-space:pre-wrap>638         </span></td><td><span style=white-space:pre-wrap>Dearborn St &amp; Adams St            </span></td><td>TA1305000005</td><td>41.87832</td><td>⋯</td><td>41.87936</td><td>-87.62979</td><td>casual</td><td>6782</td><td>Saturday </td><td>2021-09-04</td><td>2021</td><td>09</td><td>04</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.94E+15   </span></td><td>2</td><td>Classic Bike </td><td>30/09/2021 14:37</td><td>30/09/2021 14:39</td><td><span style=white-space:pre-wrap>Wells St &amp; Walton St                   </span></td><td>TA1306000011</td><td><span style=white-space:pre-wrap>Franklin St &amp; Chicago Ave         </span></td><td><span style=white-space:pre-wrap>13017       </span></td><td>41.89993</td><td>⋯</td><td>41.89675</td><td>-87.63567</td><td>member</td><td> 105</td><td>Thursday </td><td>2021-09-30</td><td>2021</td><td>09</td><td>30</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.96E+15   </span></td><td>2</td><td>Electric Bike</td><td>11/09/2021 11:11</td><td>11/09/2021 11:49</td><td><span style=white-space:pre-wrap>DuSable Lake Shore Dr &amp; Monroe St      </span></td><td><span style=white-space:pre-wrap>13300       </span></td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St             </span></td><td><span style=white-space:pre-wrap>13042       </span></td><td>41.88098</td><td>⋯</td><td>41.90098</td><td>-87.62377</td><td>casual</td><td>2240</td><td>Saturday </td><td>2021-09-11</td><td>2021</td><td>09</td><td>11</td><td>2021 Q3</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>9.96E+15   </span></td><td>2</td><td>Classic Bike </td><td>04/09/2021 06:36</td><td>04/09/2021 07:07</td><td><span style=white-space:pre-wrap>Indiana Ave &amp; Roosevelt Rd             </span></td><td><span style=white-space:pre-wrap>SL-005      </span></td><td><span style=white-space:pre-wrap>Clark St &amp; Lincoln Ave            </span></td><td><span style=white-space:pre-wrap>13179       </span></td><td>41.86789</td><td>⋯</td><td>41.91569</td><td>-87.63460</td><td>member</td><td>1861</td><td>Saturday </td><td>2021-09-04</td><td>2021</td><td>09</td><td>04</td><td>2021 Q3</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 340 × 21\n",
       "\\begin{tabular}{lllllllllllllllllllll}\n",
       " ride\\_id & dupe\\_count & bike\\_type & start\\_time & end\\_time & from\\_station & start\\_station\\_id & to\\_station & end\\_station\\_id & start\\_lat & ⋯ & end\\_lat & end\\_lng & user\\_type & ride\\_length & day\\_of\\_week & date & year & month & day & quarter\\\\\n",
       " <chr> & <int> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & ⋯ & <dbl> & <dbl> & <chr> & <dbl> & <ord> & <date> & <chr> & <chr> & <chr> & <yearqtr>\\\\\n",
       "\\hline\n",
       "\t 1.03E+15 & 2 & Classic Bike  & 20/09/2021 21:06 & 20/09/2021 21:25 & Broadway \\& Barry Ave                                & 13137        & Clarendon Ave \\& Gordon Ter            & 13379        & 41.93758 & ⋯ & 41.95787 & -87.64951 & casual & 1089 & Monday    & 2021-09-20 & 2021 & 09 & 20 & 2021 Q3\\\\\n",
       "\t 1.03E+15 & 2 & Classic Bike  & 27/09/2021 08:26 & 27/09/2021 08:33 & Halsted St \\& Clybourn Ave                           & 331          & Clybourn Ave \\& Division St            & TA1307000115 & 41.90967 & ⋯ & 41.90461 & -87.64055 & member &  372 & Monday    & 2021-09-27 & 2021 & 09 & 27 & 2021 Q3\\\\\n",
       "\t 1.08E+15 & 2 & Classic Bike  & 23/04/2021 21:16 & 23/04/2021 21:22 & Damen Ave \\& Division St                             & 13136        & California Ave \\& Division St          & 13256        & 41.90327 & ⋯ & 41.90303 & -87.69747 & casual &  389 & Friday    & 2021-04-23 & 2021 & 04 & 23 & 2021 Q2\\\\\n",
       "\t 1.08E+15 & 2 & Classic Bike  & 05/09/2021 20:00 & 05/09/2021 20:41 & Albany Ave \\& Bloomingdale Ave                       & 15655        & Central Park Ave \\& Bloomingdale Ave   & 18017        & 41.91403 & ⋯ & 41.91417 & -87.71676 & casual & 2490 & Sunday    & 2021-09-05 & 2021 & 09 & 05 & 2021 Q3\\\\\n",
       "\t 1.26E+15 & 2 & Electric Bike & 04/04/2021 17:03 & 04/04/2021 17:39 & Lincoln Ave \\& Winona St                             & KA1504000078 & Damen Ave \\& Division St               & 13136        & 41.97493 & ⋯ & 41.90324 & -87.67842 & casual & 2177 & Sunday    & 2021-04-04 & 2021 & 04 & 04 & 2021 Q2\\\\\n",
       "\t 1.26E+15 & 2 & Electric Bike & 25/09/2021 06:16 & 25/09/2021 07:14 & Broadway \\& Barry Ave                                & 13137        & Broadway \\& Barry Ave                  & 13137        & 41.93774 & ⋯ & 41.93782 & -87.64419 & casual & 3492 & Saturday  & 2021-09-25 & 2021 & 09 & 25 & 2021 Q3\\\\\n",
       "\t 1.46E+15 & 2 & Docked Bike   & 21/09/2021 14:40 & 21/09/2021 14:58 & Sheridan Rd \\& Irving Park Rd                        & 13063        & Lincoln Ave \\& Waveland Ave            & 13253        & 41.95425 & ⋯ & 41.94880 & -87.67528 & casual & 1069 & Tuesday   & 2021-09-21 & 2021 & 09 & 21 & 2021 Q3\\\\\n",
       "\t 1.46E+15 & 2 & Electric Bike & 19/11/2021 18:15 & 19/11/2021 18:21 & Walsh Park                                          & 18067        & Ashland Ave \\& Division St             & 13061        & 41.91461 & ⋯ & 41.90347 & -87.66797 & casual &  336 & Friday    & 2021-11-19 & 2021 & 11 & 19 & 2021 Q4\\\\\n",
       "\t 1.49E+15 & 2 & Classic Bike  & 19/09/2021 16:06 & 19/09/2021 16:29 & Millennium Park                                     & 13008        & Calumet Ave \\& 18th St                 & 13102        & 41.88103 & ⋯ & 41.85761 & -87.61941 & casual & 1420 & Sunday    & 2021-09-19 & 2021 & 09 & 19 & 2021 Q3\\\\\n",
       "\t 1.49E+15 & 2 & Classic Bike  & 14/09/2021 19:08 & 14/09/2021 19:29 & Michigan Ave \\& 14th St                              & TA1307000124 & Cityfront Plaza Dr \\& Pioneer Ct       & 13427        & 41.86406 & ⋯ & 41.89057 & -87.62207 & casual & 1267 & Tuesday   & 2021-09-14 & 2021 & 09 & 14 & 2021 Q3\\\\\n",
       "\t 1.53E+15 & 2 & Classic Bike  & 25/04/2021 11:20 & 25/04/2021 11:46 & State St \\& Randolph St                              & TA1305000029 & Michigan Ave \\& Washington St          & 13001        & 41.88468 & ⋯ & 41.88398 & -87.62468 & casual & 1557 & Sunday    & 2021-04-25 & 2021 & 04 & 25 & 2021 Q2\\\\\n",
       "\t 1.53E+15 & 2 & Electric Bike & 09/11/2021 07:32 & 09/11/2021 07:55 & Ashland Ave \\& Division St                           & 13061        & Clark St \\& Montrose Ave               & KA1503000022 & 41.90343 & ⋯ & 41.96160 & -87.66634 & casual & 1376 & Tuesday   & 2021-11-09 & 2021 & 11 & 09 & 2021 Q4\\\\\n",
       "\t 1.56E+21 & 2 & Classic Bike  & 18/08/2021 22:34 & 18/08/2021 22:44 & Wells St \\& Concord Ln                               & TA1308000050 & St. Clair St \\& Erie St                & 13016        & 41.91213 & ⋯ & 41.89435 & -87.62280 & member &  650 & Wednesday & 2021-08-18 & 2021 & 08 & 18 & 2021 Q3\\\\\n",
       "\t 1.56E+21 & 2 & Electric Bike & 19/09/2021 03:08 & 19/09/2021 03:16 & Lincoln Ave \\& Fullerton Ave                         & TA1309000058 & Clark St \\& Drummond Pl                & TA1307000142 & 41.92597 & ⋯ & 41.93123 & -87.64436 & member &  470 & Sunday    & 2021-09-19 & 2021 & 09 & 19 & 2021 Q3\\\\\n",
       "\t 1.58E+14 & 2 & Classic Bike  & 10/04/2021 11:10 & 10/04/2021 11:19 & Wabash Ave \\& Roosevelt Rd                           & TA1305000002 & Calumet Ave \\& 18th St                 & 13102        & 41.86723 & ⋯ & 41.85761 & -87.61941 & member &  549 & Saturday  & 2021-04-10 & 2021 & 04 & 10 & 2021 Q2\\\\\n",
       "\t 1.58E+14 & 2 & Electric Bike & 28/07/2021 20:36 & 28/07/2021 20:43 & Calumet Ave \\& 35th St                               & 13345        & MLK Jr Dr \\& 47th St                   & TA1308000007 & 41.83141 & ⋯ & 41.80998 & -87.61628 & casual &  459 & Wednesday & 2021-07-28 & 2021 & 07 & 28 & 2021 Q3\\\\\n",
       "\t 1.58E+15 & 2 & Electric Bike & 26/09/2021 20:03 & 26/09/2021 20:07 & Larrabee St \\& Armitage Ave                          & TA1309000006 & Wells St \\& Concord Ln                 & TA1308000050 & 41.91813 & ⋯ & 41.91219 & -87.63483 & member &  204 & Sunday    & 2021-09-26 & 2021 & 09 & 26 & 2021 Q3\\\\\n",
       "\t 1.58E+15 & 2 & Classic Bike  & 25/11/2021 11:22 & 25/11/2021 11:25 & Blackstone Ave \\& Hyde Park Blvd                     & 13398        & Blackstone Ave \\& Hyde Park Blvd       & 13398        & 41.80256 & ⋯ & 41.80256 & -87.59037 & member &  157 & Thursday  & 2021-11-25 & 2021 & 11 & 25 & 2021 Q4\\\\\n",
       "\t 1.68E+15 & 2 & Classic Bike  & 07/09/2021 18:09 & 07/09/2021 18:19 & Wells St \\& Concord Ln                               & TA1308000050 & Clark St \\& Elm St                     & TA1307000039 & 41.91213 & ⋯ & 41.90297 & -87.63128 & casual &  593 & Tuesday   & 2021-09-07 & 2021 & 09 & 07 & 2021 Q3\\\\\n",
       "\t 1.68E+15 & 2 & Classic Bike  & 30/10/2021 23:35 & 30/10/2021 23:47 & Paulina Ave \\& North Ave                             & TA1305000037 & California Ave \\& Milwaukee Ave        & 13084        & 41.90985 & ⋯ & 41.92269 & -87.69715 & casual &  686 & Saturday  & 2021-10-30 & 2021 & 10 & 30 & 2021 Q4\\\\\n",
       "\t 1.70E+15 & 2 & Electric Bike & 12/05/2021 22:25 & 12/05/2021 22:40 & Wallace St \\& 35th St                                & TA1308000045 & Racine Ave \\& 35th St                  & 15446        & 41.83060 & ⋯ & 41.83072 & -87.65617 & casual &  923 & Wednesday & 2021-05-12 & 2021 & 05 & 12 & 2021 Q2\\\\\n",
       "\t 1.70E+15 & 2 & Classic Bike  & 09/11/2021 09:21 & 09/11/2021 09:27 & Kimbark Ave \\& 53rd St                               & TA1309000037 & University Ave \\& 57th St              & KA1503000071 & 41.79957 & ⋯ & 41.79148 & -87.59986 & member &  336 & Tuesday   & 2021-11-09 & 2021 & 11 & 09 & 2021 Q4\\\\\n",
       "\t 2.02E+15 & 5 & Classic Bike  & 03/04/2021 11:40 & 03/04/2021 11:48 & Paulina St \\& Montrose Ave                           & TA1309000021 & Western Ave \\& Leland Ave              & TA1307000140 & 41.96151 & ⋯ & 41.96649 & -87.68842 & member &  478 & Saturday  & 2021-04-03 & 2021 & 04 & 03 & 2021 Q2\\\\\n",
       "\t 2.02E+15 & 5 & Classic Bike  & 16/04/2021 16:18 & 16/04/2021 18:27 & Leavitt St \\& Chicago Ave                            & 18058        & Michigan Ave \\& Washington St          & 13001        & 41.89550 & ⋯ & 41.88398 & -87.62468 & casual & 7736 & Friday    & 2021-04-16 & 2021 & 04 & 16 & 2021 Q2\\\\\n",
       "\t 2.02E+15 & 5 & Classic Bike  & 02/04/2021 23:58 & 03/04/2021 00:02 & Halsted St \\& Dickens Ave                            & 13192        & Larrabee St \\& Webster Ave             & 13193        & 41.91994 & ⋯ & 41.92182 & -87.64414 & casual &  210 & Friday    & 2021-04-02 & 2021 & 04 & 02 & 2021 Q2\\\\\n",
       "\t 2.02E+15 & 5 & Classic Bike  & 24/09/2021 19:35 & 24/09/2021 20:12 & Paulina Ave \\& North Ave                             & TA1305000037 & Paulina Ave \\& North Ave               & TA1305000037 & 41.90985 & ⋯ & 41.90985 & -87.66993 & member & 2221 & Friday    & 2021-09-24 & 2021 & 09 & 24 & 2021 Q3\\\\\n",
       "\t 2.02E+15 & 5 & Electric Bike & 18/09/2021 16:27 & 18/09/2021 16:51 & Broadway \\& Wilson - Truman College Vaccination Site & 13074        & Clark St \\& Lincoln Ave                & 13179        & 41.96516 & ⋯ & 41.91572 & -87.63465 & casual & 1418 & Saturday  & 2021-09-18 & 2021 & 09 & 18 & 2021 Q3\\\\\n",
       "\t 2.11E+15 & 2 & Classic Bike  & 11/04/2021 13:01 & 11/04/2021 13:06 & LaSalle St \\& Washington St                          & 13006        & Green St \\& Madison St                 & TA1307000120 & 41.88266 & ⋯ & 41.88189 & -87.64879 & member &  317 & Sunday    & 2021-04-11 & 2021 & 04 & 11 & 2021 Q2\\\\\n",
       "\t 2.11E+15 & 2 & Electric Bike & 12/12/2021 18:59 & 12/12/2021 19:06 & Sheffield Ave \\& Fullerton Ave                       & TA1306000016 & DuSable Lake Shore Dr \\& Diversey Pkwy & TA1309000039 & 41.92570 & ⋯ & 41.93259 & -87.63643 & casual &  393 & Sunday    & 2021-12-12 & 2021 & 12 & 12 & 2021 Q4\\\\\n",
       "\t 2.28E+15 & 4 & Classic Bike  & 14/04/2021 17:08 & 14/04/2021 17:36 & Sedgwick St \\& Huron St                              & TA1307000062 & Clark St \\& Lincoln Ave                & 13179        & 41.89467 & ⋯ & 41.91569 & -87.63460 & member & 1651 & Wednesday & 2021-04-14 & 2021 & 04 & 14 & 2021 Q2\\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋱ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t 9.24E+15    & 3 & Classic Bike  & 13/04/2021 08:14 & 13/04/2021 08:38 & Wilton Ave \\& Belmont Ave                & TA1307000134 & Clark St \\& Lake St                 & KA1503000012 & 41.94018 & ⋯ & 41.88602 & -87.63088 & member & 1444 & Tuesday   & 2021-04-13 & 2021 & 04 & 13 & 2021 Q2\\\\\n",
       "\t 9.24E+15    & 3 & Classic Bike  & 06/08/2021 14:11 & 06/08/2021 14:20 & Honore St \\& Division St                 & TA1305000034 & Campbell Ave \\& North Ave           & 13257        & 41.90312 & ⋯ & 41.91054 & -87.68956 & member &  571 & Friday    & 2021-08-06 & 2021 & 08 & 06 & 2021 Q3\\\\\n",
       "\t 9.24E+15    & 3 & Docked Bike   & 03/09/2021 00:12 & 03/09/2021 00:30 & Paulina Ave \\& North Ave                 & TA1305000037 & Winchester Ave \\& Elston Ave        & KA1504000140 & 41.90986 & ⋯ & 41.92409 & -87.67646 & casual & 1098 & Friday    & 2021-09-03 & 2021 & 09 & 03 & 2021 Q3\\\\\n",
       "\t 9.27E+15    & 2 & Classic Bike  & 02/04/2021 15:33 & 02/04/2021 15:49 & Shore Dr \\& 55th St                      & TA1308000009 & Ellis Ave \\& 60th St                & KA1503000014 & 41.79521 & ⋯ & 41.78510 & -87.60107 & member &  940 & Friday    & 2021-04-02 & 2021 & 04 & 02 & 2021 Q2\\\\\n",
       "\t 9.27E+15    & 2 & Electric Bike & 18/11/2021 13:22 & 18/11/2021 13:25 & Franklin St \\& Monroe St                 & TA1309000007 & Green St \\& Madison St              & TA1307000120 & 41.87910 & ⋯ & 41.88180 & -87.64870 & member &  233 & Thursday  & 2021-11-18 & 2021 & 11 & 18 & 2021 Q4\\\\\n",
       "\t 9.30E+15    & 2 & Classic Bike  & 06/09/2021 12:44 & 06/09/2021 13:02 & Green St \\& Madison St                   & TA1307000120 & Racine Ave \\& 13th St               & 13165        & 41.88189 & ⋯ & 41.86505 & -87.65696 & casual & 1087 & Monday    & 2021-09-06 & 2021 & 09 & 06 & 2021 Q3\\\\\n",
       "\t 9.30E+15    & 2 & Classic Bike  & 30/09/2021 11:55 & 30/09/2021 12:08 & Elmwood Ave \\& Austin St                 & 598          & Benson Ave \\& Church St             & 596          & 42.02578 & ⋯ & 42.04821 & -87.68349 & member &  784 & Thursday  & 2021-09-30 & 2021 & 09 & 30 & 2021 Q3\\\\\n",
       "\t 9.31E+15    & 2 & Classic Bike  & 22/09/2021 22:29 & 22/09/2021 22:44 & Sheffield Ave \\& Waveland Ave            & TA1307000126 & Ashland Ave \\& Wellington Ave       & 13269        & 41.94940 & ⋯ & 41.93608 & -87.66981 & casual &  897 & Wednesday & 2021-09-22 & 2021 & 09 & 22 & 2021 Q3\\\\\n",
       "\t 9.31E+15    & 2 & Classic Bike  & 11/09/2021 17:10 & 11/09/2021 17:21 & Western Ave \\& Leland Ave                & TA1307000140 & Southport Ave \\& Clark St           & TA1308000047 & 41.96640 & ⋯ & 41.95708 & -87.66420 & casual &  659 & Saturday  & 2021-09-11 & 2021 & 09 & 11 & 2021 Q3\\\\\n",
       "\t 9.35E+15    & 2 & Classic Bike  & 27/04/2021 20:01 & 27/04/2021 21:14 & California Ave \\& Francis Pl (Temp)      & 13259        & California Ave \\& Francis Pl (Temp) & 13259        & 41.91849 & ⋯ & 41.91849 & -87.69742 & casual & 4389 & Tuesday   & 2021-04-27 & 2021 & 04 & 27 & 2021 Q2\\\\\n",
       "\t 9.35E+15    & 2 & Classic Bike  & 25/09/2021 09:18 & 25/09/2021 09:27 & Dearborn Pkwy \\& Delaware Pl             & TA1307000128 & St. Clair St \\& Erie St             & 13016        & 41.89897 & ⋯ & 41.89435 & -87.62280 & member &  537 & Saturday  & 2021-09-25 & 2021 & 09 & 25 & 2021 Q3\\\\\n",
       "\t 9.42E+15    & 2 & Electric Bike & 10/09/2021 18:26 & 10/09/2021 19:20 & Michigan Ave \\& Madison St               & 13036        & Columbus Dr \\& Randolph St          & 13263        & 41.88206 & ⋯ & 41.88427 & -87.61936 & member & 3233 & Friday    & 2021-09-10 & 2021 & 09 & 10 & 2021 Q3\\\\\n",
       "\t 9.42E+15    & 2 & Classic Bike  & 17/11/2021 18:48 & 17/11/2021 18:54 & Clark St \\& Drummond Pl                  & TA1307000142 & Lincoln Ave \\& Fullerton Ave        & TA1309000058 & 41.93125 & ⋯ & 41.92416 & -87.64638 & member &  409 & Wednesday & 2021-11-17 & 2021 & 11 & 17 & 2021 Q4\\\\\n",
       "\t 9.44E+15    & 2 & Classic Bike  & 25/04/2021 00:03 & 25/04/2021 00:16 & Southport Ave \\& Wellington Ave          & TA1307000006 & Leavitt St \\& Armitage Ave          & TA1309000029 & 41.93573 & ⋯ & 41.91781 & -87.68244 & member &  759 & Sunday    & 2021-04-25 & 2021 & 04 & 25 & 2021 Q2\\\\\n",
       "\t 9.44E+15    & 2 & Electric Bike & 19/11/2021 16:47 & 19/11/2021 16:54 & Kingsbury St \\& Kinzie St                & KA1503000043 & St. Clair St \\& Erie St             & 13016        & 41.88923 & ⋯ & 41.89429 & -87.62320 & member &  399 & Friday    & 2021-11-19 & 2021 & 11 & 19 & 2021 Q4\\\\\n",
       "\t 9.50E+15    & 2 & Classic Bike  & 25/09/2021 12:35 & 25/09/2021 13:49 & Canal St \\& Madison St                   & 13341        & Fairbanks Ct \\& Grand Ave           & TA1305000003 & 41.88209 & ⋯ & 41.89185 & -87.62058 & casual & 4424 & Saturday  & 2021-09-25 & 2021 & 09 & 25 & 2021 Q3\\\\\n",
       "\t 9.50E+15    & 2 & Classic Bike  & 18/09/2021 19:21 & 18/09/2021 19:24 & California Ave \\& Cortez St              & 17660        & California Ave \\& Division St       & 13256        & 41.90036 & ⋯ & 41.90303 & -87.69747 & member &  160 & Saturday  & 2021-09-18 & 2021 & 09 & 18 & 2021 Q3\\\\\n",
       "\t 9.52266E+15 & 2 & Classic Bike  & 17/10/2021 15:46 & 17/10/2021 16:05 & New St \\& Illinois St                    & TA1306000013 & Desplaines St \\& Jackson Blvd       & 15539        & 41.89085 & ⋯ & 41.87812 & -87.64395 & member & 1141 & Sunday    & 2021-10-17 & 2021 & 10 & 17 & 2021 Q4\\\\\n",
       "\t 9.52266E+15 & 2 & Classic Bike  & 04/12/2021 18:12 & 04/12/2021 18:44 & Michigan Ave \\& Washington St            & 13001        & Honore St \\& Division St            & TA1305000034 & 41.88398 & ⋯ & 41.90312 & -87.67394 & member & 1925 & Saturday  & 2021-12-04 & 2021 & 12 & 04 & 2021 Q4\\\\\n",
       "\t 9.65E+15    & 3 & Electric Bike & 06/09/2021 20:31 & 06/09/2021 21:07 & Avers Ave \\& Belmont Ave                 & 15640        & Central Park Ave \\& Elbridge Ave    & 15644        & 41.93945 & ⋯ & 41.93535 & -87.71685 & casual & 2120 & Monday    & 2021-09-06 & 2021 & 09 & 06 & 2021 Q3\\\\\n",
       "\t 9.65E+15    & 3 & Classic Bike  & 06/09/2021 14:46 & 06/09/2021 15:13 & Indiana Ave \\& Roosevelt Rd              & SL-005       & Delano Ct \\& Roosevelt Rd           & KA1706005007 & 41.86789 & ⋯ & 41.86749 & -87.63219 & member & 1626 & Monday    & 2021-09-06 & 2021 & 09 & 06 & 2021 Q3\\\\\n",
       "\t 9.65E+15    & 3 & Classic Bike  & 29/09/2021 09:15 & 29/09/2021 09:28 & Wells St \\& Huron St                     & TA1306000012 & Wabash Ave \\& Adams St              & KA1503000015 & 41.89472 & ⋯ & 41.87947 & -87.62569 & member &  784 & Wednesday & 2021-09-29 & 2021 & 09 & 29 & 2021 Q3\\\\\n",
       "\t 9.75E+15    & 2 & Classic Bike  & 18/04/2021 17:15 & 18/04/2021 17:23 & Clark St \\& Armitage Ave                 & 13146        & Wells St \\& Elm St                  & KA1504000135 & 41.91831 & ⋯ & 41.90322 & -87.63432 & member &  480 & Sunday    & 2021-04-18 & 2021 & 04 & 18 & 2021 Q2\\\\\n",
       "\t 9.75E+15    & 2 & Classic Bike  & 26/09/2021 09:36 & 26/09/2021 09:52 & Clark St \\& Drummond Pl                  & TA1307000142 & Larrabee St \\& Kingsbury St         & TA1306000009 & 41.93125 & ⋯ & 41.89776 & -87.64288 & member &  978 & Sunday    & 2021-09-26 & 2021 & 09 & 26 & 2021 Q3\\\\\n",
       "\t 9.92E+15    & 2 & Docked Bike   & 24/09/2021 12:55 & 24/09/2021 13:21 & Wolcott (Ravenswood) Ave \\& Montrose Ave & TA1307000144 & Damen Ave \\& Melrose Ave            & 13143        & 41.96141 & ⋯ & 41.94060 & -87.67850 & casual & 1577 & Friday    & 2021-09-24 & 2021 & 09 & 24 & 2021 Q3\\\\\n",
       "\t 9.92E+15    & 2 & Classic Bike  & 19/11/2021 17:20 & 19/11/2021 17:27 & Clybourn Ave \\& Division St              & TA1307000115 & Kingsbury St \\& Erie St             & 13265        & 41.90461 & ⋯ & 41.89381 & -87.64170 & casual &  458 & Friday    & 2021-11-19 & 2021 & 11 & 19 & 2021 Q4\\\\\n",
       "\t 9.94E+15    & 2 & Classic Bike  & 04/09/2021 10:40 & 04/09/2021 12:33 & Clinton St \\& Jackson Blvd               & 638          & Dearborn St \\& Adams St             & TA1305000005 & 41.87832 & ⋯ & 41.87936 & -87.62979 & casual & 6782 & Saturday  & 2021-09-04 & 2021 & 09 & 04 & 2021 Q3\\\\\n",
       "\t 9.94E+15    & 2 & Classic Bike  & 30/09/2021 14:37 & 30/09/2021 14:39 & Wells St \\& Walton St                    & TA1306000011 & Franklin St \\& Chicago Ave          & 13017        & 41.89993 & ⋯ & 41.89675 & -87.63567 & member &  105 & Thursday  & 2021-09-30 & 2021 & 09 & 30 & 2021 Q3\\\\\n",
       "\t 9.96E+15    & 2 & Electric Bike & 11/09/2021 11:11 & 11/09/2021 11:49 & DuSable Lake Shore Dr \\& Monroe St       & 13300        & Michigan Ave \\& Oak St              & 13042        & 41.88098 & ⋯ & 41.90098 & -87.62377 & casual & 2240 & Saturday  & 2021-09-11 & 2021 & 09 & 11 & 2021 Q3\\\\\n",
       "\t 9.96E+15    & 2 & Classic Bike  & 04/09/2021 06:36 & 04/09/2021 07:07 & Indiana Ave \\& Roosevelt Rd              & SL-005       & Clark St \\& Lincoln Ave             & 13179        & 41.86789 & ⋯ & 41.91569 & -87.63460 & member & 1861 & Saturday  & 2021-09-04 & 2021 & 09 & 04 & 2021 Q3\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 340 × 21\n",
       "\n",
       "| ride_id &lt;chr&gt; | dupe_count &lt;int&gt; | bike_type &lt;chr&gt; | start_time &lt;chr&gt; | end_time &lt;chr&gt; | from_station &lt;chr&gt; | start_station_id &lt;chr&gt; | to_station &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | ⋯ ⋯ | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | user_type &lt;chr&gt; | ride_length &lt;dbl&gt; | day_of_week &lt;ord&gt; | date &lt;date&gt; | year &lt;chr&gt; | month &lt;chr&gt; | day &lt;chr&gt; | quarter &lt;yearqtr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1.03E+15 | 2 | Classic Bike  | 20/09/2021 21:06 | 20/09/2021 21:25 | Broadway &amp; Barry Ave                                | 13137        | Clarendon Ave &amp; Gordon Ter            | 13379        | 41.93758 | ⋯ | 41.95787 | -87.64951 | casual | 1089 | Monday    | 2021-09-20 | 2021 | 09 | 20 | 2021 Q3 |\n",
       "| 1.03E+15 | 2 | Classic Bike  | 27/09/2021 08:26 | 27/09/2021 08:33 | Halsted St &amp; Clybourn Ave                           | 331          | Clybourn Ave &amp; Division St            | TA1307000115 | 41.90967 | ⋯ | 41.90461 | -87.64055 | member |  372 | Monday    | 2021-09-27 | 2021 | 09 | 27 | 2021 Q3 |\n",
       "| 1.08E+15 | 2 | Classic Bike  | 23/04/2021 21:16 | 23/04/2021 21:22 | Damen Ave &amp; Division St                             | 13136        | California Ave &amp; Division St          | 13256        | 41.90327 | ⋯ | 41.90303 | -87.69747 | casual |  389 | Friday    | 2021-04-23 | 2021 | 04 | 23 | 2021 Q2 |\n",
       "| 1.08E+15 | 2 | Classic Bike  | 05/09/2021 20:00 | 05/09/2021 20:41 | Albany Ave &amp; Bloomingdale Ave                       | 15655        | Central Park Ave &amp; Bloomingdale Ave   | 18017        | 41.91403 | ⋯ | 41.91417 | -87.71676 | casual | 2490 | Sunday    | 2021-09-05 | 2021 | 09 | 05 | 2021 Q3 |\n",
       "| 1.26E+15 | 2 | Electric Bike | 04/04/2021 17:03 | 04/04/2021 17:39 | Lincoln Ave &amp; Winona St                             | KA1504000078 | Damen Ave &amp; Division St               | 13136        | 41.97493 | ⋯ | 41.90324 | -87.67842 | casual | 2177 | Sunday    | 2021-04-04 | 2021 | 04 | 04 | 2021 Q2 |\n",
       "| 1.26E+15 | 2 | Electric Bike | 25/09/2021 06:16 | 25/09/2021 07:14 | Broadway &amp; Barry Ave                                | 13137        | Broadway &amp; Barry Ave                  | 13137        | 41.93774 | ⋯ | 41.93782 | -87.64419 | casual | 3492 | Saturday  | 2021-09-25 | 2021 | 09 | 25 | 2021 Q3 |\n",
       "| 1.46E+15 | 2 | Docked Bike   | 21/09/2021 14:40 | 21/09/2021 14:58 | Sheridan Rd &amp; Irving Park Rd                        | 13063        | Lincoln Ave &amp; Waveland Ave            | 13253        | 41.95425 | ⋯ | 41.94880 | -87.67528 | casual | 1069 | Tuesday   | 2021-09-21 | 2021 | 09 | 21 | 2021 Q3 |\n",
       "| 1.46E+15 | 2 | Electric Bike | 19/11/2021 18:15 | 19/11/2021 18:21 | Walsh Park                                          | 18067        | Ashland Ave &amp; Division St             | 13061        | 41.91461 | ⋯ | 41.90347 | -87.66797 | casual |  336 | Friday    | 2021-11-19 | 2021 | 11 | 19 | 2021 Q4 |\n",
       "| 1.49E+15 | 2 | Classic Bike  | 19/09/2021 16:06 | 19/09/2021 16:29 | Millennium Park                                     | 13008        | Calumet Ave &amp; 18th St                 | 13102        | 41.88103 | ⋯ | 41.85761 | -87.61941 | casual | 1420 | Sunday    | 2021-09-19 | 2021 | 09 | 19 | 2021 Q3 |\n",
       "| 1.49E+15 | 2 | Classic Bike  | 14/09/2021 19:08 | 14/09/2021 19:29 | Michigan Ave &amp; 14th St                              | TA1307000124 | Cityfront Plaza Dr &amp; Pioneer Ct       | 13427        | 41.86406 | ⋯ | 41.89057 | -87.62207 | casual | 1267 | Tuesday   | 2021-09-14 | 2021 | 09 | 14 | 2021 Q3 |\n",
       "| 1.53E+15 | 2 | Classic Bike  | 25/04/2021 11:20 | 25/04/2021 11:46 | State St &amp; Randolph St                              | TA1305000029 | Michigan Ave &amp; Washington St          | 13001        | 41.88468 | ⋯ | 41.88398 | -87.62468 | casual | 1557 | Sunday    | 2021-04-25 | 2021 | 04 | 25 | 2021 Q2 |\n",
       "| 1.53E+15 | 2 | Electric Bike | 09/11/2021 07:32 | 09/11/2021 07:55 | Ashland Ave &amp; Division St                           | 13061        | Clark St &amp; Montrose Ave               | KA1503000022 | 41.90343 | ⋯ | 41.96160 | -87.66634 | casual | 1376 | Tuesday   | 2021-11-09 | 2021 | 11 | 09 | 2021 Q4 |\n",
       "| 1.56E+21 | 2 | Classic Bike  | 18/08/2021 22:34 | 18/08/2021 22:44 | Wells St &amp; Concord Ln                               | TA1308000050 | St. Clair St &amp; Erie St                | 13016        | 41.91213 | ⋯ | 41.89435 | -87.62280 | member |  650 | Wednesday | 2021-08-18 | 2021 | 08 | 18 | 2021 Q3 |\n",
       "| 1.56E+21 | 2 | Electric Bike | 19/09/2021 03:08 | 19/09/2021 03:16 | Lincoln Ave &amp; Fullerton Ave                         | TA1309000058 | Clark St &amp; Drummond Pl                | TA1307000142 | 41.92597 | ⋯ | 41.93123 | -87.64436 | member |  470 | Sunday    | 2021-09-19 | 2021 | 09 | 19 | 2021 Q3 |\n",
       "| 1.58E+14 | 2 | Classic Bike  | 10/04/2021 11:10 | 10/04/2021 11:19 | Wabash Ave &amp; Roosevelt Rd                           | TA1305000002 | Calumet Ave &amp; 18th St                 | 13102        | 41.86723 | ⋯ | 41.85761 | -87.61941 | member |  549 | Saturday  | 2021-04-10 | 2021 | 04 | 10 | 2021 Q2 |\n",
       "| 1.58E+14 | 2 | Electric Bike | 28/07/2021 20:36 | 28/07/2021 20:43 | Calumet Ave &amp; 35th St                               | 13345        | MLK Jr Dr &amp; 47th St                   | TA1308000007 | 41.83141 | ⋯ | 41.80998 | -87.61628 | casual |  459 | Wednesday | 2021-07-28 | 2021 | 07 | 28 | 2021 Q3 |\n",
       "| 1.58E+15 | 2 | Electric Bike | 26/09/2021 20:03 | 26/09/2021 20:07 | Larrabee St &amp; Armitage Ave                          | TA1309000006 | Wells St &amp; Concord Ln                 | TA1308000050 | 41.91813 | ⋯ | 41.91219 | -87.63483 | member |  204 | Sunday    | 2021-09-26 | 2021 | 09 | 26 | 2021 Q3 |\n",
       "| 1.58E+15 | 2 | Classic Bike  | 25/11/2021 11:22 | 25/11/2021 11:25 | Blackstone Ave &amp; Hyde Park Blvd                     | 13398        | Blackstone Ave &amp; Hyde Park Blvd       | 13398        | 41.80256 | ⋯ | 41.80256 | -87.59037 | member |  157 | Thursday  | 2021-11-25 | 2021 | 11 | 25 | 2021 Q4 |\n",
       "| 1.68E+15 | 2 | Classic Bike  | 07/09/2021 18:09 | 07/09/2021 18:19 | Wells St &amp; Concord Ln                               | TA1308000050 | Clark St &amp; Elm St                     | TA1307000039 | 41.91213 | ⋯ | 41.90297 | -87.63128 | casual |  593 | Tuesday   | 2021-09-07 | 2021 | 09 | 07 | 2021 Q3 |\n",
       "| 1.68E+15 | 2 | Classic Bike  | 30/10/2021 23:35 | 30/10/2021 23:47 | Paulina Ave &amp; North Ave                             | TA1305000037 | California Ave &amp; Milwaukee Ave        | 13084        | 41.90985 | ⋯ | 41.92269 | -87.69715 | casual |  686 | Saturday  | 2021-10-30 | 2021 | 10 | 30 | 2021 Q4 |\n",
       "| 1.70E+15 | 2 | Electric Bike | 12/05/2021 22:25 | 12/05/2021 22:40 | Wallace St &amp; 35th St                                | TA1308000045 | Racine Ave &amp; 35th St                  | 15446        | 41.83060 | ⋯ | 41.83072 | -87.65617 | casual |  923 | Wednesday | 2021-05-12 | 2021 | 05 | 12 | 2021 Q2 |\n",
       "| 1.70E+15 | 2 | Classic Bike  | 09/11/2021 09:21 | 09/11/2021 09:27 | Kimbark Ave &amp; 53rd St                               | TA1309000037 | University Ave &amp; 57th St              | KA1503000071 | 41.79957 | ⋯ | 41.79148 | -87.59986 | member |  336 | Tuesday   | 2021-11-09 | 2021 | 11 | 09 | 2021 Q4 |\n",
       "| 2.02E+15 | 5 | Classic Bike  | 03/04/2021 11:40 | 03/04/2021 11:48 | Paulina St &amp; Montrose Ave                           | TA1309000021 | Western Ave &amp; Leland Ave              | TA1307000140 | 41.96151 | ⋯ | 41.96649 | -87.68842 | member |  478 | Saturday  | 2021-04-03 | 2021 | 04 | 03 | 2021 Q2 |\n",
       "| 2.02E+15 | 5 | Classic Bike  | 16/04/2021 16:18 | 16/04/2021 18:27 | Leavitt St &amp; Chicago Ave                            | 18058        | Michigan Ave &amp; Washington St          | 13001        | 41.89550 | ⋯ | 41.88398 | -87.62468 | casual | 7736 | Friday    | 2021-04-16 | 2021 | 04 | 16 | 2021 Q2 |\n",
       "| 2.02E+15 | 5 | Classic Bike  | 02/04/2021 23:58 | 03/04/2021 00:02 | Halsted St &amp; Dickens Ave                            | 13192        | Larrabee St &amp; Webster Ave             | 13193        | 41.91994 | ⋯ | 41.92182 | -87.64414 | casual |  210 | Friday    | 2021-04-02 | 2021 | 04 | 02 | 2021 Q2 |\n",
       "| 2.02E+15 | 5 | Classic Bike  | 24/09/2021 19:35 | 24/09/2021 20:12 | Paulina Ave &amp; North Ave                             | TA1305000037 | Paulina Ave &amp; North Ave               | TA1305000037 | 41.90985 | ⋯ | 41.90985 | -87.66993 | member | 2221 | Friday    | 2021-09-24 | 2021 | 09 | 24 | 2021 Q3 |\n",
       "| 2.02E+15 | 5 | Electric Bike | 18/09/2021 16:27 | 18/09/2021 16:51 | Broadway &amp; Wilson - Truman College Vaccination Site | 13074        | Clark St &amp; Lincoln Ave                | 13179        | 41.96516 | ⋯ | 41.91572 | -87.63465 | casual | 1418 | Saturday  | 2021-09-18 | 2021 | 09 | 18 | 2021 Q3 |\n",
       "| 2.11E+15 | 2 | Classic Bike  | 11/04/2021 13:01 | 11/04/2021 13:06 | LaSalle St &amp; Washington St                          | 13006        | Green St &amp; Madison St                 | TA1307000120 | 41.88266 | ⋯ | 41.88189 | -87.64879 | member |  317 | Sunday    | 2021-04-11 | 2021 | 04 | 11 | 2021 Q2 |\n",
       "| 2.11E+15 | 2 | Electric Bike | 12/12/2021 18:59 | 12/12/2021 19:06 | Sheffield Ave &amp; Fullerton Ave                       | TA1306000016 | DuSable Lake Shore Dr &amp; Diversey Pkwy | TA1309000039 | 41.92570 | ⋯ | 41.93259 | -87.63643 | casual |  393 | Sunday    | 2021-12-12 | 2021 | 12 | 12 | 2021 Q4 |\n",
       "| 2.28E+15 | 4 | Classic Bike  | 14/04/2021 17:08 | 14/04/2021 17:36 | Sedgwick St &amp; Huron St                              | TA1307000062 | Clark St &amp; Lincoln Ave                | 13179        | 41.89467 | ⋯ | 41.91569 | -87.63460 | member | 1651 | Wednesday | 2021-04-14 | 2021 | 04 | 14 | 2021 Q2 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋱ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 9.24E+15    | 3 | Classic Bike  | 13/04/2021 08:14 | 13/04/2021 08:38 | Wilton Ave &amp; Belmont Ave                | TA1307000134 | Clark St &amp; Lake St                 | KA1503000012 | 41.94018 | ⋯ | 41.88602 | -87.63088 | member | 1444 | Tuesday   | 2021-04-13 | 2021 | 04 | 13 | 2021 Q2 |\n",
       "| 9.24E+15    | 3 | Classic Bike  | 06/08/2021 14:11 | 06/08/2021 14:20 | Honore St &amp; Division St                 | TA1305000034 | Campbell Ave &amp; North Ave           | 13257        | 41.90312 | ⋯ | 41.91054 | -87.68956 | member |  571 | Friday    | 2021-08-06 | 2021 | 08 | 06 | 2021 Q3 |\n",
       "| 9.24E+15    | 3 | Docked Bike   | 03/09/2021 00:12 | 03/09/2021 00:30 | Paulina Ave &amp; North Ave                 | TA1305000037 | Winchester Ave &amp; Elston Ave        | KA1504000140 | 41.90986 | ⋯ | 41.92409 | -87.67646 | casual | 1098 | Friday    | 2021-09-03 | 2021 | 09 | 03 | 2021 Q3 |\n",
       "| 9.27E+15    | 2 | Classic Bike  | 02/04/2021 15:33 | 02/04/2021 15:49 | Shore Dr &amp; 55th St                      | TA1308000009 | Ellis Ave &amp; 60th St                | KA1503000014 | 41.79521 | ⋯ | 41.78510 | -87.60107 | member |  940 | Friday    | 2021-04-02 | 2021 | 04 | 02 | 2021 Q2 |\n",
       "| 9.27E+15    | 2 | Electric Bike | 18/11/2021 13:22 | 18/11/2021 13:25 | Franklin St &amp; Monroe St                 | TA1309000007 | Green St &amp; Madison St              | TA1307000120 | 41.87910 | ⋯ | 41.88180 | -87.64870 | member |  233 | Thursday  | 2021-11-18 | 2021 | 11 | 18 | 2021 Q4 |\n",
       "| 9.30E+15    | 2 | Classic Bike  | 06/09/2021 12:44 | 06/09/2021 13:02 | Green St &amp; Madison St                   | TA1307000120 | Racine Ave &amp; 13th St               | 13165        | 41.88189 | ⋯ | 41.86505 | -87.65696 | casual | 1087 | Monday    | 2021-09-06 | 2021 | 09 | 06 | 2021 Q3 |\n",
       "| 9.30E+15    | 2 | Classic Bike  | 30/09/2021 11:55 | 30/09/2021 12:08 | Elmwood Ave &amp; Austin St                 | 598          | Benson Ave &amp; Church St             | 596          | 42.02578 | ⋯ | 42.04821 | -87.68349 | member |  784 | Thursday  | 2021-09-30 | 2021 | 09 | 30 | 2021 Q3 |\n",
       "| 9.31E+15    | 2 | Classic Bike  | 22/09/2021 22:29 | 22/09/2021 22:44 | Sheffield Ave &amp; Waveland Ave            | TA1307000126 | Ashland Ave &amp; Wellington Ave       | 13269        | 41.94940 | ⋯ | 41.93608 | -87.66981 | casual |  897 | Wednesday | 2021-09-22 | 2021 | 09 | 22 | 2021 Q3 |\n",
       "| 9.31E+15    | 2 | Classic Bike  | 11/09/2021 17:10 | 11/09/2021 17:21 | Western Ave &amp; Leland Ave                | TA1307000140 | Southport Ave &amp; Clark St           | TA1308000047 | 41.96640 | ⋯ | 41.95708 | -87.66420 | casual |  659 | Saturday  | 2021-09-11 | 2021 | 09 | 11 | 2021 Q3 |\n",
       "| 9.35E+15    | 2 | Classic Bike  | 27/04/2021 20:01 | 27/04/2021 21:14 | California Ave &amp; Francis Pl (Temp)      | 13259        | California Ave &amp; Francis Pl (Temp) | 13259        | 41.91849 | ⋯ | 41.91849 | -87.69742 | casual | 4389 | Tuesday   | 2021-04-27 | 2021 | 04 | 27 | 2021 Q2 |\n",
       "| 9.35E+15    | 2 | Classic Bike  | 25/09/2021 09:18 | 25/09/2021 09:27 | Dearborn Pkwy &amp; Delaware Pl             | TA1307000128 | St. Clair St &amp; Erie St             | 13016        | 41.89897 | ⋯ | 41.89435 | -87.62280 | member |  537 | Saturday  | 2021-09-25 | 2021 | 09 | 25 | 2021 Q3 |\n",
       "| 9.42E+15    | 2 | Electric Bike | 10/09/2021 18:26 | 10/09/2021 19:20 | Michigan Ave &amp; Madison St               | 13036        | Columbus Dr &amp; Randolph St          | 13263        | 41.88206 | ⋯ | 41.88427 | -87.61936 | member | 3233 | Friday    | 2021-09-10 | 2021 | 09 | 10 | 2021 Q3 |\n",
       "| 9.42E+15    | 2 | Classic Bike  | 17/11/2021 18:48 | 17/11/2021 18:54 | Clark St &amp; Drummond Pl                  | TA1307000142 | Lincoln Ave &amp; Fullerton Ave        | TA1309000058 | 41.93125 | ⋯ | 41.92416 | -87.64638 | member |  409 | Wednesday | 2021-11-17 | 2021 | 11 | 17 | 2021 Q4 |\n",
       "| 9.44E+15    | 2 | Classic Bike  | 25/04/2021 00:03 | 25/04/2021 00:16 | Southport Ave &amp; Wellington Ave          | TA1307000006 | Leavitt St &amp; Armitage Ave          | TA1309000029 | 41.93573 | ⋯ | 41.91781 | -87.68244 | member |  759 | Sunday    | 2021-04-25 | 2021 | 04 | 25 | 2021 Q2 |\n",
       "| 9.44E+15    | 2 | Electric Bike | 19/11/2021 16:47 | 19/11/2021 16:54 | Kingsbury St &amp; Kinzie St                | KA1503000043 | St. Clair St &amp; Erie St             | 13016        | 41.88923 | ⋯ | 41.89429 | -87.62320 | member |  399 | Friday    | 2021-11-19 | 2021 | 11 | 19 | 2021 Q4 |\n",
       "| 9.50E+15    | 2 | Classic Bike  | 25/09/2021 12:35 | 25/09/2021 13:49 | Canal St &amp; Madison St                   | 13341        | Fairbanks Ct &amp; Grand Ave           | TA1305000003 | 41.88209 | ⋯ | 41.89185 | -87.62058 | casual | 4424 | Saturday  | 2021-09-25 | 2021 | 09 | 25 | 2021 Q3 |\n",
       "| 9.50E+15    | 2 | Classic Bike  | 18/09/2021 19:21 | 18/09/2021 19:24 | California Ave &amp; Cortez St              | 17660        | California Ave &amp; Division St       | 13256        | 41.90036 | ⋯ | 41.90303 | -87.69747 | member |  160 | Saturday  | 2021-09-18 | 2021 | 09 | 18 | 2021 Q3 |\n",
       "| 9.52266E+15 | 2 | Classic Bike  | 17/10/2021 15:46 | 17/10/2021 16:05 | New St &amp; Illinois St                    | TA1306000013 | Desplaines St &amp; Jackson Blvd       | 15539        | 41.89085 | ⋯ | 41.87812 | -87.64395 | member | 1141 | Sunday    | 2021-10-17 | 2021 | 10 | 17 | 2021 Q4 |\n",
       "| 9.52266E+15 | 2 | Classic Bike  | 04/12/2021 18:12 | 04/12/2021 18:44 | Michigan Ave &amp; Washington St            | 13001        | Honore St &amp; Division St            | TA1305000034 | 41.88398 | ⋯ | 41.90312 | -87.67394 | member | 1925 | Saturday  | 2021-12-04 | 2021 | 12 | 04 | 2021 Q4 |\n",
       "| 9.65E+15    | 3 | Electric Bike | 06/09/2021 20:31 | 06/09/2021 21:07 | Avers Ave &amp; Belmont Ave                 | 15640        | Central Park Ave &amp; Elbridge Ave    | 15644        | 41.93945 | ⋯ | 41.93535 | -87.71685 | casual | 2120 | Monday    | 2021-09-06 | 2021 | 09 | 06 | 2021 Q3 |\n",
       "| 9.65E+15    | 3 | Classic Bike  | 06/09/2021 14:46 | 06/09/2021 15:13 | Indiana Ave &amp; Roosevelt Rd              | SL-005       | Delano Ct &amp; Roosevelt Rd           | KA1706005007 | 41.86789 | ⋯ | 41.86749 | -87.63219 | member | 1626 | Monday    | 2021-09-06 | 2021 | 09 | 06 | 2021 Q3 |\n",
       "| 9.65E+15    | 3 | Classic Bike  | 29/09/2021 09:15 | 29/09/2021 09:28 | Wells St &amp; Huron St                     | TA1306000012 | Wabash Ave &amp; Adams St              | KA1503000015 | 41.89472 | ⋯ | 41.87947 | -87.62569 | member |  784 | Wednesday | 2021-09-29 | 2021 | 09 | 29 | 2021 Q3 |\n",
       "| 9.75E+15    | 2 | Classic Bike  | 18/04/2021 17:15 | 18/04/2021 17:23 | Clark St &amp; Armitage Ave                 | 13146        | Wells St &amp; Elm St                  | KA1504000135 | 41.91831 | ⋯ | 41.90322 | -87.63432 | member |  480 | Sunday    | 2021-04-18 | 2021 | 04 | 18 | 2021 Q2 |\n",
       "| 9.75E+15    | 2 | Classic Bike  | 26/09/2021 09:36 | 26/09/2021 09:52 | Clark St &amp; Drummond Pl                  | TA1307000142 | Larrabee St &amp; Kingsbury St         | TA1306000009 | 41.93125 | ⋯ | 41.89776 | -87.64288 | member |  978 | Sunday    | 2021-09-26 | 2021 | 09 | 26 | 2021 Q3 |\n",
       "| 9.92E+15    | 2 | Docked Bike   | 24/09/2021 12:55 | 24/09/2021 13:21 | Wolcott (Ravenswood) Ave &amp; Montrose Ave | TA1307000144 | Damen Ave &amp; Melrose Ave            | 13143        | 41.96141 | ⋯ | 41.94060 | -87.67850 | casual | 1577 | Friday    | 2021-09-24 | 2021 | 09 | 24 | 2021 Q3 |\n",
       "| 9.92E+15    | 2 | Classic Bike  | 19/11/2021 17:20 | 19/11/2021 17:27 | Clybourn Ave &amp; Division St              | TA1307000115 | Kingsbury St &amp; Erie St             | 13265        | 41.90461 | ⋯ | 41.89381 | -87.64170 | casual |  458 | Friday    | 2021-11-19 | 2021 | 11 | 19 | 2021 Q4 |\n",
       "| 9.94E+15    | 2 | Classic Bike  | 04/09/2021 10:40 | 04/09/2021 12:33 | Clinton St &amp; Jackson Blvd               | 638          | Dearborn St &amp; Adams St             | TA1305000005 | 41.87832 | ⋯ | 41.87936 | -87.62979 | casual | 6782 | Saturday  | 2021-09-04 | 2021 | 09 | 04 | 2021 Q3 |\n",
       "| 9.94E+15    | 2 | Classic Bike  | 30/09/2021 14:37 | 30/09/2021 14:39 | Wells St &amp; Walton St                    | TA1306000011 | Franklin St &amp; Chicago Ave          | 13017        | 41.89993 | ⋯ | 41.89675 | -87.63567 | member |  105 | Thursday  | 2021-09-30 | 2021 | 09 | 30 | 2021 Q3 |\n",
       "| 9.96E+15    | 2 | Electric Bike | 11/09/2021 11:11 | 11/09/2021 11:49 | DuSable Lake Shore Dr &amp; Monroe St       | 13300        | Michigan Ave &amp; Oak St              | 13042        | 41.88098 | ⋯ | 41.90098 | -87.62377 | casual | 2240 | Saturday  | 2021-09-11 | 2021 | 09 | 11 | 2021 Q3 |\n",
       "| 9.96E+15    | 2 | Classic Bike  | 04/09/2021 06:36 | 04/09/2021 07:07 | Indiana Ave &amp; Roosevelt Rd              | SL-005       | Clark St &amp; Lincoln Ave             | 13179        | 41.86789 | ⋯ | 41.91569 | -87.63460 | member | 1861 | Saturday  | 2021-09-04 | 2021 | 09 | 04 | 2021 Q3 |\n",
       "\n"
      ],
      "text/plain": [
       "    ride_id     dupe_count bike_type     start_time       end_time        \n",
       "1   1.03E+15    2          Classic Bike  20/09/2021 21:06 20/09/2021 21:25\n",
       "2   1.03E+15    2          Classic Bike  27/09/2021 08:26 27/09/2021 08:33\n",
       "3   1.08E+15    2          Classic Bike  23/04/2021 21:16 23/04/2021 21:22\n",
       "4   1.08E+15    2          Classic Bike  05/09/2021 20:00 05/09/2021 20:41\n",
       "5   1.26E+15    2          Electric Bike 04/04/2021 17:03 04/04/2021 17:39\n",
       "6   1.26E+15    2          Electric Bike 25/09/2021 06:16 25/09/2021 07:14\n",
       "7   1.46E+15    2          Docked Bike   21/09/2021 14:40 21/09/2021 14:58\n",
       "8   1.46E+15    2          Electric Bike 19/11/2021 18:15 19/11/2021 18:21\n",
       "9   1.49E+15    2          Classic Bike  19/09/2021 16:06 19/09/2021 16:29\n",
       "10  1.49E+15    2          Classic Bike  14/09/2021 19:08 14/09/2021 19:29\n",
       "11  1.53E+15    2          Classic Bike  25/04/2021 11:20 25/04/2021 11:46\n",
       "12  1.53E+15    2          Electric Bike 09/11/2021 07:32 09/11/2021 07:55\n",
       "13  1.56E+21    2          Classic Bike  18/08/2021 22:34 18/08/2021 22:44\n",
       "14  1.56E+21    2          Electric Bike 19/09/2021 03:08 19/09/2021 03:16\n",
       "15  1.58E+14    2          Classic Bike  10/04/2021 11:10 10/04/2021 11:19\n",
       "16  1.58E+14    2          Electric Bike 28/07/2021 20:36 28/07/2021 20:43\n",
       "17  1.58E+15    2          Electric Bike 26/09/2021 20:03 26/09/2021 20:07\n",
       "18  1.58E+15    2          Classic Bike  25/11/2021 11:22 25/11/2021 11:25\n",
       "19  1.68E+15    2          Classic Bike  07/09/2021 18:09 07/09/2021 18:19\n",
       "20  1.68E+15    2          Classic Bike  30/10/2021 23:35 30/10/2021 23:47\n",
       "21  1.70E+15    2          Electric Bike 12/05/2021 22:25 12/05/2021 22:40\n",
       "22  1.70E+15    2          Classic Bike  09/11/2021 09:21 09/11/2021 09:27\n",
       "23  2.02E+15    5          Classic Bike  03/04/2021 11:40 03/04/2021 11:48\n",
       "24  2.02E+15    5          Classic Bike  16/04/2021 16:18 16/04/2021 18:27\n",
       "25  2.02E+15    5          Classic Bike  02/04/2021 23:58 03/04/2021 00:02\n",
       "26  2.02E+15    5          Classic Bike  24/09/2021 19:35 24/09/2021 20:12\n",
       "27  2.02E+15    5          Electric Bike 18/09/2021 16:27 18/09/2021 16:51\n",
       "28  2.11E+15    2          Classic Bike  11/04/2021 13:01 11/04/2021 13:06\n",
       "29  2.11E+15    2          Electric Bike 12/12/2021 18:59 12/12/2021 19:06\n",
       "30  2.28E+15    4          Classic Bike  14/04/2021 17:08 14/04/2021 17:36\n",
       "⋮   ⋮           ⋮          ⋮             ⋮                ⋮               \n",
       "311 9.24E+15    3          Classic Bike  13/04/2021 08:14 13/04/2021 08:38\n",
       "312 9.24E+15    3          Classic Bike  06/08/2021 14:11 06/08/2021 14:20\n",
       "313 9.24E+15    3          Docked Bike   03/09/2021 00:12 03/09/2021 00:30\n",
       "314 9.27E+15    2          Classic Bike  02/04/2021 15:33 02/04/2021 15:49\n",
       "315 9.27E+15    2          Electric Bike 18/11/2021 13:22 18/11/2021 13:25\n",
       "316 9.30E+15    2          Classic Bike  06/09/2021 12:44 06/09/2021 13:02\n",
       "317 9.30E+15    2          Classic Bike  30/09/2021 11:55 30/09/2021 12:08\n",
       "318 9.31E+15    2          Classic Bike  22/09/2021 22:29 22/09/2021 22:44\n",
       "319 9.31E+15    2          Classic Bike  11/09/2021 17:10 11/09/2021 17:21\n",
       "320 9.35E+15    2          Classic Bike  27/04/2021 20:01 27/04/2021 21:14\n",
       "321 9.35E+15    2          Classic Bike  25/09/2021 09:18 25/09/2021 09:27\n",
       "322 9.42E+15    2          Electric Bike 10/09/2021 18:26 10/09/2021 19:20\n",
       "323 9.42E+15    2          Classic Bike  17/11/2021 18:48 17/11/2021 18:54\n",
       "324 9.44E+15    2          Classic Bike  25/04/2021 00:03 25/04/2021 00:16\n",
       "325 9.44E+15    2          Electric Bike 19/11/2021 16:47 19/11/2021 16:54\n",
       "326 9.50E+15    2          Classic Bike  25/09/2021 12:35 25/09/2021 13:49\n",
       "327 9.50E+15    2          Classic Bike  18/09/2021 19:21 18/09/2021 19:24\n",
       "328 9.52266E+15 2          Classic Bike  17/10/2021 15:46 17/10/2021 16:05\n",
       "329 9.52266E+15 2          Classic Bike  04/12/2021 18:12 04/12/2021 18:44\n",
       "330 9.65E+15    3          Electric Bike 06/09/2021 20:31 06/09/2021 21:07\n",
       "331 9.65E+15    3          Classic Bike  06/09/2021 14:46 06/09/2021 15:13\n",
       "332 9.65E+15    3          Classic Bike  29/09/2021 09:15 29/09/2021 09:28\n",
       "333 9.75E+15    2          Classic Bike  18/04/2021 17:15 18/04/2021 17:23\n",
       "334 9.75E+15    2          Classic Bike  26/09/2021 09:36 26/09/2021 09:52\n",
       "335 9.92E+15    2          Docked Bike   24/09/2021 12:55 24/09/2021 13:21\n",
       "336 9.92E+15    2          Classic Bike  19/11/2021 17:20 19/11/2021 17:27\n",
       "337 9.94E+15    2          Classic Bike  04/09/2021 10:40 04/09/2021 12:33\n",
       "338 9.94E+15    2          Classic Bike  30/09/2021 14:37 30/09/2021 14:39\n",
       "339 9.96E+15    2          Electric Bike 11/09/2021 11:11 11/09/2021 11:49\n",
       "340 9.96E+15    2          Classic Bike  04/09/2021 06:36 04/09/2021 07:07\n",
       "    from_station                                        start_station_id\n",
       "1   Broadway & Barry Ave                                13137           \n",
       "2   Halsted St & Clybourn Ave                           331             \n",
       "3   Damen Ave & Division St                             13136           \n",
       "4   Albany Ave & Bloomingdale Ave                       15655           \n",
       "5   Lincoln Ave & Winona St                             KA1504000078    \n",
       "6   Broadway & Barry Ave                                13137           \n",
       "7   Sheridan Rd & Irving Park Rd                        13063           \n",
       "8   Walsh Park                                          18067           \n",
       "9   Millennium Park                                     13008           \n",
       "10  Michigan Ave & 14th St                              TA1307000124    \n",
       "11  State St & Randolph St                              TA1305000029    \n",
       "12  Ashland Ave & Division St                           13061           \n",
       "13  Wells St & Concord Ln                               TA1308000050    \n",
       "14  Lincoln Ave & Fullerton Ave                         TA1309000058    \n",
       "15  Wabash Ave & Roosevelt Rd                           TA1305000002    \n",
       "16  Calumet Ave & 35th St                               13345           \n",
       "17  Larrabee St & Armitage Ave                          TA1309000006    \n",
       "18  Blackstone Ave & Hyde Park Blvd                     13398           \n",
       "19  Wells St & Concord Ln                               TA1308000050    \n",
       "20  Paulina Ave & North Ave                             TA1305000037    \n",
       "21  Wallace St & 35th St                                TA1308000045    \n",
       "22  Kimbark Ave & 53rd St                               TA1309000037    \n",
       "23  Paulina St & Montrose Ave                           TA1309000021    \n",
       "24  Leavitt St & Chicago Ave                            18058           \n",
       "25  Halsted St & Dickens Ave                            13192           \n",
       "26  Paulina Ave & North Ave                             TA1305000037    \n",
       "27  Broadway & Wilson - Truman College Vaccination Site 13074           \n",
       "28  LaSalle St & Washington St                          13006           \n",
       "29  Sheffield Ave & Fullerton Ave                       TA1306000016    \n",
       "30  Sedgwick St & Huron St                              TA1307000062    \n",
       "⋮   ⋮                                                   ⋮               \n",
       "311 Wilton Ave & Belmont Ave                            TA1307000134    \n",
       "312 Honore St & Division St                             TA1305000034    \n",
       "313 Paulina Ave & North Ave                             TA1305000037    \n",
       "314 Shore Dr & 55th St                                  TA1308000009    \n",
       "315 Franklin St & Monroe St                             TA1309000007    \n",
       "316 Green St & Madison St                               TA1307000120    \n",
       "317 Elmwood Ave & Austin St                             598             \n",
       "318 Sheffield Ave & Waveland Ave                        TA1307000126    \n",
       "319 Western Ave & Leland Ave                            TA1307000140    \n",
       "320 California Ave & Francis Pl (Temp)                  13259           \n",
       "321 Dearborn Pkwy & Delaware Pl                         TA1307000128    \n",
       "322 Michigan Ave & Madison St                           13036           \n",
       "323 Clark St & Drummond Pl                              TA1307000142    \n",
       "324 Southport Ave & Wellington Ave                      TA1307000006    \n",
       "325 Kingsbury St & Kinzie St                            KA1503000043    \n",
       "326 Canal St & Madison St                               13341           \n",
       "327 California Ave & Cortez St                          17660           \n",
       "328 New St & Illinois St                                TA1306000013    \n",
       "329 Michigan Ave & Washington St                        13001           \n",
       "330 Avers Ave & Belmont Ave                             15640           \n",
       "331 Indiana Ave & Roosevelt Rd                          SL-005          \n",
       "332 Wells St & Huron St                                 TA1306000012    \n",
       "333 Clark St & Armitage Ave                             13146           \n",
       "334 Clark St & Drummond Pl                              TA1307000142    \n",
       "335 Wolcott (Ravenswood) Ave & Montrose Ave             TA1307000144    \n",
       "336 Clybourn Ave & Division St                          TA1307000115    \n",
       "337 Clinton St & Jackson Blvd                           638             \n",
       "338 Wells St & Walton St                                TA1306000011    \n",
       "339 DuSable Lake Shore Dr & Monroe St                   13300           \n",
       "340 Indiana Ave & Roosevelt Rd                          SL-005          \n",
       "    to_station                            end_station_id start_lat ⋯ end_lat \n",
       "1   Clarendon Ave & Gordon Ter            13379          41.93758  ⋯ 41.95787\n",
       "2   Clybourn Ave & Division St            TA1307000115   41.90967  ⋯ 41.90461\n",
       "3   California Ave & Division St          13256          41.90327  ⋯ 41.90303\n",
       "4   Central Park Ave & Bloomingdale Ave   18017          41.91403  ⋯ 41.91417\n",
       "5   Damen Ave & Division St               13136          41.97493  ⋯ 41.90324\n",
       "6   Broadway & Barry Ave                  13137          41.93774  ⋯ 41.93782\n",
       "7   Lincoln Ave & Waveland Ave            13253          41.95425  ⋯ 41.94880\n",
       "8   Ashland Ave & Division St             13061          41.91461  ⋯ 41.90347\n",
       "9   Calumet Ave & 18th St                 13102          41.88103  ⋯ 41.85761\n",
       "10  Cityfront Plaza Dr & Pioneer Ct       13427          41.86406  ⋯ 41.89057\n",
       "11  Michigan Ave & Washington St          13001          41.88468  ⋯ 41.88398\n",
       "12  Clark St & Montrose Ave               KA1503000022   41.90343  ⋯ 41.96160\n",
       "13  St. Clair St & Erie St                13016          41.91213  ⋯ 41.89435\n",
       "14  Clark St & Drummond Pl                TA1307000142   41.92597  ⋯ 41.93123\n",
       "15  Calumet Ave & 18th St                 13102          41.86723  ⋯ 41.85761\n",
       "16  MLK Jr Dr & 47th St                   TA1308000007   41.83141  ⋯ 41.80998\n",
       "17  Wells St & Concord Ln                 TA1308000050   41.91813  ⋯ 41.91219\n",
       "18  Blackstone Ave & Hyde Park Blvd       13398          41.80256  ⋯ 41.80256\n",
       "19  Clark St & Elm St                     TA1307000039   41.91213  ⋯ 41.90297\n",
       "20  California Ave & Milwaukee Ave        13084          41.90985  ⋯ 41.92269\n",
       "21  Racine Ave & 35th St                  15446          41.83060  ⋯ 41.83072\n",
       "22  University Ave & 57th St              KA1503000071   41.79957  ⋯ 41.79148\n",
       "23  Western Ave & Leland Ave              TA1307000140   41.96151  ⋯ 41.96649\n",
       "24  Michigan Ave & Washington St          13001          41.89550  ⋯ 41.88398\n",
       "25  Larrabee St & Webster Ave             13193          41.91994  ⋯ 41.92182\n",
       "26  Paulina Ave & North Ave               TA1305000037   41.90985  ⋯ 41.90985\n",
       "27  Clark St & Lincoln Ave                13179          41.96516  ⋯ 41.91572\n",
       "28  Green St & Madison St                 TA1307000120   41.88266  ⋯ 41.88189\n",
       "29  DuSable Lake Shore Dr & Diversey Pkwy TA1309000039   41.92570  ⋯ 41.93259\n",
       "30  Clark St & Lincoln Ave                13179          41.89467  ⋯ 41.91569\n",
       "⋮   ⋮                                     ⋮              ⋮         ⋱ ⋮       \n",
       "311 Clark St & Lake St                    KA1503000012   41.94018  ⋯ 41.88602\n",
       "312 Campbell Ave & North Ave              13257          41.90312  ⋯ 41.91054\n",
       "313 Winchester Ave & Elston Ave           KA1504000140   41.90986  ⋯ 41.92409\n",
       "314 Ellis Ave & 60th St                   KA1503000014   41.79521  ⋯ 41.78510\n",
       "315 Green St & Madison St                 TA1307000120   41.87910  ⋯ 41.88180\n",
       "316 Racine Ave & 13th St                  13165          41.88189  ⋯ 41.86505\n",
       "317 Benson Ave & Church St                596            42.02578  ⋯ 42.04821\n",
       "318 Ashland Ave & Wellington Ave          13269          41.94940  ⋯ 41.93608\n",
       "319 Southport Ave & Clark St              TA1308000047   41.96640  ⋯ 41.95708\n",
       "320 California Ave & Francis Pl (Temp)    13259          41.91849  ⋯ 41.91849\n",
       "321 St. Clair St & Erie St                13016          41.89897  ⋯ 41.89435\n",
       "322 Columbus Dr & Randolph St             13263          41.88206  ⋯ 41.88427\n",
       "323 Lincoln Ave & Fullerton Ave           TA1309000058   41.93125  ⋯ 41.92416\n",
       "324 Leavitt St & Armitage Ave             TA1309000029   41.93573  ⋯ 41.91781\n",
       "325 St. Clair St & Erie St                13016          41.88923  ⋯ 41.89429\n",
       "326 Fairbanks Ct & Grand Ave              TA1305000003   41.88209  ⋯ 41.89185\n",
       "327 California Ave & Division St          13256          41.90036  ⋯ 41.90303\n",
       "328 Desplaines St & Jackson Blvd          15539          41.89085  ⋯ 41.87812\n",
       "329 Honore St & Division St               TA1305000034   41.88398  ⋯ 41.90312\n",
       "330 Central Park Ave & Elbridge Ave       15644          41.93945  ⋯ 41.93535\n",
       "331 Delano Ct & Roosevelt Rd              KA1706005007   41.86789  ⋯ 41.86749\n",
       "332 Wabash Ave & Adams St                 KA1503000015   41.89472  ⋯ 41.87947\n",
       "333 Wells St & Elm St                     KA1504000135   41.91831  ⋯ 41.90322\n",
       "334 Larrabee St & Kingsbury St            TA1306000009   41.93125  ⋯ 41.89776\n",
       "335 Damen Ave & Melrose Ave               13143          41.96141  ⋯ 41.94060\n",
       "336 Kingsbury St & Erie St                13265          41.90461  ⋯ 41.89381\n",
       "337 Dearborn St & Adams St                TA1305000005   41.87832  ⋯ 41.87936\n",
       "338 Franklin St & Chicago Ave             13017          41.89993  ⋯ 41.89675\n",
       "339 Michigan Ave & Oak St                 13042          41.88098  ⋯ 41.90098\n",
       "340 Clark St & Lincoln Ave                13179          41.86789  ⋯ 41.91569\n",
       "    end_lng   user_type ride_length day_of_week date       year month day\n",
       "1   -87.64951 casual    1089        Monday      2021-09-20 2021 09    20 \n",
       "2   -87.64055 member     372        Monday      2021-09-27 2021 09    27 \n",
       "3   -87.69747 casual     389        Friday      2021-04-23 2021 04    23 \n",
       "4   -87.71676 casual    2490        Sunday      2021-09-05 2021 09    05 \n",
       "5   -87.67842 casual    2177        Sunday      2021-04-04 2021 04    04 \n",
       "6   -87.64419 casual    3492        Saturday    2021-09-25 2021 09    25 \n",
       "7   -87.67528 casual    1069        Tuesday     2021-09-21 2021 09    21 \n",
       "8   -87.66797 casual     336        Friday      2021-11-19 2021 11    19 \n",
       "9   -87.61941 casual    1420        Sunday      2021-09-19 2021 09    19 \n",
       "10  -87.62207 casual    1267        Tuesday     2021-09-14 2021 09    14 \n",
       "11  -87.62468 casual    1557        Sunday      2021-04-25 2021 04    25 \n",
       "12  -87.66634 casual    1376        Tuesday     2021-11-09 2021 11    09 \n",
       "13  -87.62280 member     650        Wednesday   2021-08-18 2021 08    18 \n",
       "14  -87.64436 member     470        Sunday      2021-09-19 2021 09    19 \n",
       "15  -87.61941 member     549        Saturday    2021-04-10 2021 04    10 \n",
       "16  -87.61628 casual     459        Wednesday   2021-07-28 2021 07    28 \n",
       "17  -87.63483 member     204        Sunday      2021-09-26 2021 09    26 \n",
       "18  -87.59037 member     157        Thursday    2021-11-25 2021 11    25 \n",
       "19  -87.63128 casual     593        Tuesday     2021-09-07 2021 09    07 \n",
       "20  -87.69715 casual     686        Saturday    2021-10-30 2021 10    30 \n",
       "21  -87.65617 casual     923        Wednesday   2021-05-12 2021 05    12 \n",
       "22  -87.59986 member     336        Tuesday     2021-11-09 2021 11    09 \n",
       "23  -87.68842 member     478        Saturday    2021-04-03 2021 04    03 \n",
       "24  -87.62468 casual    7736        Friday      2021-04-16 2021 04    16 \n",
       "25  -87.64414 casual     210        Friday      2021-04-02 2021 04    02 \n",
       "26  -87.66993 member    2221        Friday      2021-09-24 2021 09    24 \n",
       "27  -87.63465 casual    1418        Saturday    2021-09-18 2021 09    18 \n",
       "28  -87.64879 member     317        Sunday      2021-04-11 2021 04    11 \n",
       "29  -87.63643 casual     393        Sunday      2021-12-12 2021 12    12 \n",
       "30  -87.63460 member    1651        Wednesday   2021-04-14 2021 04    14 \n",
       "⋮   ⋮         ⋮         ⋮           ⋮           ⋮          ⋮    ⋮     ⋮  \n",
       "311 -87.63088 member    1444        Tuesday     2021-04-13 2021 04    13 \n",
       "312 -87.68956 member     571        Friday      2021-08-06 2021 08    06 \n",
       "313 -87.67646 casual    1098        Friday      2021-09-03 2021 09    03 \n",
       "314 -87.60107 member     940        Friday      2021-04-02 2021 04    02 \n",
       "315 -87.64870 member     233        Thursday    2021-11-18 2021 11    18 \n",
       "316 -87.65696 casual    1087        Monday      2021-09-06 2021 09    06 \n",
       "317 -87.68349 member     784        Thursday    2021-09-30 2021 09    30 \n",
       "318 -87.66981 casual     897        Wednesday   2021-09-22 2021 09    22 \n",
       "319 -87.66420 casual     659        Saturday    2021-09-11 2021 09    11 \n",
       "320 -87.69742 casual    4389        Tuesday     2021-04-27 2021 04    27 \n",
       "321 -87.62280 member     537        Saturday    2021-09-25 2021 09    25 \n",
       "322 -87.61936 member    3233        Friday      2021-09-10 2021 09    10 \n",
       "323 -87.64638 member     409        Wednesday   2021-11-17 2021 11    17 \n",
       "324 -87.68244 member     759        Sunday      2021-04-25 2021 04    25 \n",
       "325 -87.62320 member     399        Friday      2021-11-19 2021 11    19 \n",
       "326 -87.62058 casual    4424        Saturday    2021-09-25 2021 09    25 \n",
       "327 -87.69747 member     160        Saturday    2021-09-18 2021 09    18 \n",
       "328 -87.64395 member    1141        Sunday      2021-10-17 2021 10    17 \n",
       "329 -87.67394 member    1925        Saturday    2021-12-04 2021 12    04 \n",
       "330 -87.71685 casual    2120        Monday      2021-09-06 2021 09    06 \n",
       "331 -87.63219 member    1626        Monday      2021-09-06 2021 09    06 \n",
       "332 -87.62569 member     784        Wednesday   2021-09-29 2021 09    29 \n",
       "333 -87.63432 member     480        Sunday      2021-04-18 2021 04    18 \n",
       "334 -87.64288 member     978        Sunday      2021-09-26 2021 09    26 \n",
       "335 -87.67850 casual    1577        Friday      2021-09-24 2021 09    24 \n",
       "336 -87.64170 casual     458        Friday      2021-11-19 2021 11    19 \n",
       "337 -87.62979 casual    6782        Saturday    2021-09-04 2021 09    04 \n",
       "338 -87.63567 member     105        Thursday    2021-09-30 2021 09    30 \n",
       "339 -87.62377 casual    2240        Saturday    2021-09-11 2021 09    11 \n",
       "340 -87.63460 member    1861        Saturday    2021-09-04 2021 09    04 \n",
       "    quarter\n",
       "1   2021 Q3\n",
       "2   2021 Q3\n",
       "3   2021 Q2\n",
       "4   2021 Q3\n",
       "5   2021 Q2\n",
       "6   2021 Q3\n",
       "7   2021 Q3\n",
       "8   2021 Q4\n",
       "9   2021 Q3\n",
       "10  2021 Q3\n",
       "11  2021 Q2\n",
       "12  2021 Q4\n",
       "13  2021 Q3\n",
       "14  2021 Q3\n",
       "15  2021 Q2\n",
       "16  2021 Q3\n",
       "17  2021 Q3\n",
       "18  2021 Q4\n",
       "19  2021 Q3\n",
       "20  2021 Q4\n",
       "21  2021 Q2\n",
       "22  2021 Q4\n",
       "23  2021 Q2\n",
       "24  2021 Q2\n",
       "25  2021 Q2\n",
       "26  2021 Q3\n",
       "27  2021 Q3\n",
       "28  2021 Q2\n",
       "29  2021 Q4\n",
       "30  2021 Q2\n",
       "⋮   ⋮      \n",
       "311 2021 Q2\n",
       "312 2021 Q3\n",
       "313 2021 Q3\n",
       "314 2021 Q2\n",
       "315 2021 Q4\n",
       "316 2021 Q3\n",
       "317 2021 Q3\n",
       "318 2021 Q3\n",
       "319 2021 Q3\n",
       "320 2021 Q2\n",
       "321 2021 Q3\n",
       "322 2021 Q3\n",
       "323 2021 Q4\n",
       "324 2021 Q2\n",
       "325 2021 Q4\n",
       "326 2021 Q3\n",
       "327 2021 Q3\n",
       "328 2021 Q4\n",
       "329 2021 Q4\n",
       "330 2021 Q3\n",
       "331 2021 Q3\n",
       "332 2021 Q3\n",
       "333 2021 Q2\n",
       "334 2021 Q3\n",
       "335 2021 Q3\n",
       "336 2021 Q4\n",
       "337 2021 Q3\n",
       "338 2021 Q3\n",
       "339 2021 Q3\n",
       "340 2021 Q3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips %>% get_dupes(ride_id)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "55024a16",
   "metadata": {
    "papermill": {
     "duration": 0.025895,
     "end_time": "2022-07-04T14:56:22.458425",
     "exception": false,
     "start_time": "2022-07-04T14:56:22.432530",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Remove duplicated ride_id values"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "97c8d94d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:22.513607Z",
     "iopub.status.busy": "2022-07-04T14:56:22.512257Z",
     "iopub.status.idle": "2022-07-04T14:56:24.299563Z",
     "shell.execute_reply": "2022-07-04T14:56:24.297736Z"
    },
    "papermill": {
     "duration": 1.81805,
     "end_time": "2022-07-04T14:56:24.302333",
     "exception": false,
     "start_time": "2022-07-04T14:56:22.484283",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips <- all_trips %>%\n",
    "  distinct(ride_id, .keep_all = TRUE)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "848823cf",
   "metadata": {
    "papermill": {
     "duration": 0.026606,
     "end_time": "2022-07-04T14:56:24.355338",
     "exception": false,
     "start_time": "2022-07-04T14:56:24.328732",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Analyze ridership data by type and weekday"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "1e0f8d89",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:24.409919Z",
     "iopub.status.busy": "2022-07-04T14:56:24.408616Z",
     "iopub.status.idle": "2022-07-04T14:56:25.278064Z",
     "shell.execute_reply": "2022-07-04T14:56:25.276335Z"
    },
    "papermill": {
     "duration": 0.899078,
     "end_time": "2022-07-04T14:56:25.280531",
     "exception": false,
     "start_time": "2022-07-04T14:56:24.381453",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'user_type'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>user_type</th><th scope=col>day_of_week</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>402093</td><td>1950.3760</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>231680</td><td>1726.3105</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>213928</td><td>1535.1031</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>222064</td><td>1477.3104</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>228196</td><td>1455.8944</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>288213</td><td>1582.7891</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>458016</td><td>1833.2247</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td>315759</td><td> 894.7987</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td>360567</td><td> 750.1546</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td>403181</td><td> 724.7850</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td>411716</td><td> 735.0106</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td>388432</td><td> 728.3381</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td>366677</td><td> 758.2427</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td>350476</td><td> 873.5722</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " user\\_type & day\\_of\\_week & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sunday    & 402093 & 1950.3760\\\\\n",
       "\t casual & Monday    & 231680 & 1726.3105\\\\\n",
       "\t casual & Tuesday   & 213928 & 1535.1031\\\\\n",
       "\t casual & Wednesday & 222064 & 1477.3104\\\\\n",
       "\t casual & Thursday  & 228196 & 1455.8944\\\\\n",
       "\t casual & Friday    & 288213 & 1582.7891\\\\\n",
       "\t casual & Saturday  & 458016 & 1833.2247\\\\\n",
       "\t member & Sunday    & 315759 &  894.7987\\\\\n",
       "\t member & Monday    & 360567 &  750.1546\\\\\n",
       "\t member & Tuesday   & 403181 &  724.7850\\\\\n",
       "\t member & Wednesday & 411716 &  735.0106\\\\\n",
       "\t member & Thursday  & 388432 &  728.3381\\\\\n",
       "\t member & Friday    & 366677 &  758.2427\\\\\n",
       "\t member & Saturday  & 350476 &  873.5722\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 4\n",
       "\n",
       "| user_type &lt;chr&gt; | day_of_week &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Sunday    | 402093 | 1950.3760 |\n",
       "| casual | Monday    | 231680 | 1726.3105 |\n",
       "| casual | Tuesday   | 213928 | 1535.1031 |\n",
       "| casual | Wednesday | 222064 | 1477.3104 |\n",
       "| casual | Thursday  | 228196 | 1455.8944 |\n",
       "| casual | Friday    | 288213 | 1582.7891 |\n",
       "| casual | Saturday  | 458016 | 1833.2247 |\n",
       "| member | Sunday    | 315759 |  894.7987 |\n",
       "| member | Monday    | 360567 |  750.1546 |\n",
       "| member | Tuesday   | 403181 |  724.7850 |\n",
       "| member | Wednesday | 411716 |  735.0106 |\n",
       "| member | Thursday  | 388432 |  728.3381 |\n",
       "| member | Friday    | 366677 |  758.2427 |\n",
       "| member | Saturday  | 350476 |  873.5722 |\n",
       "\n"
      ],
      "text/plain": [
       "   user_type day_of_week number_of_rides average_duration\n",
       "1  casual    Sunday      402093          1950.3760       \n",
       "2  casual    Monday      231680          1726.3105       \n",
       "3  casual    Tuesday     213928          1535.1031       \n",
       "4  casual    Wednesday   222064          1477.3104       \n",
       "5  casual    Thursday    228196          1455.8944       \n",
       "6  casual    Friday      288213          1582.7891       \n",
       "7  casual    Saturday    458016          1833.2247       \n",
       "8  member    Sunday      315759           894.7987       \n",
       "9  member    Monday      360567           750.1546       \n",
       "10 member    Tuesday     403181           724.7850       \n",
       "11 member    Wednesday   411716           735.0106       \n",
       "12 member    Thursday    388432           728.3381       \n",
       "13 member    Friday      366677           758.2427       \n",
       "14 member    Saturday    350476           873.5722       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips %>% \n",
    "  group_by(user_type, day_of_week) %>%         #groups by user type and day of week\n",
    "  summarise(number_of_rides = n(),             #calculates the number of rides\n",
    "  average_duration = mean(ride_length)) %>%    #calculates the average trip duration \n",
    "  arrange(user_type, day_of_week)              #sorts by user type and day of week"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "677e3851",
   "metadata": {
    "papermill": {
     "duration": 0.026149,
     "end_time": "2022-07-04T14:56:25.334100",
     "exception": false,
     "start_time": "2022-07-04T14:56:25.307951",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Finding the percentiles of the data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "ba120055",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:25.389489Z",
     "iopub.status.busy": "2022-07-04T14:56:25.388206Z",
     "iopub.status.idle": "2022-07-04T14:56:25.736779Z",
     "shell.execute_reply": "2022-07-04T14:56:25.734887Z"
    },
    "papermill": {
     "duration": 0.378823,
     "end_time": "2022-07-04T14:56:25.739188",
     "exception": false,
     "start_time": "2022-07-04T14:56:25.360365",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>0%</dt><dd>1</dd><dt>10%</dt><dd>244</dd><dt>20%</dt><dd>354</dd><dt>30%</dt><dd>462</dd><dt>40%</dt><dd>580</dd><dt>50%</dt><dd>717</dd><dt>60%</dt><dd>892</dd><dt>70%</dt><dd>1134</dd><dt>80%</dt><dd>1514</dd><dt>90%</dt><dd>2273</dd><dt>100%</dt><dd>86397</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[0\\textbackslash{}\\%] 1\n",
       "\\item[10\\textbackslash{}\\%] 244\n",
       "\\item[20\\textbackslash{}\\%] 354\n",
       "\\item[30\\textbackslash{}\\%] 462\n",
       "\\item[40\\textbackslash{}\\%] 580\n",
       "\\item[50\\textbackslash{}\\%] 717\n",
       "\\item[60\\textbackslash{}\\%] 892\n",
       "\\item[70\\textbackslash{}\\%] 1134\n",
       "\\item[80\\textbackslash{}\\%] 1514\n",
       "\\item[90\\textbackslash{}\\%] 2273\n",
       "\\item[100\\textbackslash{}\\%] 86397\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "0%\n",
       ":   110%\n",
       ":   24420%\n",
       ":   35430%\n",
       ":   46240%\n",
       ":   58050%\n",
       ":   71760%\n",
       ":   89270%\n",
       ":   113480%\n",
       ":   151490%\n",
       ":   2273100%\n",
       ":   86397\n",
       "\n"
      ],
      "text/plain": [
       "   0%   10%   20%   30%   40%   50%   60%   70%   80%   90%  100% \n",
       "    1   244   354   462   580   717   892  1134  1514  2273 86397 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "quantile(all_trips$ride_length, probs = seq(0, 1, by = 0.1))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9d5e3c45",
   "metadata": {
    "papermill": {
     "duration": 0.026557,
     "end_time": "2022-07-04T14:56:25.792706",
     "exception": false,
     "start_time": "2022-07-04T14:56:25.766149",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Converting the Month column into numeric type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "id": "c774bc0d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:25.847740Z",
     "iopub.status.busy": "2022-07-04T14:56:25.846507Z",
     "iopub.status.idle": "2022-07-04T14:56:27.888307Z",
     "shell.execute_reply": "2022-07-04T14:56:27.886626Z"
    },
    "papermill": {
     "duration": 2.07223,
     "end_time": "2022-07-04T14:56:27.891126",
     "exception": false,
     "start_time": "2022-07-04T14:56:25.818896",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$month <- as.numeric(as.character(all_trips$month))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "04c24476",
   "metadata": {
    "papermill": {
     "duration": 0.028999,
     "end_time": "2022-07-04T14:56:27.947600",
     "exception": false,
     "start_time": "2022-07-04T14:56:27.918601",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 5: Plots"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "18ea4def",
   "metadata": {
    "papermill": {
     "duration": 0.027893,
     "end_time": "2022-07-04T14:56:28.002797",
     "exception": false,
     "start_time": "2022-07-04T14:56:27.974904",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Visualizing the total number of rides by day"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "id": "be632d64",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:28.058723Z",
     "iopub.status.busy": "2022-07-04T14:56:28.057331Z",
     "iopub.status.idle": "2022-07-04T14:56:28.775542Z",
     "shell.execute_reply": "2022-07-04T14:56:28.773244Z"
    },
    "papermill": {
     "duration": 0.748761,
     "end_time": "2022-07-04T14:56:28.778212",
     "exception": false,
     "start_time": "2022-07-04T14:56:28.029451",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'user_type'. You can override using the\n",
      "`.groups` argument.\n",
      "Warning message:\n",
      "“`label_number_si()` was deprecated in scales 1.2.0.\n",
      "Please use the `scale_cut` argument of `label_number()` instead.\n",
      "\u001b[90mThis warning is displayed once every 8 hours.\u001b[39m\n",
      "\u001b[90mCall `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.\u001b[39m”\n"
     ]
    },
    {
     "data": {
      "image/png": "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\n+sQ9fPg6MaeOoiizLsVlLKext4tbwKsiYtZqas/949O3W/m6mvVaQ/6gp14eNvtGSvr8mdXm\nKAQ7AACQl8xoUfmtjxbnr9l+1Acf9O1Uc9/K2U0qdkmxiYjcvLy6ctkmc9adatz5tTFD+1T0\nPDf29ZbVenyVvq81NaJH5WZhQc9N+GSOi0Z52KmLv/ihRlE+/+hYekvMv5N/jkqs8r9h9rcn\nPm0+YNaP1dv2GDXyrdrF4r6e0r9CoxH2pcEsa3MIrrEDAAB5RmrCqaFbLwc1W7H12/b2lvbu\nddos3LXqRkLn/C5Tn+99Xgnecf7gM/lMIiIyafXgKu2mvTL+f+1GFfcUkdgL46M+2b+lf9VH\nm93o1WhAQbfPv/lAZv5gb9kzfL6iMc54Ke0ei6hjVwZ8d2JmxzIiIrbJC/tVeXXuR713vL2w\nQWCWtTkEK3YAACDPUDQuBkWiTqzafyHW3vLMR7uuX7/eOb9LavyxD49HlHlj0a3kJCLSYsxM\nEVn+2alb+xsX9638XwroM6piQsSG+VdviojNenPguvP5yk+s5pZ2w6xrge5pqU5EFF336d+b\ntZofR/yWrdocgWAHAADyDK0x6MeJ3W0Xvq1ZxKtYxdrd+gz6fNmPEak2EUmM2Gix2Y5+XDPj\nw+eMXg1EJPpotH13g1tlP/1/Cj/Fu36oUZRZM0+KyI0/hp2IT3l+Ruf0rV6lX8zYWWcKbulj\nij23LTu1OQSnYgEAgPNp9BoRsaXe54YGa7JVRAxK2iVx9YctutZzxOrV67f/snPXlq+WfjF9\n0Du1Vv+57RmNQUQqDFswpVHgXSMYPdNW6RSN63+s0+jZcGAht7nzJ8nE7356Z43OWPiTev63\nNyt3X7enV8RmTZJs1OYQBDsAAOB87sElRH66svGKVPO7a9OPp6I1WtcqbnoRSYn76+CxqHyV\nqnXpM6RLnyEicmLjh+VajHl79KEj01tolYGpUaWbNq2dvm9qwsmVa//wr2R2YKmvja40re+K\nby6dGfTb1ULNv8+nu70EGPXXcpGm6W8tSefWhSe6Vmxg8nnm8dTGqVgAAOB8nsU+eMpVf2Ri\n55WHwzK275zXe9rF2IAG0+z56WbYZ7Vq1eo06VB6h6LVa4hI6s1UnSl4bDmf01/32Ho1Pn3r\nt2+27dq163mH5p3incdrFWV439bXUyyvfFwv46abVxcOXXPm1jvrsmEvxFqsz45r8NhqY8UO\n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\n930/Y/eN+wZpKeTAGTvpKJZ5p2OKVepZ7s7XTc032irW5EWnou1bV6GSGBHUoWuPYQEzLiVZ\n7p+XdQMfpb23Q/8c/NnsNK+G3337gZvU18IVS8zOuGSfV17T3zlKB4/mjV0M0Yf/ts2mpY8q\n9ebh6FSrz2tVMkY8nq8qhDiXmCYELX0sqbdPj5i4uXpLz3tGaSlkQbCTTWrCichUi1fru7//\nbXRrY1Srru+KtGNVhY3Rrc306dNnzJgxqJ7HfbOybmDO25sUceDTQZNvudUdP2lQSb3k/6Mp\n1tS33nrr1QaZm6lcTbFozSUELc0VvVPdoKCgYX4uGSPhB8+qVJoXnPWClj4OxbJwxBjL0z0G\nNbwn2NFSSINLsbKxJF4QQpi8Mv8ItNpbr4n695a9SiqEVBqXMmVchBC3zTohUjPPyrqBOWxv\nStyJLwaOu5xkafZ+Px+D/FfA1TqPLl26ZB65snXy2YTU5m9XErQ0d1Rak0krhEhL/Hvpiv0R\noef+3Hu+YbdRz5p1gpY+hrMrR6275j5lfHtx6kjmcVoKafD3hGys1ltCCGeHe75T3HRqa3KC\nnSoqYrJuYE7aq1huf/Xh19dLNqnhpN81dkJkqrUg6i40FMut33/5duDUHR51ew58trigpY/H\nknL9wMFDR46HWDTFiunTD5yW5k7C9S1fLDju/+X/yvwnddFSSINgJxuV2iyEiE++59ax6FSr\nWufwkDVwj6wbmJP2Wi03LzjWnfTtB0O+edOSeOaLGbsKou7CIfzE78P7956x9K96nT6aNaKj\n7fuFlj4Og0vTSZOnzlsY9PkbpdcG/u/70zGCluaKYomb9Nkc92ZDuld3/e9cWgppEOxko3Uo\nL4RIDEvKNKbcSLWYy5rtVVLRknUDc9Jetcbp28mDS+rVzuU6fPZS6evbv1scElswxdvX/sXj\n+30x40bx57+cPu/T7s0zHqSgpbmgWFKSkjL1RKWp2+FLV6364NLLgpbmyuW1AQfiNW2eUXbu\n3Llz586/TsYIIY7t2bV7zyFBSyERgp1sdKZqJfSaG5uvZIwkx25JsCiejUrYsaoiJOsG5qS9\nKo054/aa5/sHVHfULRs1LkL26zJXNowdvXh37S5Dfho3uE4Zp8yzaGkuRJ8a06VLl4M3U+4O\nqTTuOrUlwSJoaa4kRyYplts/Tp44YcKECRMmzF52SQixaOqkiZMDBS2FRAh20lFpe1ZxjTn1\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips %>% \n",
    "  group_by(user_type, day_of_week) %>% \n",
    "  summarise(number_of_rides = n()) %>% \n",
    "  arrange(user_type, day_of_week)  %>% \n",
    "  ggplot(aes(number_of_rides, day_of_week, fill = user_type)) +\n",
    "  ggtitle(\"Total Rides per Day\") + \n",
    "  xlab(\"Number of Rides\") + ylab(\"Day\") + labs(fill = \"User Type\") +\n",
    "  theme(plot.title = element_text(hjust = 0.5)) +\n",
    "  theme(axis.title = element_text(size = 10.5)) +\n",
    "  theme(axis.text = element_text(size = 10)) +\n",
    "  scale_x_continuous(labels = scales::label_number_si(),breaks=seq(0,5000000,by=100000)) +\n",
    "  geom_col(position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1789fd42",
   "metadata": {
    "papermill": {
     "duration": 0.027448,
     "end_time": "2022-07-04T14:56:28.833787",
     "exception": false,
     "start_time": "2022-07-04T14:56:28.806339",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Visualizing the average ride duration by day"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "id": "04b87223",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:28.890860Z",
     "iopub.status.busy": "2022-07-04T14:56:28.889449Z",
     "iopub.status.idle": "2022-07-04T14:56:32.379458Z",
     "shell.execute_reply": "2022-07-04T14:56:32.377129Z"
    },
    "papermill": {
     "duration": 3.521441,
     "end_time": "2022-07-04T14:56:32.382210",
     "exception": false,
     "start_time": "2022-07-04T14:56:28.860769",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'user_type'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nACAX3P1JsawLtuwzZs0LdX6d98CxVA/+5BkAAADclOtgJyIS1TnKbrfa7fb8qgYAAAC5lpdg\nZ/920j6DX8VKftxaCwAA4H1uZbI+ffpkabOdP7Z9885TlQd8m+81AQAAIBfcCnZ79+7N2qg3\nRfV5+pk3Z3XM75IAAACQG24Fu4MHD3q6DgAAAORRnm6eAAAAwM0kX/hA07SYtIIbP+TWwS71\n4u9zXxpyd9PaxcJDjAZjSHix2k3vfvrlt/64lFoA9QEAAMBNt/gq9tiKl+7sO/V0qiWwRHS9\neneEFfFNS4o7fmDH2xM2vPv6a2MXb5pwf8WCKTSjgICAgt9ojuj1+sJfZIGhK5xMJpPBwF3k\nIhwjN6IrnDhGnAwGQ2F+YyQnJ3u7hHxkNdv0Prn/CjOPi9+UJTnO4B+S06VcFZIYs7B2z0lX\nw1t/sml//NljP25Yu2rFqjXfbz5yOu7gj4vbFouf3LPORycT81BzLuncU/CFOWma5maRBcOL\nXSFu76+C4d2u4I1BV2TL26/+Bt7tCt4YhbYrMvFiz+SjkibD+PUf1osMMhl8Iis2eXfHpZ0f\nj6paItQUWLRJ92cvm22O2WzpZ6c+/WCdSqV8A8Nrte7x0bbzOVpcRC7+svCuuuX8jL4lqzR5\n5ZNdrlcb5qOf+/ep53rcGVX+kVy8KFd/GK3o80K6PnLzvu9ahJpunKJVbfnQN39UrFi8+dg+\nqwZsezgXG86LxES30mSQp+u4Cd+OveTH7V7Z9KWaVbJt91ZXOLi5vwqGd7siNTU1LS3NqyXc\nwIu9YbFYeGM40RVOHCNOZrO5UL0xVDWz+xuzvtjQrpzhzb6dh7SsVbJtv8/X7dBOrbvnvmd6\nL//fht7RIjKudf0FiS3nzl5ULVy3feVbA1tVtBw8M6hSsJuLi0jXLlOenjNzYsWALZ9MemFA\nI3Olc5ObFnex2i8HdWrXZ9qW1xrk4hW5CnZv7LsS2fzzLKnuOmNw43mtSzywdbpIQQc7AACA\nvKv/5oonOlURkfFvN367+drvlk+r5W+Q2pVGlx6/5KdL0js66cys1369tCn209YhJhGp36S1\n+avwCUN+GrS+izuLO7bS5L31L/aOFpGmLdsnbAtfMGjp2O9tLlZ7sfzslx5tm7tX5CrYHUi2\n1G5VzsUMZdsUt6zfk7sNAwAAeFfx5kUdD3xCfPWmMrX8r+eicIPObrOLSNyhtXa7rU2ob8al\n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\nYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips %>%\n",
    "  mutate(minutes = (ride_length/60)) %>% \n",
    "  group_by(user_type, day_of_week) %>% \n",
    "  summarise(average_duration = mean(minutes)) %>% \n",
    "  arrange(user_type, day_of_week)  %>% \n",
    "  ggplot(aes(day_of_week, average_duration, fill = user_type)) +\n",
    "  ggtitle(\"Average Ride Duration per Day\") + \n",
    "  xlab(\"Day\") + ylab(\"Ride Duration (min)\") + labs(fill = \"User Type\") +\n",
    "  theme(plot.title = element_text(hjust = 0.5)) +\n",
    "  theme(axis.title = element_text(size = 10.5)) +\n",
    "  theme(axis.text = element_text(size = 10)) +\n",
    "  geom_col(position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ee78d38f",
   "metadata": {
    "papermill": {
     "duration": 0.028489,
     "end_time": "2022-07-04T14:56:32.438907",
     "exception": false,
     "start_time": "2022-07-04T14:56:32.410418",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Visualizing the average ride duration by month"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 39,
   "id": "f971934c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:32.497537Z",
     "iopub.status.busy": "2022-07-04T14:56:32.496244Z",
     "iopub.status.idle": "2022-07-04T14:56:33.521450Z",
     "shell.execute_reply": "2022-07-04T14:56:33.519160Z"
    },
    "papermill": {
     "duration": 1.057951,
     "end_time": "2022-07-04T14:56:33.524872",
     "exception": false,
     "start_time": "2022-07-04T14:56:32.466921",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'user_type', 'month'. You can override\n",
      "using the `.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nR1x+55Jvb0093ofjulEjL/joq8c6aP828rLbF31WPvvFH/Zoli37j6dq+zuvf7Jt7wG3kHLp\ndfeYVrz8+5i35k3pEvYU+9+945Gf+qz68uHAMa35b1437YePvl0RfcXGduA01opFCCGE4g/7\n2LVS0244r3LLzBvve/z9RV9t31/olYFVdr3wwgsDN+z9B/61obrTP//zxtxZM68fIC94/r4y\nnzRt0bL7M7VZV76xfPHT0Q++Yea/tBfe9Na7j8j+6n/e8eSvVab7nnz5hUem1K56+ctqN0Q+\nRedbxnksK7c6js9guW32RmO3ae0+qkMIIYTaCnwV20r1nPLq/N4/fr/+t23fffq/D95mlaa+\ngy+95Z67BqSpACD9qon/HD3+QqMCALI73PruF08c9Pgz9EqBAMMJSiUPNNpE85aMByaP6QcA\nFb/9a79bNfvdZ7qpWADo0Vt95fjjQWHYU1xivnqQdvbHa4+dPz5H8le/+6f1kneHtPSlQAgh\nhFCMMLBrvToPGHHvgBEA4Ko5um3zr8sWffr4lK3vf/VRZyV73Q1X7/xtw+LCkrKysoI9m071\nyB2uON59uPzHo8qksd3qpy8X9EMu0AqBiaEineK2KzMf+exbGH9/zY5ZDr7DfV1jnVETIYQQ\nQi0NX8W2Rl7b+meeeaa4flZxdVLHS8be9Nr7L0reo/OP2CSx8olJE/7vk3VOoj938MgH/q+J\nF68BvkadKTX643NBEQYATup9bOQIAEQ5Rc6E693Vy3Y6xR/n7Ewf+qAKR8AjhBBCrQa22LVG\nnJC5aeNG5daqp4aeGG8veawAkKEXHMXvbKnwfrHmRTPLAIDH8kOk49T5jwdzHst6hxRm9ca0\nEdmen1YVeG7PU7IAILnzN9h8mQCO4tmRTqE0XzlE9857360/VGy/55UmZpdACCGEUDxhYNca\nsaqu/76u5zMz7lLcMmVInzytQCylh7764EN93tV3Z2p91d2pvP7zdbvG90uvLtz9vzkfAEBR\nqVXSpxEAd9nR2tqOZrOhp4b/cebCkQ+P4+sKP339dSbcvAApA6d3V9zyyEMvPTz1mmRi/er9\n1/VKBgB4fcRTsACTr+p439yXBd0l16XGNIc7QgghhOIDpztpteSt33685JufDhSWu/2MKS1r\n4NArbr9zfCrPAsDWxW+9s+znSheb173/bQ/945cX7/juoH32ypXKtTMfmLNWMlz2zeInrPu/\n+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\nSUSjR4+OLI9RK3IFgsFgzPcqEAi8//77RHTJJZfk5eXF7DDR2htTp06tqqrq3bv36aefHlOU\naOWJRYsWbd68uX379hdddFH8FeA4Lv6GrlmzZsmSJSaTafTo0TFFkQV5A4FARkYGAQAANHnJ\nHxXbUBzHJVpjftmyZevXr7darUOHDq3n3rZs2TJv3ryuXbveeuut9ayyfPnyefPmEdHTTz9t\nuEFklYtoXq83UuWKK66of4qwYMGCmpqak046qf5VVq1a9csvv6iqevXVV9ezys6dO+fNm5eX\nl3fvvUYDW4jir/aGDRsipzN27Fi73R5fJf4KuFyuSJXBgwfX/3S+//77oqKi1q1bX3jhhfWs\n8ueff37zzTd9+/YdNWpUPauUlJTMmzfPbrc/8sgjhhvEnw4AAEDThEexAAAAAC0EEjsAAACA\nFgKJHQAAAEAL0fwGTwAAAACAIfTYAQAAALQQSOwAAAAAWggkdgAAAAAtRPObx64Oeti18Ls/\nzh8yoJ7bb/1p1tQ5izbuKlV5a8du/UeNub5zplz3AX749N05i38pKqsRUzK7nDFg9Jhh2RJf\nz8NpobKFi1edOfh8J8/q2CzgWjBs1MSY4KPTPuuTItVRS/Xtnvbuh9+vXOfRrSec0m/Mndfl\np4h1HaXi82E3fhAf5025c2a+XUfFrT9+9p95P+7YVSw4s088td/o0cOypMP892DtwmmfLFq+\nffteltKq98ChY0acZ+aMr0CiO1i1+cfJ0xds2FgoZrbv3ueCW68ZKLDD16qjNFGVBn8lAAAA\nmpIWldiV/zHpnUkb65nYlS59575xX6d3OevKG66S/Xu+mvnFY3f8/sJHb3a2JLwm6/7z8Guf\nF/Y4/6pLu+RUF/05c+aM+zd7pk4YU1eaFuXbVx+fuLSk/TnnOc11Xfagaw0RXXr1cEtUvpRr\nqit91EKlz99+/xql7cVDr29tcs3976zH7nP/Z/JYOUH+RESCpWD48OExwVWfzyxu1buOA5X9\nOum+V+a37nH+8DGXKWUbPps5Y+ym6qkTbqnjCmz89KnHp/5x4jlDr//bUPeOVTM/e2vDPvbO\nA+cZbmx4B4NVy+56+DU1p9flI2/271r12YwJW6qcr992Wt216i41DB7BVwIAAKBJaSG/WGqg\nasua5W+PX0FksBCCoY8mfSenD5r8wr0SIyIadHbuiDET3pqy9e3bCgy31/XAy18Wtur38DN3\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips %>% \n",
    "  mutate(minutes = (ride_length/60)) %>% \n",
    "  group_by(user_type, month, day_of_week) %>% \n",
    "  summarise(average = mean(minutes)) %>% \n",
    "  arrange(user_type, month)  %>% \n",
    "  ggplot(aes(x = month , y = average, color = user_type)) +\n",
    "  geom_line() +\n",
    "  geom_point() +\n",
    "  ggtitle(\"Average Ride Duration by Month\") + \n",
    "  xlab(\"Day\") + ylab(\"Ride Duration (min)\") + labs(color = \"User Type\") +\n",
    "  theme(plot.title = element_text(hjust = 0.5)) +\n",
    "  theme(axis.title = element_text(size = 10.5)) +\n",
    "  theme(axis.text = element_text(size = 10)) +\n",
    "  scale_x_continuous(breaks=seq(1,12,by=1)) +\n",
    "  facet_wrap(~day_of_week)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4e3d1282",
   "metadata": {
    "papermill": {
     "duration": 0.029759,
     "end_time": "2022-07-04T14:56:33.585742",
     "exception": false,
     "start_time": "2022-07-04T14:56:33.555983",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Visualizing the total number of rides by quarter"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "id": "2d30d11d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:33.647484Z",
     "iopub.status.busy": "2022-07-04T14:56:33.646129Z",
     "iopub.status.idle": "2022-07-04T14:56:34.117683Z",
     "shell.execute_reply": "2022-07-04T14:56:34.115267Z"
    },
    "papermill": {
     "duration": 0.505164,
     "end_time": "2022-07-04T14:56:34.120249",
     "exception": false,
     "start_time": "2022-07-04T14:56:33.615085",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'user_type'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips %>% \n",
    "  group_by(user_type, quarter) %>% \n",
    "  summarise(number_of_rides = n()) %>% \n",
    "  arrange(user_type, quarter)  %>% \n",
    "  ggplot(aes(x = quarter , y = number_of_rides, fill = user_type)) +\n",
    "  ggtitle(\"Total Rides per Quarter\") + \n",
    "  xlab(\"Quarter\") + ylab(\"Number of Rides\") + labs(fill = \"User Type\") +\n",
    "  theme(plot.title = element_text(hjust = 0.5)) +\n",
    "  theme(axis.title = element_text(size = 10.5)) +\n",
    "  theme(axis.text = element_text(size = 10)) +\n",
    "  geom_col(position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "117cad32",
   "metadata": {
    "papermill": {
     "duration": 0.030293,
     "end_time": "2022-07-04T14:56:34.180962",
     "exception": false,
     "start_time": "2022-07-04T14:56:34.150669",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Visualizing the total number of rides by user type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 41,
   "id": "8479aca1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:34.244388Z",
     "iopub.status.busy": "2022-07-04T14:56:34.242835Z",
     "iopub.status.idle": "2022-07-04T14:56:34.558614Z",
     "shell.execute_reply": "2022-07-04T14:56:34.556320Z"
    },
    "papermill": {
     "duration": 0.349967,
     "end_time": "2022-07-04T14:56:34.561159",
     "exception": false,
     "start_time": "2022-07-04T14:56:34.211192",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdZ4BTZdqA4TfTZxgYem/SRVQsYEFgFXUVFHVXVOy6tk9ZC/a6dl0L9rauYnft\nXey961rpuopdQIcOw8BMvh+DiJQhlJDx5bp+ZU5OTp4Ewtyc5JwkkslkAADgjy8r0wMAALB6\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIO9Ze7x23fiIFAz+ZvAaG+fSf\nPRKJRL/HJlSzznq18pYcLysrp3bdRhv17n/+v5+rXGTl/57aPZFI7PjqD9Xf7xXt6yUSiaen\nlK2Gx1Ctv7eonUgkxs6Zv9q3PG/WR1VPxbJWeG1wx0Qi0f3U/672u05FjfprBkQvJ9MDQMYU\nNGzdocNvQZOsnPW/L39MJHLat2+76GrN8rNT32ayctZbb3+ck996s01bra45F9Nknfa1s3+L\nmMr55b/88P3Hb4z4+I0R9750/ah7/i9N98vKScdfM4BlEXasvTY4/anPT//tx7IpTxfWH5CV\n2+jzzz9f6W3OnzN+q622qtP6zGlfn7saRlyaYe9+unejokWXJCumP3jRAXuc+ejoe4+88Ly9\nT2tfEkJoO+i827qUtuhSL01jkKJ0/DUDWBZvxcIfXiK7zqAzHjmqeXEI4T/Xj69a2GDjnQ84\n4IBtmxRmdDQA1ihhB5EY1LtJCGHqp1MzPcjaKjl30rzK5a+2+lSWl1Uk1+QdAn8Awg5SV/nq\nXRcN7LNBo7rFebVK1um25ZH/uPmHuRULr/7Pug3zijcOIUz/5rxEItGg8/Cq5cmKafdcfkK/\nnl0blNTKySts1KrTjvsc/ezYaat5uLmVIYTi9sVVP358ziaLHTxROW/SzWce3qNTq+L8/IbN\n2/3l0NM/m1q+1E19/cY9B+76pxaN6+UX1e24fo8jz7nxi9mLH/RQOvKpowfv0KFZg/zcvJIG\nLXvvdNB/3v1puUMmk5XPXHtK765taxfk1Wvcst/uhz356S8Lr53wSP9EItF24FOL3WrM9b0S\niUSXg19Z/rOQmlSGX+6TMPamXolEYsj/ps78+um9enctziu6c9LsVZkqlYf/9xa1cwvbz5sx\n6rhdtigpqpWbnVOvSas/Dx7y4ufTl9xgKn+OQGySQDKZTCbnlD4VQsjOa7asFa7ab8MQQiKR\naNJu/T5bbFovNzuEUNJh4KhZ86pW+HjYuScdf1AIIb9Or1NOOeXcyz9IJpOV86cf2rNxCCEr\np+6Gm27Rd8sebevlV93R45NnL9z4JxdvGkLY5tGvqpmwa1FuCOHuSbOWduX8vRoXhRAOeP3H\nqp8/OnvjEMIOr3y/4OqyCXuuW2/h/F1alIQQCur3OqBJrRDCU6VzFm7o7Sv2z04kEolEk7Zd\ne222YcNaOSGEWi22eXHib9NO/u+wujlZIYT67dbbqu9WXduWhBCysouvHl26rOGHNC8OIVxw\n6EYhhNziJt036lwrJyuEkJVT57znvqtaZ96sUYVZidyidedU/O62hzUvDiFc9/2MpW65fOaH\n1f9r9upeHUIIG57yQerDp/IkjLlxyxDCIR8+271OXmGTTtv23/mxX+Ysft9LqOavWSoPf0jz\n4uy8Zvt3qhtCyClqtOFGXYpzskII2XmNr3lv0qK3SuUhAPERdrBA9WH31UP7hhDyS3o89unP\nVUvKZ4wf+qdmIYQ2O92+cLWqyKjT+syFS75/eVAIoXbr3ceWllUtqZw/46aDOoUQ1j/hvYWr\nrXzYVZT/8PkHFx68aQih8ebHzq1csHixsHt0344hhJL2u7361bSqJd++c8+6RblVSbQw7KZ9\neX1+ViKveP1/vfDFgs3P+/mGIZuHEEo6HLawN05oUyeEsN/Nby0c4onTNwshNN7438savirs\nEonsQ699rrwymUwmK+ZOvu6oLUIIuUXrflM2v2q1S9atH0I4ZdxvjTV78oMhhKJGeyxryysa\ndssdPsUnoSrsGq9TvM2p98yuqEympvq/Zst9+L8+jVkHXvn03AVP4883DNkyhJBfslXpvMoV\neghAfIQdLFD9b9xDmheHEI5786dFF86bPaZ5fnYiq+DjmeVVS5YMuy/uPHbXXXc99YXvF73h\n1C9PCCG03uH5hUtSD7tl2fKIyybP++1X9qJhN3/OlyU5WYmsgqcn/25vzTcjDlos7IZv1SyE\ncOQrP/zujivn7dekVgjhxh9nVi3oWJgbQvh8zryFq5TP/Ojss8++8LJHlzV8VZG0GXjX7xdX\nDGlXEkLY8aEvq37+6uEdQgjt9/jtmfnvmd1DCD0v/XRZW17RsFvu8Ck+CVVhV9RozxXqpOX8\n/2F5D7/qaWy1w62/v92Cp3HPF79boYcAxEfYwQLV/MadP+fL7EQip7D9vCX2y9yzaZMQwn4f\nT676ccmwW1JZ6df/PrbbSoddk3Xad1hU+3UaFOaEEPLrdr3mjd+6c9GwKx3/fyGEeh0uXWyD\nlRWzWuRnLxJ2FesU5GTnNixb4mG+M2S9EELf/yzY/XNS+7ohhLY7HvXUW6PmpravqqpIThw/\nZbHlEx7fLoTQvPeTVT/OmzWqICuRV7zxwqd65waFiUTOq1PnLmvLKxp2yxs+1SehKuy6HPLm\nsh/0UlQfdst9+FVP49FjF3/Lu+ppbDPg+RV6CEB8HDwBy1c+452KZLKg3o45S3y7QcdtmoQQ\nvh5V3bGo82dPuP2q8w7e+y+9e3Zv1aRuQf02h1w5cqWHGfbup58v6osvJ8+c9tB5/edOHX1C\n/78u9bDMmf/7IoTQaMvNF1ueyCoa1PC3U+JVlH31Vdn8ink/F2Qt/r0Im187KoQwffSCT+if\n+eId/TrWnTDiugFbrldcp8lm2ww8/pwrXh9butzhd21StNiS+t23DiHM/n5s1Y85RV3P6VSv\nfOaHF0+YHkKY+f21T/wyp26HM/uU5KXy5KSi+uFTfxKq1NtkdZ4pMMWHP3AZT+P0cWNX4iEA\nMXGCYkjFMs8qkchOhBAqy5d5notfPvx3z75HfjlzXsOOm/xp8559dhrcoVPXbu1e6bnZsNU1\nXCKr6C9nPL7pJUUfTH/z4Z/n7N5w8XPXJXITIYSwtO/cqp/72//uksl5IYScgrYnHLvXUu+o\n6WaNqi4Ut9n5hXET33/uoceffv61N956/7Un33v5iSvOOWnnUx587MJdqht1iRkSWXkhhETW\nbzMPuqDnyX995q7zPj7j1j4fn3NdCKH35QdUs82F/45VhLDUb2+onF8ZQkj8WuXVD5/6k7Dg\nvgtX87+iqTz8rGU8jcnK8rAif45AhDK9yxBqimrfiv0iO5HIKewwf4mr7t+iaQhhj/cnVv24\n5FuxezapFUI47p73F73VtK9ODyv7VuwyjopNntOmJITwj68XHBux6FuxU744LoRQr9MVS96q\nT0l+WPhWbGV5o9zs7LzGqR4I8Kv5syc+e8cFjXKzE4nE3ZOWftBl1XuIp3wxdbHl3zw7IITQ\ndpcXFy6pejsyv6R3RWV5z9p52bkNFh5asXQVs/OyEiGEt6cv/e3aG7s2CMt+/3Hx4VN+Eqre\niu192/jlrfg7yz34uvqHX/U0Hjdu8bdiv31uQAihRd+nksmV/3MEIuCtWFi+7IL2+zcpmj/n\ni5Pfmbjo8vlzxg/98OdEVt7xnZf+flyyYtr9k2bn5LceNnjTRZdPHz96tQ9ZLycrhPBtWcWS\nV9VueVz93Kyp/zvt+V/KFl1e+tmFr02b+9vPidyTO9etKJ90+ruTfr+ByiEbtm/WrNljv5SF\nEGZPuqtjx44bbD504dXZhY233++0qzvWSyaTz08pC8t230nPLLblK//+ZgjhTyd2Xbio6u3I\nudNeP+flE9+bUd6019Wtqv8e1azCqgNdh1713yWvnPXDEyeNnxJCOHyb5ikNn9qTkD6pPPyH\nj3/y9wuS1xz9Vghh4+PXCyHVP0cgTpkuS6gpqt+V8uV9e4UQ8utu9tToBR//nzfzfyds0zyE\n0Lr/b4coVu2xq93imF8XVLQrzEkkEreM/G0Xy3sPXN65KDeE0KLviIULV32P3Y0d64UQBryz\n9PPYPbF/pxBC3U6D3vp2wRGRpaOf3qrBgjdAFx4VO+n900MIecUb3PvuggMqK+dPv+P4P4UQ\n6nU6esFDKp/YMDc7kcg+89HPFt775JFPdCrMTSRyXppattTxFp7u5Kh/vVJ1GGnFvNKbjtkq\nhFDYaIeZvz9dyJcP7RBCyK2TG0I4+tcDU6ox8Z3TsxKJRCJn0NDLPvv1PG2VFbPefOSaTesX\nhBBa7XBd6sOn8iQk07bHrvqHv/BpPOz6F6r241XOm3rL8VuHEPKKN/qpfMERuik+BCA+wg4W\nWN5v3Mph+6xf9Tu1ZeeN+/ToWnVi2JIOu4yZ/duJMyrm/ZyflUgkcv/8173+NuSFZDL51ll9\nQwhZ2bW22n7nPXbdYcNOTbKyiweffErVfR34f0dVnQJt1cNuRJ8WIYQuh71S9eOSJyjeo0vd\nqvlbdNpoww5NE4lEft2eVx3YMfz+BMWPnLRdVe213aBnv617tW9YEELIL9no6Z9+u9+3z9m+\nap3GHTbcZtt+PTbokJVIhBC2PeXZZQ0/pHlxTn7rLRsXhhDy67bo0aNbSV52CCGnoO3toxc/\nVHberJEFWYkQQl5x9zmpnU3kjSv+VpSdVfUAm7Rap1P7tnV/3dHVbrshP879bSupDJ/Kk5C+\nsKvm4S84KvbALUMIeSUtNu25fr387BBCdm6Dy9/43bl4UnkIQHyEHSyQwm/cihdvP39Ar271\naxfmFNRuve7mR5x10/dzF++OVy8+tE3jkqycvE5976+61ZNXnbzFeq0L87KL6zXecsC+j376\nSzKZvPaAviUFObUatJo+f/WE3ZcPbhdCyMopue2nWcklwi6ZTFbM/fGG0w7dpGOLWnk5JY1a\n7Ljf8R+Vlr17bLfFwi6ZTH70+HWDtuvZqF5xTm5Bk3Yb7H3MBaOWONvIm3dfMrD3xo1KamVn\n5dSu33zL7fe67tGPqhl+SPPi/Dq95s384rKh+2/Qtmlhbm69Jm122v/4N79d+jnVLu5SP4TQ\n+W+vVrPNxZSOevHMIwZvum6bkuKC7LzChs3a9dt1/xsefnPJMkxl+OU+CekLu+SyH35V2H04\ns/z1m07aokurWnk5dRo27zfoiBGjFo/jVB4CEJ9EMulLpIEaZ2jbkiu+nn7D9zOPaF4r07Nk\nwLIe/t9b1L72h5kfzizfqFZ1Z6sG1loOngBqnNmT/nPF19OLGu21dlbdWv7wgVXhPHZADTJr\nell+7ox/7npsCKHHP87K9Dhr2lr+8IFVJ+yAGuSUdRtd+8PMEEJho973Hto50+OsaWv5wwdW\nnbADapBN/7zVeu/82GajbU+/8vxmeWvdZ0WW+/D3vuy67rPnta7+xH7AWszBEwAAkVjr/kMM\nABArYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEIk/9jdPJJPJ6dOnZ3oKMq+o\nqCiRSJSXl8+bNy/Ts0CccnNz8/Lyksnk7NmzMz0LNUJJSUmmR2Ap/vBh5xc5IYScnJxEIlFW\nVubvA6RJTk5OTk6Of3WhhvNWLABAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkcjI9AMDyNRo5LtMjQA0yuVvnTI9ADWWPHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkcjI9wKrKz8/P\n9AjUFDk5Of4+AGuDjP9bN3fu3MwOwLL84cOuqKgo0yOQeYlEIoSQl5eXm5ub6VkA0i7jv/vK\ny8szOwDL8ocPuylTpmR6BDKvQYMGiURi9uzZZWVlmZ4FIO387mNZfMYOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBI5mR7gD6/2pedmegRCeQghhNwQcjM8CGHGiWdl\negSAtZc9dgAAkRB2AACREHYAAJEQdgAAkRB2AACRWENHxX7xxkN3PfL82G8mVWTXar9B7wMO\n3X/dRgVVV404fO8bfpxZr+vxt1/cd7FbTfvimv2GPh9C+PdDjzbO1aAAANVZE7U06c0bhl5y\n+9d56+x+4FEH7L7ttE+eOe3I48bMnr/oOtPG3zqjIrnYDUff/tEaGA8AIA5rIuxuv/Glggb9\nbrrw5N0H9Ntp9wOGXTMkUf7DtXd8sXCF3KJuWRVTb/9q+qK3SibLho+ZUn+9kjUwIQBABNIe\ndsmKKa9Pm9tq513zEguWFDbepk9JfumH4xauk13QZo+mRR/ePnLRG8787u6J85L79WyU7gkB\n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\nekarbS699cF3P/zko3devW/45X3qfn36Xhud+sqP6R4RAIBUpLTH7sxjHq7VbM9xn9zTOHdB\nCHbfrM/u++y7T9v21+174UXfXZPOCQEA/pBmT7ylVtNDviqb3zZ/DZ33N6U9dk+Wlq1/6lkL\nq27BLXMb/+MfG8yaeFd6BgMAYMWkFHYbFeeWTSpbcvncyXNzCtqt7pEAANaYinmVy18pbTdf\npvmzp67ErVIKuytP6T3qigOfmzBj0YUzv37xwIs/az3w/JW4VwCAzGqen3PG87du1LR2fk5u\n0w6b/eu9yR/cfmKXZvXyixtuttuxP//aa5XlP1x01O4bdmxZUNxg/b6DbnvrpxW6eQhh0jvD\nt+3etjCvoHnnzc6+47/Vb7Z+bvY133x7/KCtW6yz/0o8qOo+Y3f55Zf/utb2PYvP3rFjm23/\numv3Tu1qhxlfjv/ksYefn1pZdO6AWStxrwAAGTdst8uvuP+Ffm1zrtxnwJG912++zb73Pfte\n4ttnt9/lmL0e+vsLe7UPIZzed+ObZvS+5qo7122Q9fYj1/6tT4f5Y74/pGNJijcPIQzc6cKj\nrh52Xodar95x/mkH9pjX8ccLtmhSzWYfPKR/v8EXv/rPTVbiESWSyeQyr0skUtlENVtIt8rK\nytLS0kzde5Xal56b2QGgRplx4lnp2GyjkePSsVn4g5rcrXOmRwgNGzZcjVubMWNGnf9+uho3\nWGX6JhvUrl17Wdc2z89pd92oNw7pHEL46e0BzXs988nMuesX5YQQzl+n7r39nxl13eYzv7+i\nTqsTXi6d3bduftWtrly3wbCWt3/z/E6p3Lzq4ImB937x2K+Rd9p6Df4VzprwXOWyNls/N7vJ\nwc+PuWmblXvI1e2xKytbyufqAADi0KTXgjzNrVuQnd+6KstCCA1yspKVyRDC1LHPJJOVf6pX\nsOit6paPC2GnVG5eZcgOLRde3uewjsPOun/q2OJqNtvhwK4r/YiqC7v8/PyV3i4AwB/KUg48\nyC0pzMqpO23qd4u+iZnIykvx5ktekVc/L5GVW/1m69Rf6vZTktJ57JLzp955yUXPfDB6ypz5\nS147YsSIlb57AIAaq6TdocmKx2/6Yd7xHeuGEEJInrBt75/2vOWuQ1fg3fDrXvih3+7rVF2+\n9/IxJZ0uLWnXaNU3u1Qphd1DB/Q44J4v8hu07LpO0zV0fj0AgEwrqD/giu1anLrVwOKrT92i\nU73nbznhqje/f/qBtiu0kSf23+6fZVf061DrtTsvOPuz6VeO3KWgfr1V3+xSpRR2xz70VYt+\nF4959qTa2SkdTgEAEIe/P/nf2UcfduGRe/w0N7/LRlvf+dqj29Vbgc+qZec1e3bYoJPPOfQf\n35Z16L7JpQ+PPHrdequ+2WWp7qjYhZrm52z80rdP92q26ve3ejkqFmoaR8XCGuCo2BRVf1Rs\nlFI6QfFZmzYad9Vz6R4FAIBVkdJbsYc8/fADHfv1OeCLowf9qdnvD80NIfTq1SsNgwEAsGJS\nCrufP3hxzLTyiXec//odS/kCsQyeoBgAgIVSCrshe11YmtPx7CtO6dHeUbEAADVUCmGXnP9U\nadlmtz72jwM6pX8eAABW0vIPnkhWlhVkJXKKUtq3BwBApiw/7BLZxfce1ePtQ/Z68Yvpa2Ag\nAABWTkr74e79pX2Dufdt16Vppw02aFQrd7FrX3/99TQMBgCsRaZvskGmR4hBSmH33Xc/dNqi\nt0/YAQDpsLadRjh9Ugq7l19+Od1zAACwilL65gkAAGq+lPbYDRo0qJprH3jggdU0DAAAKy+l\nsBs7duzvfk7O/+nr//08c152XpNdB/ZOy1wAAKyglMLus88+W2JZ5ev3XrL7gWd833Tf1T4T\nAAArYaU/Y5fVe/ApI07b8N3r/vpFWcXqnAgAgJWySgdPtBjQIpmsSCaTq2saAABW2qqEXfLJ\n8z/LKezQsdC3jQEAZF5KTTZ48OAlllX+9MXbr3zwbacDn1ztMwEAsBJSCruPP/54yYXZ+S0G\nH3XMlVfsuLpHAgBgZaQUdmPGjEn3HAAArCLfPAEAEInq9tgddNBBqWxi+PDhq2kYAABWXnVh\n9+CDD1ZzbXL+nFllFUHYAQDUDNWF3YwZM5Z11cjHr9r/b6d+PLd8+8MvSsNUAACssBX+jF35\ntNGn7tlz/V2O/V/JFre9NuGZG05Mx1gAAKyoFQu7N+44p1vL7v98aORep9789dgX9t+qZZrG\nAgBgRaX6pRGzf3z3+IP2u/HZzxt13+3RO/49cP36aR0LAIAVlcIeu+T8J68+rkPbXje/VHrE\nPx/49sOHVR0AQA20nD1208c/938HHHTPOz+0/dPBL952Vd82xWtmLAAAVlR1e+zuOvegVuvt\neP8nuafc9Pz/Xr5F1QEA1GTV7bHb7x+3hRCyc0pvPHnQjScvc7UpU6as7qkAAFhh1YXdvvvu\nu8bmAABgFVUXdnfeeecamwMAgFW0wicoBgCgZhJ2AACREHYAAJFYo2GXnD/l2edeXmzhiMP3\nHjhw4AGnvLrk+tO+uGbgwIEDBw6cNK9yjQwIAPAHtkbD7uePb7zhxtuWetW08bfOqEgutnD0\n7R+lfSYAgFisobCrKJs29r3nzr3kvaVem1vULati6u1fTV90YTJZNnzMlPrrlayRAQEA/vDW\nRNjNmfyfv+y5/0nnX/t1WcVSV8guaLNH06IPbx+56MKZ3909cV5yv56N1sCEAAARWBNhV1B/\nx2uuuebaa689bvPGy1qn7+D2U8YMn1P527uxn9/1TmGjXTsXLufbbAEAqLImsimRXdK6dUkI\nYVat3BDmLXWdRpvtn7zixDu+mXF42zohhJCsuOOjX9octG0Ioxdb87nnnhs3blzV5YKCAl+P\nATVKrVq1Mj0CxC/jL7TZs2dndgCWpabsD8sp7LRbo8LX7xh7+Fk9QwizJz341dyKc/o0Ca8v\nvuZrr732zDPPVF2uV6/eoYceuoZHXczczN491DCFhYWZHgHil/EXmrCrsWpK2IUQ+g1q++jN\nw8uTPfISia/ueyW/7vbda+V+t8Rq9evXb9GiRdXlkpKSioqlf24PyAgvSVgDvNBYlhoUdk16\n71N5/Rl3fz/roJa17n57UsvdByx1taFDhw4dOrTqcmVlZWlp6RqccSlqZ/buoYaZMmVKpkeA\n+HmhsSw16JsncovW71+/4K07x5eVPj1y1ry/btc80xMBAPyR1KCwCyHssGurnz8a/uUjz+SX\n9O5VJy/T4wAA/JHUrLBrts0eFWVfX/Tkt8232y3TswAA/MHUrLDLq92zX92CaRWV/XdumelZ\nAAD+YBLJ5OLf0PoHUiMOnrj03MwOADXKjBPPSsdmG40cl47Nwh/U5G6dMz1CaNiwYaZHYClq\n1h47AABWmrADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIhETqYHWFV169bN7AAVmb17qGEy/pKEtUHGX2jTpk3L7AAsyx8+\n7MrKyjI7QG5m7x5qmIy/JGFt4IXGsgi7VSXsYFEZf0nC2sALjWXxGTsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AID/b+/u42uu/z+O\nvz7nnF2ds+sNszbDXE0KuYiMXP1KrZRiJZexaKXEl7lWFs2QkItv5aILyaRyEYmiCxJ9Kbm+\nyuUwjF0e29nO+fz+OJyWYlPyOT4e978+n/f783m/Xzs3Z3t6fz6fc3SCYAcAAKATJq0LuFz2\nvm/f+mjV7j0HPcpVrtu0Xd8nW5sUrWsCAAC4GbjXil1h9sZ+Q9745Ywlrmvv5jGBqxdOHfTW\nVq2LAgAAuDm414rd5knv5BnDXp80rKq3UeT+ao7nxq9KOdhzYbS3UevSAAAA3J07rdip9nm7\nzgfW7FH1Uoyr3zlOdRR+uPOctnUBAADcFNwo2BVZt58tsldsV8XV4h38gLdBObn+rIZVAQAA\n3Czc6FKs/cJvImKu6FOizRDuacw8nFfysBMnTmRnZzu3FUUJCwu7cSUCKI3J5Ea/VQC90vyN\nVlxcrG0BuBI3+hXscOSJiL/PH26nC/YwnCm0lmyZOXPmqlWrnNtBQUFr1qy5YRX+pUJtpwfc\nTGBgoNYlAPqn+RstMzNT2wJwJW4U7BSDRURyCu0lG88VOQwePlc4wy14pU7TugRA/9SWzbQu\nAQBuAm4U7Ew+0SJyIaNAqgZcalNPFdkDoywlDxs4cGBiYqJr9/z58zeuRLirwMBARVGsVmth\nIUuowL/Cy8vLbDarqpqVlaV1LdCeqqpal4C/5kbBzsNcp5yn8dTqY9K0grOlMOtrq12t1bxc\nycOCg4Nd2w6H49w5npnFRQ6Hw263l34cgGvn+kPOuwxwZ270VKwoph4xQed3zj9d5HA27Fu2\nTDF4d7kjRNu6AAAAbgruFOxE7h6YYCk6PPiV/679cfPyj2aO/uRIdNzQ6nw6MQAAQBko7naZ\nPGvP2mmzP95x6JTJN6zJfZ0Sn2rtceXviuVSLJxCQkIURcnLyysoFp2zDQAADjJJREFUKNC6\nFkCffHx8LBaLqqo8Dgmn0NBQrUvAX3C7YHdNCHZwItgB/zaCHS5DsHNP7nUpFgAAAH8bwQ4A\n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\nINgBAADoxP8DLksz0rnXtgkAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips %>% \n",
    "  group_by(user_type) %>% \n",
    "  summarise(number_of_rides = n()) %>% \n",
    "  ggplot(aes(x = user_type , y = number_of_rides, fill = user_type)) +\n",
    "  ggtitle(\"Total Rides by User Type\") + \n",
    "  xlab(\"User Type\") + ylab(\"Number of Rides\") + labs(fill = \"User Type\") +\n",
    "  theme(plot.title = element_text(hjust = 0.5)) +\n",
    "  theme(axis.title = element_text(size = 10.5)) +\n",
    "  theme(axis.text = element_text(size = 10)) +\n",
    "  scale_y_continuous(labels = scales::label_number_si(),breaks=seq(0,3000000,by=1000000)) +\n",
    "  geom_col(position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e73553c2",
   "metadata": {
    "papermill": {
     "duration": 0.030592,
     "end_time": "2022-07-04T14:56:34.622589",
     "exception": false,
     "start_time": "2022-07-04T14:56:34.591997",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Visualizing the total number of rides by bike type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 42,
   "id": "9eba0c53",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:34.686485Z",
     "iopub.status.busy": "2022-07-04T14:56:34.685101Z",
     "iopub.status.idle": "2022-07-04T14:56:35.206509Z",
     "shell.execute_reply": "2022-07-04T14:56:35.204077Z"
    },
    "papermill": {
     "duration": 0.555851,
     "end_time": "2022-07-04T14:56:35.209039",
     "exception": false,
     "start_time": "2022-07-04T14:56:34.653188",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'user_type'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips %>% \n",
    "  group_by(user_type, bike_type) %>% \n",
    "  summarise(number_of_rides = n()) %>% \n",
    "  ggplot(aes(x = user_type , y = number_of_rides, fill = user_type)) +\n",
    "  ggtitle(\"Total Rides by Bike Type\") + \n",
    "  xlab(\"User Type\") + ylab(\"Number of Rides\") + labs(fill = \"User Type\") +\n",
    "  theme(plot.title = element_text(hjust = 0.5)) +\n",
    "  theme(axis.title = element_text(size = 10.5)) +\n",
    "  theme(axis.text = element_text(size = 10)) +\n",
    "  scale_y_continuous(labels = scales::label_number_si(),breaks=seq(0,2000000,by=500000)) +\n",
    "  geom_col(position = \"dodge\") +\n",
    "  facet_wrap(~bike_type)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7f276ea1",
   "metadata": {
    "papermill": {
     "duration": 0.031782,
     "end_time": "2022-07-04T14:56:35.273828",
     "exception": false,
     "start_time": "2022-07-04T14:56:35.242046",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Visualizing the total number of rides by bike type as percentage"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 43,
   "id": "60b24c18",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:35.339971Z",
     "iopub.status.busy": "2022-07-04T14:56:35.338577Z",
     "iopub.status.idle": "2022-07-04T14:56:35.693773Z",
     "shell.execute_reply": "2022-07-04T14:56:35.691470Z"
    },
    "papermill": {
     "duration": 0.391268,
     "end_time": "2022-07-04T14:56:35.696492",
     "exception": false,
     "start_time": "2022-07-04T14:56:35.305224",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdZ2AU1RrG8Xd3s+mQEDpIkSZNiggiAiooih2vvfcuFrwqdq8Fe1f0WrADlyYg\nVarSe++QQEjvPdndmXM/BEISkhBCkrOZ/f8+sbOzu89MQvLkzMwZm1JKAAAAUPfZdQcAAABA\n9aDYAQAAWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABgERQ7AAAAi6DY\nAQAAWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABgERQ7AAAAi6DYAQAA\nWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABgERQ7AAAAi6DYAQAAWATF\nDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABgERQ7AAAAi6DYAQAAWATFDgAA\nwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABgERQ7AAAAi6DYAQAAWATFDgAAwCIo\ndgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABgERQ7AAAAi6DYAQAAWATFDgAAwCIodgAA\nABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABgEXYRSdt7r81ms9lsr61JLHOlXd+cZ7PZznxq\nTe1kerxlPZvNtivPUzsfVwW58YvvHtqnUah/024vlLdOtxB/23Hsdr964Y17D7rsze/mm8VW\nXj+6l81mG740tuLP/bh9A5vNNjstv5q2o1w19yXIin6rjN3iCIho0nbotQ9O25hcfOVSu2Xc\nGQ1tNtvvSbnVG2nNU2ceH+l4V21Oqt7PBQCg2vkVf/De5Xc9GTcr3M+mK01d8eqga3/cl97s\nrCHD+nWseM2mp7ev5zi2P02PKyU2ZtOyOZuWzRm/6Kvtvz9cw0m9lN0R0u705kUPPQU5sTGH\nFk3775IZv70ye/erw1rWZpjARq07dDjWlZWZs/9AnM3m17592+KrNQ9w1GYqAACqoESxy0ue\nc+l/Vq76zwBdaeoG5fp0f4YzuMv+tQuC7ScowR+t3nJL4+ASrzYyJ4+584aX/9gx/pG337jl\nhfZhItL2+jd+7JzasnODGoztTQLCLti798/iS1zpB95/6LKXJu5++19XPZOxLsRuk9raLT1e\nnLX3xWMP89NmB0Vcbnc23rt3b41+LgAA1e7YOXbBjW8KddjXjhk+MzFPYyDvp8w8t1LO4G4n\nbHVlsjnqX//StEdbhIrIhK/2FC5seNaVd95550VNg6ozaJ3iH95u9K/LWgX4ubI3jI3NKVzI\nbgEA4KQcK3ZBDa+e9Uxv05N572VvVfvHKCM3z2VU+9tWhSpIdJsnXq2GXT+oqYikb0nXHcSL\n2P0aDQ0PEJEUj3d8q5wy05VvKN0hAAC+pMRVsQPfnDs0IjBp/Vv3Tj9YwWtWPtzVZrP9a2dK\n8YXKyLDZbCGNry9asvenwTab7d7did89d22T0LDgAL/QBk0GjXhoTXK+iDH782fO7dI6NMBZ\nv1Gb4Xe9sPe48/SVMud+8fygrm3rBfo3aHLa0Ose+HNLihzn4LLf77rmgpZNGgQEh3c8s+8j\nr3+9L7fEWxVe+fHY/vTsg7NvGtQ11D/4l8QKzr43l/465qrBPRqHh/qHhJ3efcAjr34bW3Cs\nZywY3sbuFy4iucmTbTZbvZaPV7CjKmAWmCIS2j608OGm1/uUunjCdCd++/KDfTu1Cg0IaNSi\n3bX3v7g13VXmW51wD4hI6rZZI2++tEPzhgFO/7CGpw264u4Jq+NPGLLiL0HUtMtsNlvbq2aV\netXOr86z2Wyd71ly4r1Q6uM8qYsyCmz2gOsaHTl4ffxuKWXPpOcCHfaAej1mRGYVLazMDqma\nymzy4y3rOYPau7O2P3X1uWHBIU6HX4OmrS65+bGFezOPf8OaiwoA8FFKqdQ994hIw87jlVLx\ny0aLiH9o7wN5HnXUzq8HiEj3J1cXPlzxUBcRuXZHsirG9KSLSHCj64qW7PlxkIh0vuYMETm9\n53lXXzakVZCfiIQ0v/rze3rZ7M7u5wy98qLzQh12EWl67piiFz7WIlRE3rq/t4g4Q5v26n1G\niJ9dROx+9d+Yf7j4h678+A6HzWaz2Zq27XreOT0bhfiJSEjLIQsTckuFv2/DvF71/YOadrro\nsiunp+Spcnx6e08RsdlsTdudOfjcsxs4HSIS1uGq7TnuwhX2/vDO888+KSLO4DOef/75V9+e\nXt5bdQ12ishviTllPem5qUmwiNz5T1zh442vnSUily6JOfJ0ftSNXRoUJencMkxEAiPOu7Np\niIjMSj2WvzJ7IGn9R+F+dhGJaNdt4PkDu7YNExG7I/SzHanlha/Ml8Cdsz3IbnMGd8kzSrz2\ngRahIvJlTFaZ75x56E0RCYq4vNRyV9bBd27tIiJd7vi9aGGp3fJDp4jiu3TftBeD7DZnSNep\n+zNOaodULC91log4/Jsf/1RlNvmxFqEO/+Z3dAoXEb/gxj17dw71s4uIw7/J52sSi7/q1KMC\nAFBK6WKnlPrsotNE5Ix7phWtdCrFzmZzPvfr2sIleYkr2wb6iYjD2XjsooOFC5PWf+W02Ww2\nR2T+kSpZ2CpsNsf9X8x3mUopZRQkffnouSLiDO5y6OhqGQe+CrDb/EPP/O+CfYVLDHfy2Mf6\ni0hYhweKfvMWhm9yeuiQ0b/nGmYF+yJyym0iEhDWd/qWI5vmytrz9AXNRaTNFT9VsKVlKrvY\nGa7YvevevudsEWnS/8mCo3FKNZg/busoImHtRyyNPFJZolf93iXYWdjFi4pdJffAM23qi8jt\n364oCjHzxXNEpMlZ35UXvpJfgve6RIjI87uPFcTcpMkiEtz4hvLeubDY2R2hnYvp2K5VkN0m\nIhc/9UWW59jXqIJiF/XnayEOuzOk86Q96UXrV3KHVKyCYleZTT666+x3fTK74MiuSx772AAR\nCQgbmOo2qzEqAACllFHsCjKWtwhw2GzOr4/+yjyVYtdi8E/FV5t0VhMR6TZyWfGFdzQNEZE5\nR/tK4a/GNlf9WjKq8Vi7MBEZPuVA4eNxA5uLyCNLYkusZbpvbxoiIl/HZRcPH9z4xhP+sryv\nRaiIPLU8vvhCd+7OFgEOmz1wU7arvC0tU9ejPaxMAx76IMl9LFHxBuPJOxDmZ7fZA2cnlRi5\nOTTn7lLFrpJ7oGOQU0T25rmLVnFlb3zttdfe/uCP8sJX8ksQOfVSEWl/w19Fa6x/uZeI9Ht/\nS3nvXFjsyhPYqNsbE469trxid2jeW/X97M6gThN3pRd/80rukIpVXOxOuMmFu67VpT+UfN2R\nXXfjwsPVGBUAgFLKuPOEf/0B894fqpT72WFPuk751O/W151d/GHD1iEicuaDnYsvPCPIT0RK\nXdFwwweXl1xgf+aTfiKy+ZMdIiJi/mddksPZ6KPBzUusZfN79Pq2IjJ+aYlzyFpfPbLim2wY\n+ZHj4nL8gtq/d27T4sv9gjp/cGYjZeZ/uC+jwjcoW9PT23corv3pDYP8RGT9hB8mrC57wtvM\n6PczPGZ4uzeGNypxNehpw75oWWIqtcrugREtQkTk4mufnL1yR+EX1BnS69VXXx096uqKw5/o\nSyCnXfJhoN0WPfs5z9Hvk9e+2m2z+b1//xkVv/Pxh2IzE6Lm//R6WOauV27uPXpJXAWvjVn0\nQY/LX870mA17P3TDGWHFnjm5b4mqqeQmj/jkmpKvO7LrVn20s9aiAgB8UNltp/uj029vUy8z\n6sdrxm4/1Q/wL+Mjgp0nvpXZNU2DSy2J6HWhiOTG7BIRIz8yMt9juJMD7aXvEND/i+0ikrmj\nxLnqDfqcYC40V9YqQ6nABsOPn56545CmInJwe1WuYP1o9Za9xe07kJSdMeWNywrSdzxz2b/K\nvDo3e/8+EWk8oH+p5TZ78PWNju2Tyu+Blxf+PLRjeNScLy8f0C20ftNzhlw16vWP/9mVesLw\nFX8JRMQvuOvrnRq4sje8E5UpItkxX8xMyQvv8PLgMP/K7Jzi6jVpc/Edryz96kKljC/veL+C\nNUff/JorYnCHIL/4FU+PXnasAJ3st0TVVHKTrypn12Xursp3LwAAleRX9mJ74Gfzxozv8vhf\nT1+6+vb9YWWvVJKq5jlEbMcVLJvdX0Rs9iARUcotIn6BbZ958qYyX97snMbFH/oFlbOlx5Q7\nOGlz2ETEdFXPBtrswde+NOPs94LXZS6fmpx3XaPSk7TZnDYRkbLmyIsoVogrvwdC21y5YHfC\n2vlTZsz+6+9lK9b+/eeaxTM/fv3ZK5+fPP3tigbtKv4SFLr+rX7P/Wvur29seumHwZte/1JE\nBn14ZwXvWbE2146S+xbkxH0v8lF56/g3PG/u9jnNZt/W6c4pn1x926iE+Y387HLy3xJVVplN\nPn6Kw8Jdp0xXbUYFAPiacutO+BmPTrj9s+t+3nP9Dd/Nv6a8tY5x51XzNP0zEvPOrVdiFCRt\n+2IRCevWWUT8Ats3djpSzdy3x4ypljug+dc7x2Gz5afNNURK3TrqwJIEEWnRPbw6PqeQ48qI\noHVZrm257uukdLELbdtNZH7SynUiA0s9taDYXWJPbg/Y/PtecnPfS24WESMvceHk726795WZ\n74z4/amcWxqXO/1vxV+CQq0u/TDQPi9q6kvm9wtHTTjgcDb8YthpJ4xTHrsjVOQEfyT8Z9Wf\ngxoFyh0TH36r0dg9Cy99adm6dwZLDXxLlKcymzwzIffCsIDiS9J3LBaRkFY18t0LAEChig6J\nXvPNrDNDnNFzH31pZcLxz+YklLgVfcz8t6s32cRn55ZcYH7y+HIRueDfXUVEbM7nzgg3XIkv\nrk4stdpjPds3b958ekq+nAxHYPs7mgZ78vY9t6rExnry9jy9Idlm9x91RnXe2KqBn11EovPL\nmIm33mlPRTjt6ftf+KvkJqRuffvvjIJjjyu3B3ITf+3YsWOP/k8XPe0IajLs9hc+69hAKfVX\nWkV76QRfAhE5emiyIOOf1xf/e02Wq9l5n7U6hXuqJq0dKyJBjUZUsE6L+oVXpTjenf9pgN22\n8YPLp8bnilT/t0R5KrPJU0f9WXKB+nzkChE5a1S32owKAPA56rirYouLnHxH0ZpFV8Xu+PJc\nEQnvdF+868h1nanbp3ULcUpZV8UO+Hpn8TdcdM3pInLPnhIzqL3VNkyKXexZNNfGo/9dUvgB\nhjv1mycGikhQ40uzj05Zkrj2RRHxD+0xfvWRSwtNT+bPoy4QkQadRha9eeFVsYN+3HPCC0kO\nTLxJRALCz5m1I61wiTt7/zNDWohI68uOXeR4StOdHPV1xwYicvmqsuexm3lHJxEJ73T9iugj\nV0em7pg9sOGRobWiHVWZPWC4Eho5HTab4+U/thZ9etK2mZ2CnDab36L0/DLjVfJLcGS/TblU\nRJz1nSIyclNSxbulvHnslFLRayf3rR8gIue+u7nM3VJqHjul1JxHuolIwx7PmpXeISdU8VWx\nJ9zkol33wFcLCmeFMd3p34+6UET8Q3sX/ZeplqgAAJRygmKnlPlcz0alil1BxvLC6egCG3W9\nbMT1F/brHmS3+Yf2ODPEWV3Fzi+g9YAmQSISEN6yb9/uYf4OEfELbPvT0cpVaNqzFxdma9uj\n39ALz2vfKFBEAsJ6z44/9ru/8sVOKfOjW88s/K182hlnDe7btXBq2bAOV+/MPTZXSLUUuzmD\nW4pI5weWFD48foLiGzqHFyZp2al3zw7NbDZbQHi/T+/qKCUnKK7MHlj5+rDCdZp06DnkoqF9\ne3Sw22wictHz88oLX/kvgVLKnbMt0G4TEf/QXnknmlSmzHnsOnfu3DLiSG2NOPP2osneTljs\nPAXR/er5i8jtkw5UfodUrDLFroJNLix2I+8aICL+YS3P7ndmgwCHiDicDT9cVmImnVOPCgBA\nKScsdionfmo9h714sVNKpe2YefcVA5rUP/LLOLTVoPHb065rFFxdxS6g/nnu7H0fPH1Hj7bN\ngpzOBk3bXHHHqOXRZUzutXHGl9df3K9xg1A/Z2DTdj1ueeKt7ekFxVc4mWKnlDIW/vTm5ed1\nj6gX5BdYr3WX/g+98k1MQYlf3dVS7A5MvlhE7H5hP8bnqOMajFLKKIgb+8L9fTq2DPH3C2vc\ncvjtozam5q9+snupYleZPaCUWv7be1cNOqtxWIjD7lcvosWAYTd9+cfGCsKf1JdAKfVO5wgR\nOePepRXvE1X+PHYO/+DmHXrfPfqLOFfZ0/upsoqdUurQ7IdFxBnSfc/R8l2ZHVKByhS7Cja5\nsNhtyHb9882z53ZuFeLvV79Ri6HXPzRne+lCfOpRAQAoxabUKU1V58lJiYzJbdepVdXPq0Ld\n93TbsI8PZo6NyX6oRYjuLLWkvE1+vGW9L2KzN2S7eodUNEM1AAA14YSTgJzo9SENO3ZqWC1R\nUEflJk74+GBmcOObfKfV+eAmAwDqhFMtdvBlOZn5Ac6sd695UkT6vvqK7ji1wQc3GQBQh1Ds\nUHXPd2n8RWy2iAQ1HjT+RLcRswYf3GQAQB1CsUPVnX3JwG6r4tr0vujFT95sXta946znhJt8\nywdf9sp1tz6FyfwAAKiyU714AgAAAF7CJ0ZZAAAAfAHFDgAAwCIodgAAABZBsQMAALAIih0A\nAIBFUOwAAAAsgmIHAABgERQ7AAAAi6DYAQAAWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBF\nUOwAAAAsgmIHAABgERQ7AAAAi6DYAQAAWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwA\nAAAsgmIHAABgERQ7AAAAi6DYAQAAWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAs\ngmIHAABgERQ7AAAAi6DYAQAAWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIH\nAABgERQ7AAAAi6DYAQAAWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABg\nERQ7AAAAi6DYAQAAWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABgERQ7\nAAAAi6DYAQAAWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABgERQ7AAAA\ni6DYAQAAWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAswk93AAD65OUpl0tcBeIq\nULm54ioQwxARZXjE5T6yjsctbreIbIzolyj1RSTYX2yFT9kk2P/IWgF+EuiUAKcE+x/5h7+j\n1jcHAHwexQ6wHMNQOdmSk6OyMlVOluTkqOwsyc5S2dmSk61yc6SgQLkKpKDgpN51Rf9+m1JP\nYn27TYL8JcgpAU4JCZB6gRIWLPUCpV6ghAUd+Uf9IAkJOLmNAwBUgGIH1Flut8rKVCnJKjVF\npSZLZsaRh2mpopTucGIqySmQnBO1Rz+7NAiRhqHSMFQahR75R8NQiQgVP04VAYCTRLED6oL8\nfJWcaCYlqMQElZSokhJVaoq4Tm7IzTt5TEnKkqSs0sttNgkLksb1pFmYNAuT5uHSPFwah4qd\ntgcA5aPYAd4nN9eMPaziY1VSokpKUEmJKjNDd6bappSk50p6ruxNOLbQzy5N6kvz8CNVr0W4\nnNZA/DiZDwCOotgB+qnMDBUTrRLiVUKcGROtEhO84ViqF/KYEpsusenHltjt0qy+tG0kLRpI\ni3Dp0FRCOWkPgA+j2AEaqIwMdSjSPBipYg+bsYclL093orrKLFn1bCJN6kvrhtKmobRrIqc3\nlgB+yAHwJfzMA2qFaaqkBDMqUkXtN2OiVUK87kDWpEQSMiUhU9ZGiojYbdIsTDo2k45NpU1D\nadlAdz4AqGEUO6DGuArMA/vNyH3qYKR5+FDhbHCoTaY6Mp63dJeISIMQ6dBEOjSVjk2ldUOx\n23TnA4DqRrEDqpVpqrgYc+9uc99uM3K/eDy6A+GYtBxZG3lkMC/AKe0bS9eW0rWFtG2kOxkA\nVBOKHXDKlFKJ8WZUpLlvt7lnp+Tn6w6EEytwy45Y2RErIhIWJJ2aSdcW0qOVNAjRnQwATgHF\nDqgql8vcv8fcuc3csU1lZepOg6rLyDsykmcTOS1Cup8mvVpL+yYcqwVQ91DsgJOjUlPMvbvN\nndvMPTsL76wKy1Ai0akSnSpztkhIgHRtIT1bS+/WEuR/4tcCgDeg2AGVYJpm5H5z5zZz53aV\nnKg7DWpDTsGRYTy7Tdo3kZ6t5aw20ixMdywAqBDFDiifUubBSHPLRnPLRg62+ixTyd4E2Zsg\nk9dKqwjp2076nS5N6uuOBQBlodgBx6HPoRyFB2qnrpMW4dL3dDm3Aw0PgHeh2AFHKWVG7je3\nbDS3babPoWKx6TJ9o0zfKC3CZUBHGdBBwoN1ZwIAih0gIio9zdy03li9XKWm6M6COiY2XSav\nlSnrpFNTGdBR+p4ugU7dmQD4MIodfFh+vrF9i7lxrblvjyilOw3qMKVkd7zsjpdfV0iv1nJ+\nZ+nSQpgsBUDto9jB9xSeQrdhjbFxnbhcutPAUtzGkWtpI0Kkf3s5v7M0rqc7EwBfQrGDD1EZ\nGcaa5ebaVSojXXcWWFxqjszeInO2SpfmMrCT9GkrTofuTAB8AMUOPsGMOmAsX2pu38KUwqhN\nSh25cVmwvwzoKMO6SSMG8ADUJIodLC0/z9i80Vi+VCXE6Y4Cn5brkgXbZeEO6dJcLuomPVtz\nBh6AGkGxgzWpmGhj5T/Gpg3i5iw6eIuiAbwm9WXwGXL+GRISoDsTAGuh2MFalDJ3bTeWLzX3\n7tYdBShXYqZMXiszN0r/DnJxN2kRrjsQAKug2MEqPB5j8wZjyV8qMUF3FKBSCjyydJf8vUu6\ntJCLukmv1roDAaj7KHao81ROtrl2lbF8qcrM0J0FOGlKjhyfbdNQLu4u/duLnfPvAFQVxQ51\nmEpONP5ebGxYI2637izAqTqYIt8tlekb5KJucn5n8Wd6FAAnj2KHOkklxBtL/jI2rRfT1J0F\nqE5JWTJ+lczeLEO7ydAuEuSvOxCAOoVihzpGJcQZSxZQ6WBtGXkydZ3M3ixDushlPSWYegeg\ncih2qDNUfJyxlEoHH5LvltlbZNFO6h2AyqLYoQ5Q8bHG0oXGxnWilO4sQG0rrHdLd8tFXWVY\ndw7OAqgIxQ5eTSXEe+b9ae7YSqWDj8spkOkbZeEOGUq9A1A+ih28lMpINxbONdau4sArUCS7\nsN7tlCt7yYVdxM+uOxAAL0Oxg/fJy/UsWWAsX8okJkCZsvNl/CqZv02u6CmDzxAb894BOIpi\nB29iGMbKfzwL5kperu4ogLdLyZaflsvS3XJDP+ncXHcaAN6BYgfvYJrGutXGgtkqg7tHACch\nKlnemy1dW8iN50irCN1pAOhGsYN+5oF9nhlTVFyM7iBAXbUjVl7/QwZ2kmvOkvBg3WkA6EOx\ng04qI8OYO4N5TIBTZyr5e7es2i/Dz5TLe4ofdyQDfBLFDpq43cbypZ6F88RVoDsKYB0uj0zf\nKKv2y839pUcr3WkA1DqKHTQwd27zzJiiUlN0BwGsKSFTPpkvPVvLrf2lUT3daQDUIoodapWK\nj/VMn2Ie2Ks7CGB9mw/Jzhi5qJtc2UsCnLrTAKgVFDvUFrfbs2SBsXi+GIbuKICvcBkye4us\nOSA39Zez2uhOA6DmUexQG8wDez1TJ6qkRN1BAF+UnC1fLJCereX2ARIRojsNgJpEsUMNy831\nzJ1hrFnJda+AXpsPyZ44uaaPXNSVm1UAlkWxQ41Rytiw1pg1TeXk6I4CQEQkzy3jV8m6SLlz\noLQI150GQA2g2KFGqKREz9QJ5oF9uoMAKG1vgrw6TS7pLtecxXR3gNVQ7FDdlDLWrPTMnCpu\nl+4oAMpmmDJ7i2yOlrsGSvsmutMAqD4UO1QnlZrimfQbA3VAnRCTJm//KcO6y7V9xMnQHWAJ\nFDtUk8KBuj+ncScJoA5RSuZtla3Rcv8F0qah7jQAThnFDtVApaV6Jv9u7tujOwiAqohNlzdm\nyKXdZUQfcdh1pwFwCih2OFXmlo3uqRMlL1d3EABVZ5oye4vsipP7zpdmYbrTAKgqih2qTmVn\neSb9bu7arjsIgOpxIElemyb/6isXdROmugPqIoodqsjcv8cz4ReVmaE7CIDq5DJk/CrZdlju\nGSRhwbrTADhJnEyBk2eanr/muL/9klYHWNXWw/LKNNl6WHcOACeJETucHJWW6pnwsxl1QHcQ\nADUrK18+mSdDu8mN/biiAqgzKHY4CebWTe4pE7hOAvARSmTBdtmfKA9fKI3q6U4DoBL4KwyV\n43Z7Zkxx//oDrQ7wNZFJ8uofsjZSdw4AlcCIHU5MJSe6f/lexcfpDgJAjzyXjF0kOzrLrf25\nvSzg1Sh2OAFz5zb3xF8kL093EACaLd0lB5PlkSEclgW8F4diUb7Cq19/+pZWB6BQVLK8Pl22\nx+jOAaAcFDuUTeXkuH/42lgwR5TSnQWAF8kpkI/nyewtwo8GwAtxKBZlUDHR7l++V2mpuoMA\n8Eamkslr5WCy3DNYAvg1AngT/keiNGP1Cs/0SWIYuoMA8GprI+Vwmjw2VJqH644C4CgOxaIY\n0/T8MckzdQKtDkBlxKXLmzNk40HdOQAcRbHDUbm57u++Mlb+ozsHgLokzy1fLpRZmznlDvAK\nHIqFiIhKSXKP+69KStAdBEDdYyqZsk6iU+XeweJkljtAK4odxNy72/3bOG4pAeBUrDkgqTny\n+EVSL1B3FMCHcSjW1xlrVrjHfU2rA3Dq9iXIWzMlLl13DsCHUex8mGl65szwTOFSCQDVJjFT\n3v5TdnEDQkATip2vcrncP/3XWLJAdw4AVpNTIB/NlRX7dOcAfBLFzifl5rq/+9LctUN3DgDW\n5DHlu6Xy+yruXAPUNi6e8DkqNcX9w1iVlKg7CACLW7BdcgvknkFiZwwBqLdAHqUAACAASURB\nVC0UO9+i4mPdP4xVGRm6gwDwCSv2SY5LHr5Q/PltA9QK/ozyIeb+Pa6xn9DqANSmzYfkvdmS\nXaA7B+AbKHa+wty6yf3DN5KfrzsIAJ9zIEne+VPScnTnAHwAxc4nGP8sdv82Tjxu3UEA+KjY\ndBnzp8RzwACoYRQ76zOWLPD8OY2L0wDolZwt78ySgym6cwCWRrGzOM/8WZ45M3SnAAARkcw8\neW8W0xcDNYhiZ11KeWZONRbO050DAI7Jc8tH82TzId05AIui2FmUaXqmTDCWLdGdAwBK8xjy\n5ULZRLcDagDFzopM0zP5d2PtSt05AKBsHlO+WigbDurOAVgOxc5yDMP9+4/G+jW6cwBARTym\nfL1I1kfpzgFYC8XOWjwe98/fmls36c4BACfmMWXsIlm1X3cOwEIodhZiGO7fxpm7dujOAQCV\nZSr5bqms3Kc7B2AVFDurME33xF/MHVt15wCAk2Mq+f5vxu2A6kGxswSlPP/7zdy8QXcOAKiK\nwnG7tZG6cwB1H8Wu7lPKM22isXGt7hwAUHWmkm+XyJZo3TmAOo5iV8cp5fljkrF6he4cAHCq\nCudA4b4UwKmg2NVtnjkzjFXLdKcAgOrhMuTzvyQySXcOoM6i2NVhnjkzjKULdacAgOqU55YP\n58qhFN05gLqJYldXGSv/MZYs0J0CAKpfrks+nCtx6bpzAHUQxa5OMjet90yfrDsFANSUrHz5\ncK6kZOvOAdQ1FLu6x9y3xz3pN1FKdxAAqEGpOfL+HMnK150DqFModnWMOnzI/dO34vHoDgIA\nNS4xUz6ZLy5+4AGVRrGrS1RKknvcN+Iq0B0EAGpJZJJ8vVhMDlEAlUOxqzNUZob72y9Vdpbu\nIABQqzYdkl+ZrBOoHIpdHZGf5/7+K5WWqjsHAGiwZJfM2aI7BFAXUOzqAtN0j/9ZxTMdOwDf\nNXmtrNinOwTg9Sh2dYBnxhRz13bdKQBAJyUy7h/ZHqM7B+DdKHbezvhnsbHyH90pAEA/w5Sv\nFjFxMVARip1XM3fv8MyerjsFAHiLPJd8PF+ymdwOKAfFznuphDj37z+JaeoOAgBeJDlLvlgo\nHn40AmWh2HkplZXp/uFryc/THQQAvM6eeJm4WncIwCtR7LyS2+X+8b8qPU13DgDwUgt3yOKd\nukMA3odi54080/6nDh/SnQIAvNrvq2RnrO4QgJeh2Hkd45/Fxvo1ulMAgLcrvEg2MVN3DsCb\nUOy8ixl1wDNnhu4UAFA35BTIZ39Jvlt3DsBrUOy8iMrK9Pz6gxiG7iAAUGfEpsu3S0XpjgF4\nCYqd1/B43D99q7I4qAAAJ2fjQflrm+4QgHeg2HkLz/RJKvqg7hQAUCf9b63sidcdAvACFDuv\nYKxeYaxZqTsFANRVpiljF0lGru4cgG4UO/3U4UOeGZN1pwCAui0jT75Zws164Osodrrl57l/\nGycej+4cAFDn7YqTaRt0hwC0othp5p42SaWm6E4BABYxe7Ns4HRl+DCKnU7G6uXmpnW6UwCA\ndSiRcf9IcrbuHIAmFDttVEKcZ+Y03SkAwGpyCuRbTraDr6LYaeJxu8f/JG6X7hwAYEF7E2Tm\nZt0hAB0odnp4/pis4rh5NQDUlBkbZTcz28H3UOw0MLdsNNYyax0A1CCl5NslklOgOwdQuyh2\ntU2lprinjNedAgCsLzVHfl6uOwRQuyh2tUspz6TfJD9fdw4A8AlrI2XFPt0hgFpEsatVxj+L\nzQP8jAGA2vPLConP0B0CqC0Uu9qjEhM882fpTgEAvqXALd//zewn8BUUu9pimu6Jv4jbrTsH\nAPic/Ykyd6vuEECtoNjVEs+CuerwId0pAMBH/bFRYtJ0hwBqHsWuNqiYaGPJX7pTAIDv8hjy\n3VIxOCALq6PY1TyP2z3xVzEM3TkAwKcdTJF523SHAGoYxa7Geeb+qRLidKcAAMgfGzggC4uj\n2NUsdfiQsXyp7hQAABERjyHj/hFT6c4B1BiKXU0yTfeUCVxkDwDe40CSzOMKWVgXxa4GGX8v\nVLGHdacAAJTwxwaJS9cdAqgZFLuaolJTPAvn6U4BACjNbchPy4XjsbAkil3NUMozdYK4XLpz\nAADKsCdeVuzVHQKoARS7GmGsX23u3a07BQCgXBNXS3a+7hBAdaPYVT+Vk2PMnq47BQCgItkF\nMmWd7hBAdaPYVT/PjCkqJ0d3CgDACfy9W/Ym6A4BVCuKXTUzow6Ym9frTgEAODEl8vNy7jMG\nS6HYVSvT9PwxSRTXWgFA3RCTJn9t1x0CqD4Uu+pkrFqm4mJ0pwAAnIQ/Nkhylu4QQDWh2FUb\nlZtj/DVHdwoAwMlxeeR/a3WHAKoJxa7aGHNmqFyumQCAumddpOyO1x0CqA4Uu+qhYqKNtat0\npwAAVNH4VZwgDSug2FUHpbhmAgDqtEMpsox7UaDuo9hVA2P9GvNQlO4UAIBTMmWd5Ll1hwBO\nDcXulLndxvxZukMAAE5VZp7M2aw7BHBqKHanyvh7kcpI150CAFAN5m6TxEzdIYBTQLE7JSon\n2/P3Qt0pAADVw2NwA1nUbRS7U2IsmCv5+bpTAACqzbpIbiCLOoxiV3UqNcVYvVx3CgBAdVIi\nk5mvGHUWxa7qPHNmiGHoTgEAqGZ7E2RLtO4QQJVQ7KpIRR80t27SnQIAUCMmr2VyUtRJFLsq\n8syZyX96ALCqw2myNlJ3CODkUeyqwty1w9y/R3cKAEANmrZeDFN3COAkUeyqwrNgju4IAICa\nlZDJTcZQ91DsTpq5c5uKPqg7BQCgxk3fIC6ukUOdQrE7aZ4Fc3VHAADUhvRcWbxTdwjgZFDs\nTo65Y6s6fEh3CgBALZm9WQo8ukMAlUaxOzmehfN0RwAA1J6sfFmyS3cIoNIodieB4ToA8EFz\nt3CmHeoMil2lKcVwHQD4oIw8Wc4MV6gjKHaVxXAdAPis2VvEw5x2qAsodpXlWTRfdwQAgB4p\n2bJ6v+4QQCVQ7CrF3L+H4ToA8GUzN4nJjSTh9Sh2lWIsXag7AgBAp8RMWcfdY+H1KHYnpuJj\nzT1c7A4Avm7mJlEM2sG7+ekOUAcYSxfyXxmwMqVyM+IMd77eFHY//6CwZnY7P5a9V0yabD0s\nPVrpzgGUj58gJ6Ay0o3NG3SnAFAjlDK3zftw+/wP8zITdGcREXEGhHYYePfZ147xCwjRnQVl\nm7+NYgevRrE7AeOfxWIwMSVgTasnPBm1blLfGz5s3mWIw+Fvs+s8O8U0jZSD69dOevavzy6/\ndNRCm92hMQzKsyNWolOlVYTuHEA5KHYVys8z1q7SHQJAjUiP3b578dgrX14X0aqn7ixHtOx2\nSaO2fae+1OXAmgnt+9+qOw7KtmC73D1IdwigHFw8URFj1TLJz9OdAkCNiN2xoFG7c7yn1RUK\nCIk4ve8NsTuYONN7rdwvmfxmgLei2JXPNI0V/+gOAaCmuHLTA0Mb6U5RhsDQRq7cDN0pUC6P\nIUuYKQHeimJXLnP7FpWRrjsFAMDrLNopbs6+hlei2JWL4TrAZ7mTF6387yX/e7rhTw8ETXi+\n58o5493l33Ng77fn/fHW46UWmgXxSbvnp8QdOv5lUT9e9feCbdUdGbUqM0/WHNAdAigLF0+U\nTSXEm5H7dKcAoIEnc9YfL1+TY4S0Ou+uhmF+KTvG75pyS9TG1TeO/sRuK71y9oaHl61e4Rfa\novjCjDWvzR/3VrbbIyL1ujxw8eNfhvkf+WHrTv1x6arVl33SqVY2BTVo3lYZ0FGO+44ANGPE\nrmzGir+ZlBjwTZFf3Z/tUX2e3TX0zk96XfPB0BcOnde3Xf6BT5fviyu1ppH7z9xvvztu4V8z\nv3uj/iXjbvo87/rXZtWL/mXe2IlFz27/8tkGF09rHOhf45uBGnY4TfbG6w4BHIdiV5aCAmPT\nOt0hAOixPTrZGfbwmR2aHV3gaH/b5yKSMG9nifWUe/371xZE3NkmNKj44rxd7xjOLsOuuS0o\nKDD0tMvOu+e8vF0vFT6Vf/DVzXGNh159Ts1vBGrD0t26EwDHodiVwVi3WvI131wIgB4qT0V0\niOh4XfFlNkcjETELPMUXJs0dviPWNvjZz/xsJX6Q2uuFKU989tFT6wui02x+LUVExFj35cfN\nb5gc4sfMwxaxNlKy+F0BL8M5dmUwVi/XHQGAJragEW/sKLUsc81LItLgwo5FS1yJ4+ZOW9z6\n1i2twoIjS64cdPoXjQPa//nurWcNHWGmLNowY2PTEWtFJGfLvQcK+t88uHNNbwFqjceQlftk\nWHfdOYBiGLErzdy3RyWUPpMGgM9K2zBm1q8L/cIuH9yrbeESZST+/e7jznYvDzm/2/Hr2/xa\nXPrG4rb1D2/6/e4tK9d0uPHPYcPPEjNr2XcT2933vfP46y9Qly3dLZyODa/CiF1pxpoVuiMA\n8AqejLUbfnt4+4b1zkbDLn5xUsDRThb1ywUxeadd/uQL5b3QEdb/3JHLzi22JH3ptUlBtw47\ns5WIiJmdfmh9vmrUsE1Xel5dF5cue+OlU7MTrwnUDopdSfl55o6tukMA0E4dXvDEsslf5Zv1\n2l/+db+r7g90HDm+kbf/pSXLd3V5/GCjSl/ZqjwHF09a2n10rE3EFf+/RZ/cF5ecJSLOiEED\nnpzerkWDmtoI1Iqluyl28CIUuxKMjevE7dadAoBWyrPtu7PWrt5av9ujQ+58t0lESPEn8/fM\nE6V2fta65CWyk8fdZ/Ord9vtH/9y/Psl/XFNfotXe7VqJMq9eMxdGa0eHfH8S8ESs+WHYcve\nubbNp4sdDNvVZWsj5aZzpF6g7hyAiFDsSjHWrdYdAYBmqfMuXbt6a4vh/xv2r+uPb1xBHR/o\nfdUVxZdEzXs7Q3XoeekN9oAex7+bmb9q4YIdfcc8ISKe7ImxOXmDH3w9vF6wSFjvBz7e+uQN\n+zNzOoWFHP9C1BVcQgGvQrE7RsXHqcOHdKcAoJXKXzrjb2fEY2W2OhEJ7HB/rw4llmQufj9L\nde111atlvt+hn27z6/59hwahIlI470l6ep7UCxYRT+ZOEQl2MvtJnffPHoodvAXF7hhj3Srd\nEQBoZmRPTXe5/Z2Ry8fdXeqpoA4v9BnUscxXlceTMenvjSkXf3x94UNH0IV9OjXf9P7FzhFP\nBNtid04bE9T+1dOCOYZX58WkyaEUad1Qdw6AYneMaZqb1usOAUAzI3eRiLgSZu1NKP1UmNx3\nssVu99iR9QZPaR4UULTkzKc3OCY+uPPPJ/KlYbO+bwy96alTjgyvsHIfxQ5egWJ3hLljm8rK\n1J0CgGb+Tb+7+7vSt3+t2OCPs8t7qtvzcaVmurP5Net26/Rut1YpHLzYyv1yfV+xMzksdON7\n8AhjPZdNAACqKDNPdjK3PbwAxU5ERPJyzd2lbyIEwOJsNqVM3SFgHSv36U4AUOwKGVs3iWHo\nTgGgVvkHhxdkJ+tOUYb8rKSAEGYtrnvWR0kBE6FCN4qdiIi5eYPuCABqW4uuFydHrk056F1X\nTeVnJ0eundiy2yW6g+CkFXhkI1NmQTcunhCVk20eYAAd8Dnhzbt0veiJ+Z8MP/u6d5t2HGSz\n6f9DNy1m2/qpoyNa92rb9wbdWVAVK/dJ//a6Q8C3UezE3LxBTM6zAXxR3+vfD2nYeuP0V3NS\no3VnEREJCInoeN7dZ13zhje0TFTB9ljJzJP6QbpzwIdR7DgOC/gwm63r0JFdh45052Uqpf9E\nW2dQGJWuTjNN2XBQLuisOwd8mK8XO5WZYR6M1J0CgGbOoPq6I8Ai1kdR7KCTr/9paG7eIErp\nTgEAsIhdcZJToDsEfJivFzuD47AAgOpjmLLZK87YhI/y6WKnMtLVYa5NBwBUp/VRuhPAh/l0\nsTN3bOU4LACgem07LPnMVAxNfLvY7dymOwIAwGrchmw9rDsEfJUPFztXgbmfeYkBANVvQ5Tu\nBPBVvlvszN07xcNYOQCg+m2OFrf+iRHhi3y42HEcFgBQM/Ldsidedwj4JF8tdqZp7tquOwQA\nwLI4zQ5a+GixMw9Gqpwc3SkAAJZFsYMWvlrsOA4LAKhJcemSlKU7BHyPrxY7jsMCAGrYNgbt\nUOt8sdipjAyVwEmtAICaxdFY1D5fLHbm3l26IwAArG9nrHiY9AS1yxeLndq3R3cEAID1FXhk\nT4LuEPAxvlfslDL37dYdAgDgEzgai1rmc8VOJcSrrEzdKQAAPoHrJ1DLfK7YcYIdAKDWxKZJ\nZp7uEPAlvlfsOMEOAFBblMheTrNDLfKxYmcYZtR+3SEAAD5kd5zuBPAlvlXszENRkp+vOwUA\nwIfsZuJU1CLfKnYqkuE6AECtOpwq2QwpoLb4VrEzow7ojgAA8C1KmM0OtceXip1SZnSU7hAA\nAJ/DaXaoNT5U7FRCnOTm6k4BAPA5nGaHWuNDxY7jsAAALaJTJadAdwj4Bh8qdioqUncEAIAv\nUkoOJOkOAd/gQ8XOPMiIHQBAD4odaoevFDuVlalSU3SnAAD4qEiKHWqFzxQ7ZrADAOhDsUPt\n8JViZ0Yf1B0BAOC7svIlOVt3CPgAXyl2KiZadwQAgE9j0A61wDeKnVJmbIzuEAAAn0axQy3w\niWKnUlMkj6mJAQA6cWEsaoFvFDuOwwIAdItKFtPUHQJW5xPFzow9rDsCAMDXuTwSm6E7hBdY\nP7qXrST/oNAOvc5/9dvFxVd7pU1Yveb3F/67W4h/i3PnnOLnLhjexlahqSl5p/gR3sBPd4Da\noGIodgAA/Q6nymkNdIfwDgMfHNm/nr+IiDKzU2Nm/2/qfx4YsiZl3Zzn+xSuYPfzc5jVOfzU\n5roHn+meVvhv05340ac/BzcZ8cgd7YtW6BjkrMaP08WmlNKdoca5/vOCyuEqc+CUfNP/zU2p\n9XWnAOq2y3rKdWfrDqHb+tG9zn5n85uHMl9sVa9ooStjY88W5+wzW2TmRAbZbaVe0i3EP63H\n9NiVw6srgztno3/oWU16zUzYeEV1vaeXsP6hWJWeRqsDAHiDw6m6E3gr/7Deb3du4Mk/uCPX\nozvLiSnDZXjrsJgPFLs4JjoBAHiFmDTdCbzYzrQCh3+zrsFHThJ7+/TwonPsSlCuD2/qYncE\njBq/s3BB9sG/n7zpktaNwwNCIjr3HvL6N7OrfI3Kzq/Os9lsn8cUHw8yhzYICm1+j4gEO+wD\nvt78xRNXNAoJdjr8G7fqdsezXya7j31aNSapMh8odvFxuiMAACAikpotuS7dIbxPfkbcxA/v\neykqc+C//3f8cdgSlOfT28/696T9I3/a8OHNXUQkJ/aPXl0u+mrmnqE33v/Kvx/oEXbwtYcu\n73Pnj1VL0u6WN+w22zfvbS9akhn17qL0/N6vPlv4cOcXw0d+Pu/sq+988YXHB5ye/cv7j505\nZLQhUu1Jqsz6F0+oxHjdEQAAEBFRIjFp0rGp7hxe4KXW9V8quaT9te8ufHNQRa9Rni/vPuup\n3/c89uOGT27rVrjsg2H3HbJ1WHpow7kNA0VE5J0/RvUe8dHdb7064sV2YSebKiB8yMiWod/8\n+h/5dFbhklXPf2+zB3xy25FrLNK3x42ctPPT6zqLiKh3xz3S+56v37tv6RPjzm9RvUmqzPoj\ndmZigu4IAAAcwdHYQgMfHPnMUaOeeuTqIZ33T32u6xWjs8s5eU2J8fV9fR/7aWubqyZ9dkf3\nwoWe3O1v7Ejt/PBPR7uUiMhlr3wqIhPH7qlasAde7JGXOvv7+BwRUWbOkzMPNew+pk/okQtm\nQ5refqTViYjN7/aPpwU77PNGr6iJJFVj9RE7pVQSxQ4A4C24fqLQpS++WfyqWBFZ+Mq5F73x\nzk0T7/vzlvbHr5+04bZH10m/8ID1cx9ZkTl8QH1/EclPnWMotfXDfrYPS6+fsbWKcwa2u/kN\n+yNDP/90171j+iRvfnZnrvuWT24sejb8jFuKr+wX2OHyiMA5Bxfnp0ZVe5KqsXixUxnpUlCg\nOwUAAEccZsSuHIOf+0reOGvdx1ulrGKnTNvbs7feE/5Dk36v3njdf6PnPyYiYvcXkTOf/eH9\nIS1KrR8Q1qtqMQLCLnzytNCvv39Hxkxa8NR0v4DWnw1qduxpW+lTAJ02UWZBTSSpGqsXO47D\nAgC8SSzFrlwOETFdZU930qTPr89dfJrIK/+94vsH/nz8xRXXvzWgaWDEZQ7bk570My65ZEDR\nmp68XVNmbG7WM7jKOe5/qedHD07+NWbf0yviTxs+raHfsfPW0ndPFLmk6KFRcHBmSn5Ij/MD\nI86tiSRVYPFz7LhyAgDgVbILJIcjSWVZ+fGjItLlke5lPmuzHWksd42f2ibQ7+Or7kj1mH6B\nHV7rGrH3lzsXxucWrTn+0atvvvnmQ6dQcNrd+JbDZnv+wSuT3MbdH5a4niMnfty/p+87+sic\n8Ow1WYZ5wZvn11CSKmDEDgCAWpWUJSEBukPoNv+d17Lr+xf+Wxl5+7csnjxvS1DjC3+9q2PF\nL3SG9pn76fAuD8689LUVa94c+OTsr77tdOvw9t1H3HRVn44R2xZN/OWvPWfe9cvtTao+TuYf\nNvipVvU+mLUrMHzISx3Ciz8V0rLPp//qtvPme/p1CNu85H9Tl0Q26ffEL8Nbi0hNJKkCyxc7\nRuwAAN4lIVPaNtIdQre/v/ro76P/ttnsIWHNht741Ntfvt0qwHHC13a+f8p97zX+4d3LZ4yM\nv6r1DVu2hD333JjpU7//w+XfrlPXV7+d89K9l55ivPte6vHBA8vOePjdUsNtTfq+P//etXc+\n+9mYCYnBTdrd8vTHH74z0t8mIhJaM0lOlsXvFet68yWVlak7BWAF3CsWqC7X9pEravV8epy0\ndS/06vfOlmlJuVcXm74k2GFvdtXCA9Mu1BjshCx9jp3brbKzdIcAAKCERH41eTfTnfzoFzvr\ntXqqeKurK6x8KFalpYqlxyMBAHVRIkeSvNgjj4/K3Tt1TZbr3qlP685SFdYudim6IwAAUFoC\nxc6LLZ3430hP2O0vT/ruopalnhpx3XXhZzfWkqryrF3smN4bAOB1MnIl3y2BTt05UJbt5R8p\n/23i/2ozSdVY+Rw7ih0AwDslcZodagbFDgCA2paSrTsBLMrKxU44xw4A4JXSc0+8DlAFVi52\nKpUROwCAN0rL0Z0AFmXdYud2qRxGugEA3iiNETvUDMsWO5WZwSR2AADvxIgdaoh1i10WVxwB\nALwU59ihhlh3HjtuEQsA8Fa+PGJX8NzI6n3DgHc/q943rNOsO2LHXWIBAN4q1yUFHt0hYEUU\nOwAANOBoLGqChQ/FUuwAAF7H3yFBgUZgYEFygdlUQnXHgdVYttgpzrEDANS64EAV5O/x8y+w\nOXMMZ5bLnpFtT86wxadKfKI6HG0cSFdH5ljtY77VTYboTQvrsWyxEw7FAgCqlZ9DggPMwACX\nwz9P+eW4HJl5finZtpR0iU+UwwlmdKxxqEDyS7zGFDHLfrdUNwMQqH6WLXacYwcAOCmB/io4\nwOP0d9n9cz3OTJc9I9eRmm6LS1MJSRJz2IhMNhNKv+YULoBI9VDsUP0sXOy47QQA4Ai7XUIC\nzMAAjyMgT/yyPY6sPEdatj0pQxKTJTZORcUaB3NVycsZyh9sqxZpbgYgUP0sWuxMU1wFukMA\nAGqJv1NCAj3+/i67M89wZrkc6bn2tCx7YorEJqvYOONQrHmo9GsMEUNH1qM4FFubTE/KuLde\n/HbCrG2R8Sog4sz+Fz/xnw9vPqdp4bMRTseIHcnfd2xQXR9ns9lGHUj/4PSwyqx8f/N638Vn\nH32hvV7DVpfcOeqrMY82ctqL3uqtiA2B4UMWpedfGBZQ8btZs9ip/DzdEQAA1cNmk5AAMyDA\n4/QvEP9sw5GV70jPsidmSGKqLT7OiIoxD2arkiWphgfbqgXFrtYoI+PBc7v8FnXaMy++8Vq3\n5hmxUfN//+C2gWdkbI16qHN4TXziQw89dG49/8qv33zgx+Pf7C0iynAf2vzXE88+eW7MaXvH\nj6jCW1mz2El+/onXAQB4AadDAvzNAKfHGZAv/lkeR06eIyXLnpAlqYkSfdg8EGtEucRV4jW6\nB9uqBcWu1qx8YchPO5stP7yyb/iR4a4b77i7XocmL177xUM7XqqJTxw7duxJrR/YqOf5559/\n5MGQi1pv/uOSya+JjCh6q4KMyr4VxQ4AUIOOTf/hn2P4ZbnsGVmOpExJSJX4eDM6xowsmv7j\nGEv0thOi2NUSVXD751vOGrOpqNWJiNj8X/z9sxZ/p5daNy9xxdMPPj9t8YbkPLNVxz73v/rt\nC9d3FpGouV8/+vJnK3fst4e3PO/KB3758rn6DlsFy4Md9kf2pX1wepg7e/uLDzzzx9KVh3MC\nzr309k++G3NmqPOEke0Om19Qx8J/F77VWxHHns1PXn5J14szLn9/3Q+P+tnEdMW++9TICfNX\n7Y7L69hniDWLHYdiAaAWlDf9R4YkJEj0yU7/4Wu4KrZ25Cb+fiDP8+h1bUotb3zOHc+eU3rl\n58+7fErEjeNmvN8yyLP092efvrnfzVemtXSt6HHFo4NGfz3767NzD6284+aRl3W+ctmT3VyZ\n/5S5/NjbKdf9vc/7M/Syb8fNauaX+Nmj91xwjqRs/+D4kPkp25Yv9xcRMT2HNs9//Lfoe3+e\nU+bm5KesuLTbsKJWJyIvnn/WN1mDPv/0ly4N7SunfWHNYicFjNgBwKnyc0iAvxEU6HL453rs\n2W5nep4jJVNSUm2xiXIozohJVNGqVE3j/qeVxlWxtcOdu1NEOgdVqvC0fWD093c9fnnjIBHp\n3P6FJz+5YmOOq2HW3CzDfPCRW/s3D5Y+vRdMab43uKGI5KeWvbxI6s5//3zAtST1x8Fh/iLS\nY2HyFbf+Hucym/uXvqFr3D8jBw489jCsw4ih3co4+S8/ZcXwAVccHPjW3qOtLjvm43dXJy1O\n/fX88AAROeuc861Z7BixA4CKlTH9h19qti05QxKTJCZeHSxj+g/xvVE3hQAAIABJREFUiSOk\ntSbPLFCibGLTHcTi/ALbicjuPM9lJZebnuSduxMad+rSxHmsZj359MOLZ0x5b9vuqKgDm5bN\nKlwYetpTt/Udd23b088fPmzgeeddPPyaK7s3q2B5kcMzVgQ2GFbY6kQkpMX9ixffX2bI069Z\ndGDahYX/zk2N+eU/1/yrz5nLkg70L3nZxGN9hpshjrRNW4v+nErfNVcp84IGgce296T2Tp3B\nOXYAfFvZ03/YklJsMckqNt6MjjEOln4Ng221y1RmgekOtJ/EBY+oguAmtzb3f2zChKinRnUv\nvjx+xQPdz582LzV/WIMj594ZBdFXdem+JmzgA9dfPOiKAfc8cUvfnleIiN2v0S9rDr+wfO78\nJf8sX/Tze6Mfu+CZOXPeubi85UUfYRaYNnugnKTgiJb3vz/z0c9avLoqcd7FpxV/6vRHxs98\nwtGs5YgRX4+a9XBXEXGGBdn9wjPSDxf9fUCxA4A6ptj0H/nizPH4ZRU40rNsiRm2xFRbfIwR\nGWceqovTf/igPKOAYlfTbI56P9/d6bJXblhx14YBDY/WLOV+/8Eloc1vL2p1IpK2a9Scg/lx\n+TObOu0ikpv4W+HyhOUfjZnm+uSD57ucd9kTIju+HtD738/KOxvLW170hi2v6JH/xpR12e6z\nQ50ikpvwS/tez47bEXVpgxPMRWcUHDaUCgpylFr+4rOXBYUFzH2h36Cnhq267UD/ev5h7e5X\nxoxvYt2jOhYeulXWLHaK2YkB1Fn+DgkKNAICXHb/POWX43ak5zpSs2zJqRKXJNEJ5uEY85Ch\nSg6vcYS0bsozCxpIPd0prG/IZ4uu+7vrkI79Rr301AW92xWkHpg29o0f97reXflh8dUCGvZV\n5qQPJix57MLTY7b//c6oF0Vkx/7E85tkffrha6nhzR65vI8tY/8XX+4OO2OUiASUs7xIo16f\nX9l00uUXPfD9mIdb+Kd89shT+aH/KrPVHbt4QiQvLeb3d0c6gzt/cHbjMjen/ytzLx3b4vp/\nfRM9//HAiMs/vrjl6IFXhX42+txODf76/hlrFjsx+CEHwEuFBKrAktN/ZNuTM2zxqRKfqA5H\nGwdKT/+hOEhqWXkmwxC1we7f7NdN2z5/efQPX4z+KDrZEdqoR/9hvy5//+a+JZpTvdP+Pfe9\nqJEv3PhFpl/PfkNfm7K92e1nvj6w+/DU1DkfJj/3xXODX0sNa9qqz5D7loz9t4iEd3y1zOVF\nbI7QiVsXPXP/C0/ccnGSEdbnovuWjP1PmQmLXzxh9w864+wrp2/4b4fAskuazRE2bvbopv2e\nGL3s+jEDmz3+5/rckQ+8/cgN8QUBnXtfaFNKnfou8zaemVONZUt0pwAs5Zv+b25Kra87hbcr\nb/qPdIlPUIcSVUzM8XPtwodtPfe37qHtdKeobQXPjazeNwx497PqfcM6zaIjdh7+vAVQ/QL9\nVXCAx+nvsvvnGn6ZLkdmrj013RaXKvFJEhNjRCWZ8aVfw08jlI8RO1Q7ixY7DsUCOEkOuwQH\nmAEBbmdAnvLLqdT0H1yRgFOTZ1DsUM2sWuz4GxlACRVP/xFnHIo1D5V+DT9IUMMYsUO1s2ax\nU4zYAb6kxPQf/jmGIyu/2PQfcUZUjHmQ6T/ghVymW3cEWI01ix2HYgErKZr+w+GfZ/rluPzS\n8uxpWbbkVIlNksNM/4G6S4kFr1+EXhQ7AJoFB6qgk5r+g8E2WAXFDtXOqsWOU2MAr1A4/UdA\ngMuvcPoPv4w8R+oJpv+gt8FnWHHCMWhm0WLHfxWgVhRN/2Fz5pnOjFLTf/y/vTuPj7K89///\nue77nslMJvu+sUNC2BfZA0EWAQEFFVTcd4tVj6ee/qq2pz1tT62/9tRTe1q1rdW6WwSxiFBR\nES2g1p1VNtkiYQkQQvaZub9/hJ0gCWbmmrnn9Xz0D2Yyc887NTN5577u67p2Br7aF9x90hNY\naxeIeSw7F1IOLXaGOvtjALRGR1mzs5O51yhn+Q+grTAUizbn0GKnDN0JAKeZ8P4Lo93m2z0T\n5uZWvh1cW+mv1p0IiHpKYvE0hFoyrG0PaI9f2bYHjGpOLXax+FYBQi2uITDp08pJn0q9u3dT\nw/t7cO0hGh5wrjhjhzbn0GJncMYOCCEaXpjsb5SK0G8sq0QKvOLhYxNwAoodgHN3rOHVuXsv\npeG1ob0N8vAW+eigKBFfiD+oawNiKZmWI9e3E5PhjrDijB3anEOLHUOxQHh5Tmt4rwbXVPlr\nzv5MnK4mIP+xVjp45al+kucJ+csFbfnskDy8RQ4H5O5OIX85nMBSpu4IcBqHntkyeKsAejQ1\nvD+/LtuW9nnx4NjLPAPizdBXE4d5bbe4DflRYThanYgYSgYky0+LZNEeKasLxyviKI/h1h0B\nTuPMM3aKM3aAbvH1gWkfHZomZq2n3zvFCXNzK+cHVh8O1OrOFQ2+OCSl6WKF93OsU7x0ipdV\nhySfIh4+XiNOdwQ4jUPP2JkO/b6AKOStO3IOb8e7/V+pnHi1d6jP9OoOFdnqghKvY9jBZ0ot\n6xCGlcek2KGNObQAuTi5DUQcb23jpH9V/HlBYOt7/Z6uGneRpx/jUIhxvAXC47X+2eoow3Bn\n5BXOnP3gpppz3AanvnKpUmppZf055/nPDskD/+uzU+68JTfxhJBmcmbHmff+bl/jkb+1lFL3\nflXZkpd25lCsuHmrAJErscY/84PKmeKqiRuwrEfC3NzKeYFVNQGu7vpGhw/KJeub/1JKhvyt\n65F/1zbKhhpJ9Uj7004F/c+X0rmdTI8PYUi0EkOxYZOQc/NrL14tIra/dtvqlf/7s58OXPz+\nl+tfyXFH0Bmu3JKHX/h5fxGxA43bP19y9/f/bVhZwcYXpovI7bffPiyxRd3GmcVOUeyAaBBf\nf2Qu7SNx/Zb1SHguf/+ChlX1wUbduSKS5ZLR6afeadvy7n7J9h25+c5O+XWZNNgiIv2z5Ked\nJO7ohXp798pbh2U2g+CRxctQbLiYnk6lpaVHboydePlVY7sVjJ3ys08/+tlArblO4snoezzk\nmHHtP58/4eWfiEwXkUcffVRE6ivPfpAIKqptyc1bBYgmTQ3v2dfMbSsH/6V67GRvH7fh0h0q\nwnh8cn+3U//XJyiWW36RLSJyuFJ+uVNmdJH5g+Wx7rJln/ys4vjTf7xdLisULxPLIgtDsbp4\nMkY9dUnHtY/+pOmmv+bLH1wzIT8twe1L7jd6xkuf72+6v/Hwmu/PmlSYnxKfkj32intXHT71\nz866fctLs+L73fB7vy0iEmz4+sE7LuvbrcCTkN67dMZTK8qbHla9880bJ49qlxafmlN06y/n\nt3D1QsNUlrdb07/jTePer06qdWd6aWeesZM4ih0QlVKqGmatbJglcQcSB7/e2zMnfc9bdesa\n7XO8FMbhqg/Jo5Uyu48kGiIin5eJ2yvXZYiIdE6RexPlZztEMkRENu2UHZb8NkFnWjSHYqdR\n8e1d615cuK8xmOGSOwYOe6F24O+ffLUopX7ew/9+9ZC+eXs2j0yUW/qPeC3hwj89uTDH2vPI\nHTeOHiIVa3597Ah1FSsm9rygcvKvPvrLHU2z2B8oHfB41cjf/faZ4nRj5Sv/d9Oorv51ZTd2\nODyh99R17af+4emF2fau3/z79S+WHe7WXKS6itXLl7tFRIL+7Z+/cedzO256elGz4b/hpR1a\n7BiKBaJcalXDVSsarhLP/sTBC3t6Xk7f83bDehreSX66SdIyZPLR0dVkS/w10mCLW4mIbPGL\n1fRJaMtPdsltvcTF6bqI4+EaO3082Wm2be9sCLh3/vyP6w/8def8a/J9IjKoZOS7aZl3/f+r\n35r116e3NLyz/6lRyW4R6fPWvilXPb+rIZgmIiJ1FSsmDZ+yreS/Nx6tVofLHn7og71L9z9b\nmhInIgOGlDa+mv7T2e+Nv/PR96sTPlj+3MAEl4gMHZ6YlHVxs5F2vXdXScnxm8ldp4/tmXL6\nw775pZ05FKtcvFUAh0irarzm/apXF3q3vz+kaZTWpRz6F2mrfFUmnzbITzrIsbbWvaN4gvLv\nm+TNCnl+izxdLVd0FBH5YIvUJsiFXF0XcRKteFM587dwVKjfe0ApVeA29yx/xxXf/dr8I9eq\nKjPxe12Td8xds/PvKzypFzS1OhHx5d2ydOnS3KOTLb47cNJWSw58turYEkEH1y+27eDoVM+x\nya33rN9fteXLbS9u8OXc3NTqRMSTPnViavOrRXaa9rZ9VHXFzocm77h0YO/3q07dMPqbX9qh\nP1IMxQKOk1rVMGvlobkL4rb+a8hjdWPHeXvG9HZMP/laCvKk6wkd13LLn3tIaoP8frMsqZbb\nussVPgkG5KEK+f+6OPWC6qiWYiXqjhDT1v9xkyf1wgyXYdu2yEnns01T2XYgWB9UxhnX6+40\n+4W1n7xgb39q+mNrm+5xJXsNK6Xq8EnKVt+lTHXK8bNcZ39Dxqfl3/KrBdLw9Y/f39Oql3bo\ne52hWMC50g82XP/PQ68tiN/+wdAYPYe3eYfsCsgPck+9Py1BftZTXhksT/aWaSkiIgs3iC9D\nBjddtROQLw/Jl7XCIsSRIc2VpDtC7Ko/sPLGOV91v/0nIpJVMqqxZt1zu6qbvmQHDv9mw8GC\ni3rlT+lTt//1j45OmKjZ/Uxubu7iA0fWkHvg+xd6sy5afP/gf9xzQdNJteTOt9iByse/bvQd\nEf/jiyfc+uyWDlcUVe9+4vPqI8dpPPzJ3H0t2oMnUL8zYNte76l/wX7zSzvz01B52BIHcL60\nQ0dnWqQMW9TbNzet/I2a1TFxHd6v90hCknQ728Thxnr54yH534EiIjsr5L4tsjsgIpKZKL8o\nkg7O/PyPIqmcsQujQP225cuXi4gdqN+xZuX//uS/K3ImrfjxABFJ7vRfNxX+fnbJDPP/flCU\n3PDy/9y1si7rzQd6ZyT8bmr2nMnjbn3iwe/kuSsemX1PXcKlE1PjTlxzZOh/Lp74aN6MSx/f\n8cadnrTJD4/Pv6/kooRH7htWmLrkiXt/u7zs9TkdC3yPDfZ2GTfqusd+MTvX2PuH+25NO0P7\nOj55QqT2QNnzD93liu/+6/Mym33wmV7aoW9sH5O/gBiSerBu1nt1s8S1P2nI4p6euRl7/1G3\nxm8HdOcKjepDsqVRruguZ50L8dcN0qFAulhi23L3ZumSLf9bINIgv1on92yQuT3OfgSEUqqL\nYhc+h3f9saTkjyKilJWa3eH86fc/8z8/OHrBnPnox8vTbrv7nisn7qs3iwdPfPaDx0uT40Ti\nXlr19r233H/3rPF7A8kDx938zqM/PeWwykx+8vX7sgfffd8/ZzxYknPnax/X3HXrL2bPLK+P\n697//GfenT8+NU4k/40vXv3OTffdMG2MJBRc8cCcP7x69f3NhTxx8oTh9hadN/XVT/7Y1dN8\nVTvTSyvbbuFyKlElGKy//x5x5LcGoAX2J7mjuOHdu1ZGpMn0nOa/+uoa+X2VvDhY0r7xWpra\nw3LpGnn6PMkw5eA+mblJ/jZYUgwRkcoKmbGxmSN88+uird2UP/XPPZr9/e5wasmwtj2gPX5l\n2x4wqjn0jJ1hiMcrtTW6cwDQ49gobUXK0H8UR23Da9a8WvH6ztLqROQ3m2RQF8kwRY5un70/\neKTYHawVEeFSZN1SLa6xQ9tzaLETUb4Em2IHxLz0g0caXnnG8Fd6ul5O2rmyblPQjtrpA36/\n7PFLl05nedj+ClnulzlpR276kqS3S+5dJzfkiDTIU19LjwJJcOjkueiR4uKqIbQ9Bxc7n71P\ndwgAESNnX913ltV9R5J3ZY54pYc1N6lsRe1GW6Ltgo3yMgmIjIk/y8N+tlUmF4rvhOr2UB95\nbIs8t1XEktHt5DuMt+rHrFiEgmOLHfMnADQrd2/d7GUyW5LLMkvm9TDnJpZ9ULcpahpeQQd5\no8PZH/bwafuaWy75bpF8NxSZcI6YFYtQcGyxUz6f7ggAIlr+3ro7l8mdkrIjZ9S8YjU3Yce/\nardETcND9MuNy9AdAQ7k2GLHGTsALdSuvObucrlb0nZm5f+92IyIUVotk/pPXX4foZUf1/z6\nZMC34dhipyh2AFqpYE/t7D0yW5J35pT+vYc1N2HHipoNGhpeikv2nbo7ZDjsq5dkx/5SiEC5\ncem6I8CBHPseVolclArgHBWUV88ul9mStCNn1IIiI9zn8IanyqPb5LI8STvb3hJtaFmF7G+U\ngSnhe8XYlmIl+Eyv7hR6sOxcSDm22ElKqu4EAKJeu/Ka2eUyW5KPNbzltRtC/qrnZ8g7FXL3\narkyXzrFixXi8dHqgHxyUOaVy3c7SpJzfylEmLwYHoe98Yk2PuBfbmrjA0Y1x76HVTJ/dwJo\nM8ca3vbsUa91N0Pb8JTIfxbKvF0yb5fsbwzVq5z4cp3j5ceFMoiPzfDJY+YEQsPRxU4pdhUD\n0Lba766dvVtmS/LGgtFzi+y53q9W1W1v+5exlMzMk5l5bX9kRIYcLrBDaDi22IlpqoREu+qQ\n7hwAnKnbzuof7JQfSPa2nI4Li0J8Dg+OUxCXpTsCnMm5xU5EUlKFYgcgxDqU1zaN0q7vMHpu\nN3tu3Ja19Tt0h0KkY0osQsTJewUq5k8ACKPu26ofeLPmk4U5n2w8/0cyqrsnX3ciRK4CD2fs\nEBJOPmPH/AkAWvTYdrjHNnlA8ta17zav0J7j2bS+rkx3KESWLl56P0LC0cWOM3YAtCreXv3A\ndhoemtHJy8wYhISjix1n7ABEhuMNr1PRK93sl9wbvqThxbAsd2qSxYbmCAlHX2OXwRUMACJL\n8VdV979x+PPX8t7/asz3jZGd43J0J4IGjMOG2aJheao59baISJrLvGnjgXM47IFN6zftqm32\nS0qpe7+qbOFxbslNPBbJMMzkzI4z7/3dvsbgiYeqr1yqlFpaWX/Wozn6jF1GJkvZAYhM/TZX\n9dssP5V269p3n1dovxi3cWP917pDIUy6xBfojhBzfNnXLnzpxlPudH+7XV1enDT8d+MWrn10\n2Olfuv3224clult+qNySh1/4eX8RsQON2z9fcvf3/21YWcHGF6afw6GcXOzE7VZJSXZlSysz\nAITf0VHa/HXtC+cV2i/EbdhUv0t3KIQWZ+zCz4zrUFpaGoYX8tcctOJTHn300VY9y5PR93i8\nMePafz5/wss/EZkuIk2Hqm9xl3HyUKwwGgsgehRvr37gzZpVi9q9t33MPVZJe3fs7iXqeJ3j\nKXaRKNjw9YN3XNa3W4EnIb136YynVpQ33d94eM33Z00qzE+JT8kee8W9qw43isid+YmzNx1Y\n99hwX+YMEUlzmb/bvuN7M87P73StiMSbRtNQbLPPPSvDVJa3W9O/jx3qmLp9y0uz4vvd8Hu/\n3UxsR5+xayp2mzfqTgEALaWC9qANVYM2yIPScV37nvMK7efdX25uKNedC22JM3bhF6jfvnz5\n8hPvMd25Qwd1PvGeB0oHPF418ne/faY43Vj5yv/dNKqrf13ZzV29t/Qf8VrChX96cmGOteeR\nO24cPUQq1vz6fzbt7tw7//HRcz95ZETT01+++cKxV/5y2UMDjx/Rbmj2uafHq6tYvXy5W0Qk\n6N/++Rt3PrfjpqcXNfuN1FWsmNjzgsrJv/roL3dYqpnYji92/MkLIFo1jdLer9q937HLvC7+\nea5NZY0VukOhDXRmrZOwq97915KSv554T0Led6vKfnfs5uGyhx/6YO/S/c+WpsSJyIAhpY2v\npv909nuX/HbJ01sa3tn/1Khkt4j0eWvflKue39UQzPXGe5QyXN74+LimI+zp9Nv/vGHMiS+x\nf91/NP9c96njpbveu6uk5PjN5K7Tx/ZsZmWPuooVk4ZP2Vby3xuPtrrTYzt9KDaToVgA0U3Z\nMuyrhl+9Gdy4uPPSsjHftYbnudN0h8K5S7EScuMydKeIOUntf2Sf7MRWJyIH1y+27eDoVM+x\nCar3rN9fteXLnX9f4Um9oKmZiYgv75alS5ee3sxEpOv1PU65p+XP7TTt7WPBqit2PjR5x6UD\ne79f1XDKw747cNJWSw58tip45thOL3ZcYwfAKQxbhq2r+vXixk2LuiwtG3MnDS869UroojsC\nmuFK9hpWStXhk5StvitYH1SGpyVHSEo7de5qy597ovi0/Ft+tUAavv7x+3tO+VKn2S+s/eQF\ne/tT0x9be6bYTi92aelimrpTAEBbamp4vzqh4eW62VE+avRK6Hz2ByHskjvfYgcqH/+60XdE\n/I8vnnDrs1vyp/Sp2//6R0cnPdTsfiY3N3fxgbOvJyci5/zcQP3OgG17vacWmAe+f6E366LF\n9w/+xz0XNJ3POz22w6+xE9NU6Rn2nt26cwBA22tqeMPWyUNGlw+KB8zrUPuyrNvVwHV4Ea0n\nxU6H0ydPiEj2wCFdPUeKkCdt8sPj8+8ruSjhkfuGFaYueeLe3y4ve31Ox4yk303NnjN53K1P\nPPidPHfFI7PvqUu4dGJqnIiYSg5/taG8vFtOTvNj6xn9zvjcUxyfPCFSe6Ds+YfucsV3//V5\nzc8TGPqfiyc+mjfj0sd3vHHn6bGdXuxEVG4+xQ6AsxlBe9iag8PWyEOq8wfd+87rUDdHrS9v\n3K87F5rR09dJd4RYdPrkCRG5ccP+J7od31b+ztc+rrnr1l/MnlleH9e9//nPvDt/fGqcSNxL\nq96+95b77541fm8geeC4m9959KdNjx91z8U1995SNOSKym1PN/uiykw403NPceLkCcPtLTpv\n6quf/PFY6TztsMlPvn5f9uC77/vnjAdLck6JrWynb8wQWLrEv3iB7hQAEFZBJR90T5zXoe5v\nat3uxnPZLgkhsqd0UaY7prcyv/GJNj7gX25q4wNGtVg4Y8escgAx59go7YNmt3d7JM1td3h+\ncG2F/5DuXLEuy50a460OoRYLxY4t+QDELitgj1lVOWaVPGIWf1jom9eh7iW1dk/jQd25YhRT\nYhFqMVDskpOVz2dXV+sOAgA6mYFg0zm8X5pFNDxdmBKLUHP4cidNVA6btwDAEU0N71eLGzct\nKXx139hr4wanmD7doWIFxQ6hFhvFjsvsAOA0br894bNDf1xol73Zq2k9vAwrWXcohxuUdOrm\nBEDbcv5QrIioXM7YAcAZHRul/bm7+O2eCXNzKxcE11b6uYKljXkMd88E1jpBaMVEsTPyKHYA\ncHZxDYFJn1ZO+lTq3L3f7pXwct7B1/zrDtHw2ki/xEKXiolfu9AoJn7CVHauuNzSeOpmugCA\nZnkaAhd+UnnhJ6re3bvpHN7fg2tpeN/S4GTGYUVYdi7EYqLYiWka+QXBrVt05wCAKHPiObyl\nPRPm5la+GlxT5a/RnSsqDUoq1h0Bzuf8nSea+BfOD7z7tu4UABD1auLMN3r75mYfWOhfWxOo\n0x0nmqwb/mJ3XwfdKeBwsXHGTsRo3zGgOwMAOEB8fWDaR4emiVnr6fdOccLc3Mr5gdWHA7W6\nc0W6ZCuhML6d7hRwvphY7kREVAcmIgFAW/LWBSZ9Wvnn12XHsr6vVIy72j0owfTqDhW5BiZ1\nN1Ss/M6FRrHyQ6aSklVKqu4UAOBApzc8Hw3vNFxgh/CIlWInIqodVzYAQAgda3hb3+v3dNW4\nizz9PIZbd6hIMTS5l+4IiAmxMnlCRALvvu1fOF93CgCIITVx5rIeCXNzK+cFVsXyTAslas/o\n1zNcKbqDwPli6Yxd+466IwBAbImvP3IOb+c7/V6oHDfZ2yfOcOkOpUHPhE60OoRHrMyKFRGj\noJ1YLvE36g4CADEnvj4w/V+V0yXuYOLg13t756bvWVK/riEYKx/Io1L7646AWBFDxU4sl9G+\nY3DLRt05ACB2pVQ1zFrRMKup4fXyzM3YGwsNb1RKP90RECti6Bo7EQm8udi/5HXdKQAAxx1I\ndC9yesMrG7UgLy5DdwrEhNgqdsGvNjc+9lvdKQAAzdif5H6tt3dOWvnSunV+2zmLyneNL9g4\nYo7uFIgVsTQUK2K07yhutzQ06A6CU63ZV/GHj79YtXefPxjUnUW6pCRf16fHuI7tdQcBYkva\noYZrlzdcK94DiUObzuG9Ube20fbrzvVtlXKBHcIotoqdmKbRoVNw45e6c+AkCzZuufrvi6d0\n7XRVz+6WoXTHkVV7K2bMW/i9IQN+OGKI7ixALEqtapi1smGWxO1PGrK4Z9Q3vJFcYIcwiq2h\nWBEJLF3iX7xAdwoct7+urvjxv/501PDb+vfWneW4D78uH//CvMVXTB+Wn6s7CwDZlxr3aq+4\nOSm73qtbH7D1n9dvla9K5nX08kmCMImhdeyaqM5ddUfASRZv3poR7701klqdiAzOy7mkqOuL\nazm5C0SEjAP1N713aPEC344Phv2leuxkbx9LmbpDtUhhfHtaHcIpxoZiRYx2HcTjkbrYXQA9\n0mw/VNUtNVX/+OtpuqWlfly+W3cKACdJO3RslHZo0yjtP+rWRPJMi4kZQ3VHQGyJuTN2YhhG\nx866Q+A4WyQCLqtrhlISaxcqAFEk7VDDrJWH5i6I2/Tp8Icbx5R4igwVib/RLkgfrDsCYksk\nvg1CzSjsoTsCAKBt5Oyr+86yqjdfS9r82YjfNJ4/wlsYOQ0vznCVpg7QnQKxJeaGYkXEKO4p\nf39Zdwp8k7q6rSmPND/HxRdfVPHdC5r+7fdX/uadDxZs+/qLQw3dcgruGVl6VYHvxAf7G2o+\nLd9n+lL7pSee8kk/d9FrC7OG/WVgeki+AQBhl7u3bvYymS3JX2eMmN/TmptUtqJ2oy06z7uP\nTOmXYHo1BkAMisVip9LSVWa2vZfLpyKXafpmFheeeq8deOXLzb7kzCO37IYbnnzx5YOBSb16\nfa+rLF615pYXnqm4/vq7Mj1ND/hy3QdTF3203R8UkY4der16aWmRdaTdHa5ad8Pa8rfGsic3\n4EB5+440vJ1ZI1/pYb6cuOPD2s1aGt6EDJZMQrjFYrETEaOI9sLQAAAegklEQVR7jwDFLoK5\nXJlPT51wyp1rPl0wd2PC0zP6NN3ctGrRnAMN0ydd9ULvNBH5wdDu/X8/52dzV9x1+xgRqa/f\nMeK1fw0ZNv69wV3rK3fc/uKiKfPzNl5W1PTcR+Yt7zFo8iB3dMyqA3BuCvbU3rlH7pTUsqyR\nrxab4T+HNzF9WNheC2gSKRcihJnRvafuCGid+vqySW9vu2DsxaM9R9rYkyvKXa60v/RKa7rp\njst6vEdy1aE1r9T6RaR8+0f1VuqCkqJst9k+s+NjF+bu2v5+0yMrdn/w4H7vnBE5Wr4RAOGX\nv6d29rLDby1I3vjFyKbr8JSEfNJWflxmz4ROoX4V4BSxWuw6dRGPR3cKtMKf579R6+v+Ur+0\no3cEnjjcmJg8wHvCh3PxwGwReXpfvYjEeeOCgZpt/iN/mu/bW28aTZff2fe/8lnp+ZPamRE5\nFxdAKBUcbXjr1oz8RXD0AG8Ii9cF6UPCUB+BU8RosRPTNLoW6Q6Bltq/96PvbTt81/QR7qP3\nNDTsrgzaadnJJz7ME58nIuXba0QkK7f0PHfjyOf/8ec1G/+wcumF/9w7YmipiOzY/NZLDdkv\n9E0TADGs467af3+7esWCjI2rS0N0Du+izJFte0CgJWK12IkY3Vn0JGr81ysfp6YN/FH28cll\nAX+1iMQnnnSRqGn6RKS2OiAihulbfNMll/gO//zNN3+9evfVY6a+NjTTthtuW7hhxpRxifwV\nDUBERNqV1zSdw/ty1ZFR2jY5bLzpGZ8+qE0OBbRKjE6ekKbL7JQSVqCNeBV7Vj5+sOGua/uf\nfPcZ/8MFA0e+5PXlPHLpZY+c8KX1n73+kbvotc4JImLbjevL9+wVb/+cNHoegPa7a2fvltmS\nvD1vzGvF1lzf9uU168/5aBPSh/hY6AQ6xG6xU4lJRrsOwe1bdQfBWTz7+hpPXMEvck76iDSt\nBBGpO3zSPkKBQLWIeBOa/6kOBKqueKfsrqtuNEQq92+cOeftZZUNIpKQmPf7GVMuz4gL1TcA\nIKq0/7pq9tcyWxK35YxaWGTOTSpbXruhtQeZnlUaimzAWcXuUKyIGL376Y6As6ivL3tgT21R\n/5JTyprbnZ1kqIrygyc9uHaXiGS3b/6v5A//ubAiffAPs7wiwVnPvrkhpdcns2/bPfuq29IO\n3fbcwvpQfQcAolWH8iMzLb5cPapVo7QuZU3OGBHSbMCZxHyxUwzCRbQta1b4Rb4z8PSVhM3b\nElyVBz+sPWFIdvMXe0Tkmsxm5js3NJRf9tH+X07vJyI1NRvfqvP/YuqQHgnu5IS0H140sq6+\n7PnqxpB9EwCi27GG9+mG0T+S0h5x7b758aWp/dNcSeHJBpwipoudSk1T+Wd5f0Kv+R8dcLsz\nr/O5Tv/StSNy/P5Ds9ceaLoZCFT92xcHExOLZ8Q3MxT72uI3fJ3GXpXokqNzLNYd9jd9qbZ6\nv4jkmjH9XgDQEsXbqx94s+aThTmfbDz/h6q0uye/2YdNyxoV5mDAMbF7jV0Ts3df/87tulOg\necFg7cOHGlKyBjR7WrVrz4kzVz710qI5Rnnf4amuhZ9+9Emj+tWVJac/sqZ6040b6179btem\nm3FxBf/VzveLF+b7RvUtkOo/vPdRdv7giR52oQDQUj22He6xTX4oeevad5tXaM/xbFpfV9b0\nJSXq4kyKHbSJ9WJn9Bkgi5rfbB7aVR786FDQLuqR0exXlRH3xA0zOy355zNrP/tbo3TJzv/D\nFaNvyG5mHPbP85d17nthadzx6vYfM6/wLH378ZXv7rO9JcVD54zpf/qzAOCsirdXP7BdHjja\n8P7m2ZQal1rgydKdC7FL2TG/3kfDbx+yvy7TnSJ2PbjyX//6unzepVN1BzlVxAYDEMkqL7s4\na9BY3SkQu7iuSMzenK3RLNb/tgDgGEplFg7UHQIxjWInRh8WPdEpzjRr/X7dKZpR7w/EmVx4\nB6AVjE5dVfLps/iB8KHYicrIUnnNz2xCGJyXk/3Rrt0VtbW6g5wkaNv/2LJ1QE627iAAoonR\nn9N10IxiJyJiDhisO0LsGtk+v1921hXzF+06XK07yxE1jf67l7xTdrj6xr5sKAygxUzT7MUQ\nEDRj8oSIiH24quG/fyTBoO4gMWp/bd01CxYv217WPT3VrXv007btjQcO5iUkPH/xpF6Z6XrD\nAIgiRs8+rmtv1p0CsS7WlztpohISjcLuwfVrdQeJUWlez8KZ077Ys++LPXvrA4GzPyGULMPo\nnJI8vCDPZFcSAK1h9j9PdwSAYneUOWAwxU6vPlkZfbKaX7IOACKdx2N076k7BMA1dkcZPXuL\nt/nN4wEA+GZmr37iambzQyDMKHZHWS6zNxe9AgDOhTGAcVhEBIrdcUb/QbojAACij0pLNzp3\n050CEKHYncjo1EWlMQsSANA65uDhwnQrRAaK3QmUMgeyoB0AoDUMwzhviO4QwBEUu5MYQ0aI\n7nXUAABRxCjupRKTdKcAjqDYnUQlJjFfHQDQcubgYbojAMdR7E5lDhmhOwIAIDqo5BSjsFh3\nCuA4it2pjMLuKj1TdwoAQBQwBg0Vg9+kiCD8OJ5GKXPQUN0hAAARTynzPH5fILJQ7JphDBrK\nFAoAwDczCotVapruFMBJKHbNUAmJRq++ulMAACKaWVKqOwJwKopd85hCAQD4Bioj0+jWXXcK\n4FQUu+YZnbuq7FzdKQAAEcosGc1uE4hAFLszUMosGa07BAAgInm97FSEyESxOyNzwCAWEwcA\nnM4cNEzccbpTAM2g2J2ZZZlDudIOAHAywzCHjdQdAmgexe6bGMNGisulOwUAIIIYPXqptHTd\nKYDmUey+ifIlmP0H6U4BAIgg5ghWOUHkotidBfOeAADHqLwCo3M33SmAM6LYnYXKzmGDZwBA\nE+v88bojAN+EYnd25sjRuiMAAPRT6RnsS4QIR7E7O6NrkcpvpzsFAEAz8/zxYvB7ExGNH9AW\nUMoaM0F3CACATio5xRzAosSIdBS7FjF69la5ebpTAAC0MUeNEdPUnQI4C4pdyyhlnX+B7hAA\nAD1UvM8cPEx3CuDsKHYtZfTupzKzdKcAAGhglpSyhxiiAsWuxQzD5KQdAMQgt9tgDzFECYpd\nK5j9z1PpGbpTAADCyhxRquJ9ulMALUKxaw3DMEezNCUAxBKP1xo1VncIoKUodq1jDhysUlJ1\npwAAhIk16nyJj9edAmgpil0rmaY5bqLuEACAcFDxPnPEaN0pgFag2LWaOXCIys7RnQIAEHLm\n6HHi8ehOAbQCxa71DMMaf6HuEACA0FKJSeZwJsMiylDszoXRq6/RvqPuFACAEDLHXCAut+4U\nQOtQ7M6JUuaki3SHAACEikpJNQcP150CaDWK3TkyOnc1uhXpTgEACAlz7ESxLN0pgFaj2J07\na+JUUUp3CgBAG1PZOeZ5Q3SnAM4Fxe7cqYL2Rq++ulMAANqYNWW6GPx+RFTiB/dbsSZMEdPU\nnQIA0GaMomKjsFh3CuAcUey+FZWZZbIzNAA4hmFYF07THQI4dxS7b8saN1H52BwaAJzAHDRM\n5eTqTgGcO4rdt+aNN1mvGAAcIC7OHD9JdwjgW6HYtQFzyAiVk6c7BQDgW7HOv0AlJulOAXwr\nFLu2YBjWRZfoDgEAOHcqOcUsKdWdAvi2KHZtw+hSaPTorTsFAOAcWZOnsYEYHIBi12asKdNZ\nphwAopHRrcjoO0B3CqANUOzajErPMIeP0p0CANBKpmldPEN3CKBtUOzakjX+QpWapjsFAKAV\nzNKxKjNLdwqgbVDs2pTbbU1hFgUARA2Vkmqdf4HuFECbodi1MaNXH2ZRAEC0sC6+TNzMmYBz\nUOzannXxZeKO050CAHAWRlExf4rDYSh2bU+lpFqsXQ4AEc7lsqbN1B0CaGMUu5AwS0ar3Hzd\nKQAAZ2SNmaDS0nWnANoYxS40DMN12ZWilO4cAIBmqNw8s3Ss7hRA26PYhYoqaG8OGaE7BQDg\nNIbhmnGVmKbuHEDbo9iFkDXpIpWSqjsFAOAk5uhxKr+d7hRASFDsQsnjsWZcxYAsAEQOlZll\njZ2gOwUQKhS70DK6FpqDhulOAQAQERGlrMtmieXSnQMIFYpdyFmTpzEgCwCRwBxRanTsrDsF\nEEIUu9DzeKyZDMgCgGYqNc2aMFl3CiC0KHbhYHQpNAczIAsA+ihlzZjFtkBwPIpdmFhTLlHp\nGbpTAECMMktGG10KdacAQo5iFy5ut3XpFQzIAkD4qewca8IU3SmAcKDYhY/RpdAcPkp3CgCI\nMZbluvJ6cTETFjGBYhdW1oUXs4csAISTNXGqys3TnQIIE4pdeFmW68rrxOXWnQMAYoLRqYtZ\nMlp3CiB8KHbhprJzrMkX604BADHA67WuuJaLmxFTKHYamMNGGj16604BAA7nmn4568Mj1lDs\n9LAum6WSknWnAADHMgcONvoO0J0CCDeKnR7K57OuvE4M/v8HgLanMrKsi2foTgFoQLHQxujc\n1Rw5RncKAHAct9t17U0SxyYTiEUUO52siVOMTl10pwAAR7GmzVTZubpTAHpQ7LQyDOuqG1Ri\nku4cAOAQ5qBh5sDBulMA2lDsNFOJSdYsLrYDgDagcnKtiy/VnQLQiT6hn9G5mzVhsu4UABDl\n3HGuq25kBXjEOIpdRDBLxxm9+upOAQBRzLpkpsrK1p0C0IxiFxmUcl02S6Vn6M4BAFHJHD7K\n7D9IdwpAP4pdxPB6XdfczCACALSW0bGzNWW67hRARKDYRRCVm2dNn6k7BQBEE5WaZl17s5im\n7iBARKDYRRZz4GBz5Pm6UwBAlHC5XNfcpHwJunMAkYJiF3GsydOM4l66UwBAxFPKNeMqld9O\ndw4gglDsIo9SriuvY9l0APhm5uhxRt8BulMAkYViF5Hi4lzX36p8Pt05ACBCGYXF1gWsAAqc\nimIXoVRaujXrBnakAIDTqcws11XX8wkJnI53ReQyuhZaF7E3DgCcRPl8rutvE49XdxAgElHs\nIpo5bKQ5tER3CgCIGJbLuu5WlZGpOwcQoSh2kc666FKjqFh3CgCIAEq5rrjG6NBJdw4gclHs\nIp5puq65yWjfUXcOANDMmjzN6N1PdwogolHsooHLbV3P0AOAmGYOGc767cBZUeyig/IluG78\njkpI1B0EADQwuvewprHjInB2FLuoodIzXDfcJm637iAAEFYqv53rKpZ/AlqE90k0UQXtXVde\nx6cbgNihMjJdN94u7jjdQYDoQEWIMkaP3oxHAIgRKjnZdfMdXIUCtBzFLvqYQ4abYyfqTgEA\noaV8PtdNd6jUNN1BgGhCsYtK1gUXmqPG6E4BACHjclvX3aqyc3TnAKIMxS5aWRdebA4ZrjsF\nAISAabquvYmFiIFzQLGLWkpZ0y83+g3UnQMA2pRhuK68zihkxx3gXFDsoplSrsuvYR12AM6h\nlHXJ5XysAeeMYhflDMN1xTVG10LdOQDgW1PKuvgyc9Aw3TmAKEaxi36Wy3X9rUanLrpzAMC3\noJQ19VJz2EjdOYDoRrFzBJfbdd2tqqC97hwAcE6UsqZeYo4YpTsHEPUodk7h9bpvuYNJZACi\nkTVxqjmiVHcKwAmUbdu6M6DtNDQ0Pvl4cMtG3TkAoKWsSReZo8fpTgE4BGfsnMXtdt1wm9GF\nuRQAooM1aSqtDmhDFDvHcbtdN9zKPFkAkc+aNNUcPV53CsBRGIp1qMaGxr/+Obhxve4cANAc\npazJ08yR5+vOATgNxc65/P7GZ/8SXLdadw4AOJlhWJdcYQ4aqjsH4EAUO0fzNzY+/9fgmi90\n5wCAoyzLNet6o2cf3TkAZ6LYOV0w6H/lb4EPV+jOAQAibrfrmpuNwu66cwCORbGLAbbtf3Nx\n4M1FunMAiG1er+uG21luEwgpil2sCCxf5l8wT/jPDUAHlZDoumm2ysvXHQRwOIpdDAl89IF/\n7gsSDOoOAiC2qNQ01813qIxM3UEA56PYxZbgutWNzz0pjY26gwCIFSo3z3XD7So5RXcQICZQ\n7GJOcMumxqf/JLW1uoMAcD6jqIfr6hvEHac7CBArKHaxyN63t/HJx+x9e3UHAeBk5nlDrUsu\nF9PUHQSIIRS7GGXXVPv/+qfg1i26gwBwIqXMsROt8ZN05wBiDsUuhvn9jXOeC372se4cAJzF\nNK0Zs8z+g3TnAGIRxS62scQdgLYVF+e66kajqFh3DiBGUewggQ9X+uf/TQIB3UEARDeVnum6\n7haVnaM7CBC7KHYQEQlu2tD47BNMlQVwzoxOXaxrblK+BN1BgJhGscMR9t7djX/9k713j+4g\nAKKPWTLamjxNDEN3ECDWUexwgvr6xr89E1z9he4cAKKHaVrTZ5qDhunOAUCEYodT2XZg2Vv+\nxQvYVRbAWSmfz7r6JqNzV91BABxBsUMzguvXNL74NJfcAfgGKi/fde0tKjVNdxAAx1Hs0Dx7\nz+7Gp7nkDkDzzIGDremXi8ulOwiAk1DscGZccgfgdJbLmjTVLBmtOweAZlDs8I1sO7B0iX/J\n6xIM6o4CQD+Vnum6+kaVl687CIDmUexwdsHt2/zPP2kf2K87CACdjB69XTOvFq9XdxAAZ0Sx\nQ4vY1dX+vz0bXL9GdxAAOhiGNWGKWTpWlNIdBcA3odihxWw7sHyZ//VX2XwMiCkqOcWadb3R\nsbPuIADOjmKH1glu+8r//FP2wQO6gwAIB6NnH+vSK5XPpzsIgBah2KHV7Jpq/9+eC65brTsI\ngFByu62pl5iDh+vOAaAVKHY4R4GPP/TPnyMN9bqDAGh7qqC964prVWaW7iAAWodih3Nn76/w\nv/RMcOsW3UEAtB2lzOGjrMnTxDR1RwHQahQ7fDvBYODdt/1vLGRGBeAAKiXVuvxqo3M33UEA\nnCOKHdqAvXN744vP2Ht36w4C4NwZfQe4pl/OMnVAVKPYoY34G/1LFgWWvSX8RAHRRiUkWtNm\nGL376Q4C4Nui2KEtBTes9897kT0qgChi9D/PuuhSFc+CJoATUOzQ1hob/G8uDrz7NtvLAhFO\nJSZZ02YavfroDgKgzVDsEBLBbV/5575g7y7XHQRA84w+/a3pMzlRBzgMxQ4hEwgE3lvqX/K6\n+P26owA4TiUmWZdcbvTorTsIgLZHsUNo2eVfN778gr1jm+4gAEQMwxw+yhp/oXg8uqMACAmK\nHUIvGAwsX+Z/43W2qQA0Mtp3sKZfrvIKdAcBEEIUO4SJfagysOjvgU8/Yj0UINy8XmvcJHP4\nKDEM3VEAhBbFDmEV3LLJ/+ocu3yX7iBArDD69LcuvkwlJOoOAiAcKHYIu2AwsOJd/5LXpa5O\ndxTAyVRGljVthtGtSHcQAOFDsYMe9qFK/8JXg59/zMgs0Pa88dbYCebwUWKauqMACCuKHXQK\nbtnk//vL9q6vdQcBnMIwzKEl5vhJLFAHxCaKHXSz7eCqz/yvv8pGZMC3ZHQrsqZMVzl5uoMA\n0IZih8jQ2BBY/q5/6RtceAecA5WZZU2eZhT30h0EgGYUO0QQ+3BVYMmiwIcr2GcWaCHlSzAv\nuNAcPJylTAAIxQ4RyN67x//GwuAXn+oOAkQ2d5w5fKR1/njxeHVHARApKHaIUMEtGwP/WBjc\nukV3ECDyuFzm8FHm6HHMkABwCoodIlpw65bA4gXBrzbrDgJEBtM0zxtijpukkpJ1RwEQiSh2\niALBjV/6Fy+wd27XHQTQRymjdz9r4hSVnqk7CoDIRbFDlLDt4NpV/iWL7F1luqMA4WUYRp/+\n1pgJKjtHdxQAkY5ih6hi28HVn/vfXMRus4gJpmkOGGSOHq8yOEsHoEUodohKwa1bAm8uCm78\nUncQIDQsyxw42BwzQaWk6o4CIJpQ7BDFglu3BN55M7h+DRvOwjncceagoebocUyPAHAOKHaI\nenb5rsCyNwOffyKBgO4swLlTCYnm8JHm8FHijdedBUC0otjBIewD+wPvvR341/vS0KA7C9A6\nKjffLCk1+50nlqU7C4DoRrGDs9TVBT7/JPDeUnvvbt1RgLNRyuhaaI4oNbr3FKV0pwHgBBQ7\nOJFtBzdtCCxfxuV3iFDuOLP/QLPkfJWVrTsKAEeh2MHJ7L27A8vfDXzyodTX684CiIiojCxz\nyHBz8DA2eAUQChQ7xIC6usDHHwQ+WG7vLtcdBbHKsoxefc0hw41OXRl1BRA6FDvEELtsR+CD\n5YHPPuYEHsJGZWSag4YZg4YqX4LuLACcj2KH2ONvDK5dHfhwRXDTBq7AQ6hYltGjtzl4uNG1\nkFN0AMKGYofYZe/dHfhwZfCTf9mHq3RngVMoZXToZPQ/z+wzQOJZjg5AuFHsEPMCgeCGdYHP\nPgmu/YI18HDOVGaW2f88o/8glZauOwuA2EWxA47yNwY3fhn84tPAqs+lkYaHlomPN3v3MwYM\nNjp0YsgVgHYUO+A0tTWB1Z8HP/s4uGWTBIO60yASqXif0aO30bufUdhdDEN3HAA4gmIHnJFd\ndSi4+vPgmi+CWzaxES1ERCUmGb36Gr36Gp270ucARCCKHdACDQ3BzRuCX3waWLta6mp1p0G4\nqZRUo2cfo7iX0aUbfQ5AJKPYAa3h9wc3bwyuXRVcu8o+VKk7DULJMIyCdkZRD6O4l8pvpzsN\nALQIxQ44J7Ztl+0IfrkuuHF9cPtWBmodQyUkGoXdjaJi1a1Y+Xy64wBA61DsgG+toSG47avg\npi+DG7+0y3boToPWU0rlFRjdioziXkxuBRDVKHZAW7IP7A9uWB/cuN7essmuPqw7Ds7MMFRe\ngdG5q9G5q9Gxi3i9ugMBQBug2AGhYu+vCH612d62Jbh1i727XHcciBiGyswyOnY2uhYZ3YrE\ny84QAJyGYgeEg11ZaW/dHPxqc3DrZrt8F3vUhk98vNGug2rXwWjX0ejUReLidAcCgBCi2AFh\n11Af/LrM3rndLtsRLNth79lNz2tLR0/LqQ6djYJ2KiuHa+YAxA6KHaBbXW2wbKddtiO4c7u9\nc4e9fx89r3U8XiMnV+Xkqdw8o6C9ys0X09SdCQD0oNgBESYQsPftsXeXB3eX23vK7d27OKV3\nEsNQKakqO1fltzOyc1R2DufkAOAYih0Q8Roa7L27g+W77D277f377P0Vsr/CrqnWHSv0mjpc\nRqZKz1TpGSojU2VkqrQMTsgBwJlQ7IDoVFdnH6iwKyrsAxV2xT77QIV98IBUVUXlGiuWSyUn\nq6RkSUlVSckqOUWlZ6j0TJWWTocDgFah2AHOEgjYh6vsyoNyuMo+VGlXVcmhSrvqkNTW2HW1\nUltr19ZKQ31YI8XHq3ifivc1/UPifSo+XhKSVHKySk6VpCTlSwhrHgBwLoodEHuCQbu2Vupq\npK7OrqmRulqxbbuuVmyRxgbx+yUQsJvKX22tyMkfEXEeMYzjNw1DxXnE5RLLpTweMU2J84jL\npVwuiYsTr0/Fx3MBHACEDcUOAADAIYyzPwQAAADRgGIHAADgEBQ7AAAAh6DYAQAAOATFDgAA\nwCEodgAAAA5BsQMAAHAIih0AAIBDUOwAAAAcgmIHAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEo\ndgAAAA5BsQMAAHAIih0AAIBDUOwAAAAcgmIHAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAA\nAA5BsQMAAHAIih0AAIBDUOwAAAAcgmIHAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAAAA5B\nsQMAAHAIih0AAIBDUOwAAAAcgmIHAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAAAA5BsQMA\nAHAIih0AAIBDUOwAAAAcgmIHAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAAAA5BsQMAAHAI\nih0AAIBDUOwAAAAcgmIHAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAAAA5BsQMAAHAIih0A\nAIBDUOwAAAAcgmIHAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAAAA5BsQMAAHAIih0AAIBD\nUOwAAAAcgmIHAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAAAA5BsQMAAHAIih0AAIBDUOwA\nAAAcgmIHAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAAAA5BsQMAAHAIih0AAIBDUOwAAAAc\ngmIHAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAAAA5BsQMAAHAIih0AAIBDUOwAAAAcgmIH\nAADgEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAAAA5BsQMAAHAIih0AAIBDUOwAAAAcgmIHAADg\nEBQ7AAAAh6DYAQAAOATFDgAAwCEodgAAAA5BsQMAAHAIih0AAIBDUOwAAAAcgmIHAADgEBQ7\nAAAAh6DYAQAAOATFDgAAwCEodgAAAA5BsQMAAHAIih0AAIBDUOwAAAAcgmIHAADgEBQ7AAAA\nh6DYAQAAOATFDgAAwCEodgAAAA7x/wBnm+HfItk1yQAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips %>% \n",
    "  group_by(bike_type) %>% \n",
    "  summarise(number_of_rides = n()) %>%\n",
    "  mutate(percentage = number_of_rides/sum(number_of_rides),\n",
    "  labels = scales::percent(percentage)) %>% \n",
    "  ggplot(aes(x = \"\", y = percentage, fill = bike_type)) +\n",
    "  geom_col() +\n",
    "  geom_label(aes(label = labels), position = position_stack(vjust = 0.5), show.legend = FALSE) +\n",
    "  coord_polar(\"y\", start = 0) +\n",
    "  labs(title = \"Number of Rides by Bike Type\", x = \"\", y = \"\") + labs(fill = \"Bike Type\") +\n",
    "  theme_void()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8c781cb2",
   "metadata": {
    "papermill": {
     "duration": 0.032365,
     "end_time": "2022-07-04T14:56:35.762035",
     "exception": false,
     "start_time": "2022-07-04T14:56:35.729670",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Visualizing the top 20 most visited stations by number of trips"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 44,
   "id": "49081100",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-04T14:56:35.828459Z",
     "iopub.status.busy": "2022-07-04T14:56:35.827072Z",
     "iopub.status.idle": "2022-07-04T14:56:42.575293Z",
     "shell.execute_reply": "2022-07-04T14:56:42.573074Z"
    },
    "papermill": {
     "duration": 6.785323,
     "end_time": "2022-07-04T14:56:42.579096",
     "exception": false,
     "start_time": "2022-07-04T14:56:35.793773",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdZ1gTWRcA4DOZZNIJoUoTFSlWLGAXO3axd8Heu6jYC/buig27qGBdu65l7W1t\nWLEXFCs1lPSZ70fYGEOAxFX323jehx/k5tw7985MJidTCYZhACGEEEII/fex/u0OIIQQQgih\n7wMTO4QQQgghK4GJHUIIIYSQlcDEDiGEEELISmBihxBCCCFkJTCxQwghhBCyEpjYIYQQQghZ\nCUzsEEIIIYSsBCZ2CCFr9teocoQZWt35/BM6c3d+IEEQDQ68KiCmjJDK2z0Wiy22daxYu9ms\n9Sdog+CbEyoQBNH03LuCp7vUS0oQxNE0xXcYQ4GGuYkJgngk1/yg9rWKxA1zRzeqUd5RasNh\nUzb2rpXrtpqyYleG9kfdad/MOYzQ/w/2v90BhBD6gXgORUuW/JLQMHT28xfvCYLt5VXMMMyF\nS5rfJkNnX74Sz+YWrRrg8b36acS5uJeYJPQvaY0q5V1S/MVj8RePxf656sGOQT9ouv/PshKP\n1AvocOOznGBRRYoWr+xrI/uUePv84VvnDq1Yse3kjT2BNpQu8psX0E9Ysgj9cAxCCP0y5KlH\nAICkXP5JI6qsWwBgU3SKpRXvzAsAgPr7XxYQU1rAAYDtn7KNymlNxq7I1rrt9uxn6brC5JsH\nN2/efPJDTsHTXVLCFgCOpMot7bClhrqKACAhR/39m6aVHVxFAODXfsp9g/GmPL4woLYLANiX\nH6sv/OYFlLeimXMYof8feCgWIYT+AwjSpsPk34e4igAgbtUTXaF9pZZhYWENnfn/atd+hoxX\nM3e/y+JJG97YOaOMwXjtfGqtOnXTX0Sl3F248G3md5/urzOHkdXAxA4hhP4zOtR2BoD0u+n/\ndkd+trS7VwBA6BwmZBFGb7Eol0h/BwD48+X3T+y+Bzpb8aNOOkQoL0zsEELIEH1u29xWQeUd\nbUWUUFK8bI3B09a9U2r1b8eVcqBElQBAlhhJEIS97yZdOaPN2LE4vEGV0vYSIZviO3r4NO02\n/I9HGd+5c0oaAEReIt3L+BmVjU7tp9Wf1k0ZEOjjIeJyHVxLtO036V66ymRTry/u6Nm6rpuT\nlCuw9S4XOHjGmmc5xvlH6v0jw7s0Keliz+VQEnv32i16xV37UGgnGYY+HhVRu3QxMY+SOrk3\naN//8N0U/buvfm9GEESxVkeMaiWsqkkQhF/vsybbpKQCAMh6t/qdis77bvPTz7Kysn6v4QL/\nYAGZrJh3Dhe6hgDA0y1BBEH0eZp2I2ZSWXdbEZ/D5gqLl689ee3JQuceQv/Uv30sGCGEfp5C\nz7Fb3sMfAAiCcC5RLqh6gJRDAoCkZKsH2bnnjcUvmTluTC8A4NrUjIiImLn4BsMwtEbWr4oT\nALDYtv4B1evUCCwm5eomdPDzl9Oz/sk5dgzDMIyms5MAAMIuvNe9vj29EgA0OZuU+7biVadS\nUn3//dwkAMCzqxnmLISvz7G7sjSUJAiCIJyLla5Z1d9ByAYAoVv90x+/9PbzzSW2bBYA2JUo\nU6tOrdLFJADAIkW/PUzNr/O6c+xm96sIAByRc4WKvkI2CwBYbJvIE291MersB3wWwRGUkmu/\nqtvfVQQAK5MyTbasyrxhr1sW3g0XbjrwMlmRXx++eQGZrGg0hxkz1hCGYZ5srg0ADRb1JAhC\n6FKyQcuQWpWK6b5zWyy/l1/PEfouMLFDCP1CCk7sXu7tDgBcSeCBu8m6ElXmk9F1XQDAs8UW\nfVjeU+yTznQAAHHR9o9ScxMOWpO5tpcPAJQL/0sf9u2JnVb17umNOb0DAMCp2kglnVtslHbs\n7+4NABKvNudeZuhK3lzdUUrA0aUU+sQu48UqLougROWiTz3LbV6dvHpoNQCQlOyvT7fCPW0A\noMe6y/pOHJpUFQCcKq3Pr/O6xI4gyH5RJ1Q0wzCMVvl55ZDqAMARlEpUaHRhC0rZAUDE4y8J\nYs7nPQAgcOxYwJx5unuSM5V78TJBsL0q1ukfPnPnsUuf5RqjyG9eQHkrGs1hM9cQXWIHADVH\nb9Xnr+d/awUAfPuWBYwRoX8OEzuE0C+k4MSur6sIAEZd+mBYqM5JcOWSBIsXn6XSleT9+n8W\nM7J169YTTiUZVkx/EQ4ARZuc1JeYn9jlp8bARZ/VX/Z0GaYdGvkLCZtFsHhHP391CWfisV5G\nid2mWi4AMPjsu68mTKt7OAsBYM37LF2BN58DAE/lX3ZEqbJuT58+fc6i/fl1XpfYebba9nWx\ndmgJCQA03ftC9/rlviYA4NXxy5y5OaUCAFRZeLeAOcMwjPzz/egFE9s2rCKlvtyehsWRNug2\n9ubnL/sjv3kBFZrYmbmG6BI7gUNbFW0QRyvsOCyS61rwGBH6hzCxQwj9QgpI7DTyFyRBsPle\natr4rR0BzgDQI/6z7qU5d9NQpL5eP7LsNyd2zsW9ShryKm7PZwMA17b0iotfsgrDtCP1ySAA\nkJZcaNQgrc1245IGiZ22OI9NchwUeYZ5dWgZAKgTl7sbb5yXLQAUazrkyOUHyjzBJukSu7FP\n0ozKXx1sBACutQ/rXqqzH/BYBCWqpJ/VLe35BME+l640azIMQ6szbvx5YMHk4fX/PsTJtanw\nZ0pubvfNC6jgxM78NUSX2JUaeNkorLSA8w9vtYNQofDiCYQQAgBQZV7VMgxP2pRtfNkleNd3\nBoDXDwq6FlWT82rL8sjeXdvWrlLBw9mWZ+fZd9n9b+7Mkmt3nxp69uJzVsbeyGbK9IfhzdqZ\nuHwAIOv5MwBwrFHNqJxgCTo4CPQvtYqXLxUarTqZxzJ+vkW1qAcAIHso00VOOb21gbftq2Mr\nm9coI7Jxrlq/1ZgZSy88Si20862dBUYldhXqAUBO0iPdS7ag9AwfqSrr1rxXMgDISoo6lCK3\nLTklSEKZM3MAgGDbVK7Xamzk8tM3X76+HFvTnq+UxYd22FNAlX++gCxdQ2zL2VrUPkLfBT55\nAiGEdPJ9LBVBEgBAm7oeUyfl1voqdQa/yFI7eFeuW61KUIsuJX1Kly1xtkrVJd+rcwRL0Hby\nwYAFghuyS/uS5e0djO+sRnAIAIA8OQcA2HG+/IZnGDUAsHnFwkd2NjmhIlUddf+IPFueevzx\n+om9B4+ePH/x8vXzh/86c2jpjHEtI/YcmBNSUFfz9IFgUQBAsL70ucPsKuPbHd8WGT95Y1D8\njJUAUHtxWAFtTgjt8kyuidqx05ljvD+iaPXO+0/fcKyw+OO1BQDdTVb/TgvIsjWEIE0tDIR+\nMEzsEEIIAIASVyUJQpF2XAtg9HyxF2c/AoBr2Xx3wAxpNvJFlnrUjutLugToC2Wvrn3vPpIt\n7fg3MlX3c9TtwTixExUrA3Di85UbALWM3jpl8JRYNs/LkUOm0jlz5s4tPO8gqMDGXQIbdwEA\nrfzT6T3ru/eZemhemx2jsrs65nvP3oOf5NXFX+17S3twBgAkZfz0JR5NFvNYf7zaN5necHpM\n3AuSYx8V7F5ARz6ePLTnQ3btZTnD3UR53xW6VgYAgsj3uXDfZQH9kzUEoZ8GD8UihBAAAMnz\nCnUWaOTPxl/9aFiukT8ZfSuZYFFjfKUmKzLajF2fctjcooZJAwDInjz87p2UslkA8EahzfuW\n2H2UHYeV/nziyRSFYXnqvTnnM5RfXhOc8b62WtWnSdc+fd0APdTfy8XF5UCKAgByPm3z9vYu\nX220/m2S7xTcY+Jv3lKGYU6mKSB/O8cdN2p52bBLAFB3bGl9ke5orDLjwowzY//KVBWp+ZtH\ngY/rDWvqDgALeq42udf04cblAGDrN9Bk3e+1gL55DUHoZ8LEDiGEck1Z3hIAopqGHE3IPVlK\nk/1iQot6b5UajyZrqoi/ul6V0eaei0aQ4uI8Uqt6s/FBmv7d63uWNGxzGAC08u/51AGKBQDw\nMU2Z9y2S67GlS0lGK+9YI/TK22xdYVrCsZB6s4wiQzcNBIDFDRvF/fX+77FkxoQ3WHn3hdKm\nY4g9DwB40uD01y/v//Xb1ANfTkRLfnB42ssMgmCH5jmLztCr37sNXXdOl4HRmrTokXWWPEnn\nOzaJqu5sGNZhdhUAmNtmFQC0WxZc8MCrL9tYks9OOjWuXIfxFx59uV2wJufj/qhRdSddJwhy\n0taOhlW+eQHpK+Zl0RqC0L/j3756AyGEfp7CblBML+lWDgAIgnT3rRQUWFrEZgGApGSI4YPt\ntepkLosgCE7jdp37DD3FMMzlqXUAgEUKawW37Ni6ib+PM4sUdRkfoZtWz0FDcrQ08x1uUMwc\nC3IDAL/+Z3Uv896guKOfra7/bj4V/UsWIQiCa1tleU9v+PoGxb+Pa6T7CihWvkqDejW9HHgA\nwJVUPPrhy3SvzMhNtpxK+tdv2CCwfEkWQQBAw4g/8uv8UFcRm1u0hhMfALi2boGBZSUUCQBs\nXrEtD40vlVVn3+exCACgRBWMblZsUuq9LWWkXF2XBPbOJbx9Sni6UiwCAAiS33vlVX3kNy+g\nvBXz3KDYrDVEd1VsjTUJRkPAq2LRT4CJHULoF1LokycYRnt6y6zmNcvaiflsnrhoqWoDp65N\nUhrnHefm9fN0krDYlE+dXbpah5ePr16mKJ8iRVKnGs2777+bwjBMVFgdCY8ttPeQab5PYvdi\nTyMAYLElmz9kM6aei6BVvl89sV9lbzchxZY4ujXtMeZ2quLayLJGiR3DMLcPruzQqIqjVMTm\n8JxLlO86YvaDPHcbubR9QavalRwlQpLFFtu51gjuvHL/7QI6P9RVxLWpqc56tmh0aPliRfgc\njtTZs0XomEtvskzGz/OzAwDfPucKaNOQRv4mes64ZjXLuzpKKZIUiKXe/tW7D59xKsE4a/y2\nBZS3Yt45bM4agokd+hcRDJPvZT4IIYTQjzO6mGTpa9nqpKyBrsJ/uy8IWQlM7BBCCP0Lcj7F\nCZ27CBw7Z3+K/bf7gpD1wNudIIQQ+qmyZQouJ3N+65EAEDht6r/dHYSsCu6xQwgh9FMNcxNH\nvcsCAL5j7edvz7pQeH8GhL4b/DghhBD6qQIa1ypTyr9Z1zGnHpzArA6h7wv32CGEEEIIWQn8\nqYQQQgghZCUwsUMIIYQQshKY2CGEEEIIWQlM7BBCCCGErAQmdgghhBBCVgITO4QQQgghK4GJ\nHUIIIYSQlcDEDiGEEELISuCzYtH/NYZhZDJZAQECgUClUmk0GjMb5PF4JElqNBqlUmlmFTab\nzeFw5HK5mfEkSfJ4PADIyckx/wbgAoFAqVRqtVoz4/l8PovFUqvVKpXKzCocDockSYVCYWb8\ntw1EKBTK5XKaps2M/4aBUBRFEIRFS5DL5QJAdna2mVXA8oEIBAKCIFQqlVqtNrOKpQPhcDgU\nRTEMk5OTY2YVgiAEAoGlq6KlA+FyuQzDWLQqWjoQFovF5/MtXYIAoFQqLdo+0DRt0arI4XBo\nmjZ/+2DpQHRLEAAUCoX52wcej6fVai1agmw2W6vVWrR94HK5lq6KYOFA+Hy+Wq02fwl+w0As\n3cLrliAAWLqhs2gghX5VSSSS/OpiYof+rzEMU/C2icViWbT94vP5uo+9+VVIktRlHmbGAwCb\nzQYAjUZj/seezWbn5OSYPxWhUMhmszUajflV2Gy2RQMhCEI3ELVabX5aoJu95m+/RCIRSZJq\ntdr8jnE4HIsGwmKx9AMxs4pu7BqNxvxvIN16olQqLUrsLOoVSZJsNrvQD4Uh3dgtXRUJglAo\nFOZPhcfjWdQrDofDZrNpmrZ07BqNxqJVEQDkcrlF2weLBkJRlKXbEzabrVvhzYzXfwwtml0C\ngcCijYMuH7Jo7ABg0UB0SxAALJpdQqHQol7xeDxLVy0Wi2XRQNhstn4gFm3oLNo4fMNXlR4e\nikUIIYQQshKY2CGEEEIIWQlM7BBCCCGErARh/vkKCP18NE2npqYWECCVSrOzs80/2dnGxubw\ny5Tv0TWEEELILCElnXJycsy/UsrGxoaiKKVSmZmZaTLAwcEhv7q4xw4hhBBCyEpgYocQQggh\nZCUwsUMIIYQQshKY2CGEEEIIWQlM7BBCCCGErAQmdgghhBBCVgITO4QQQgghK4GJHUIIIYSQ\nlcDEDiGEEELISrD/7Q4ghBBCCP1fiF2+wMnNo0H7LnnfOrpt4x9xWz+8funs4Vm/beeQ3gMJ\nlum9Y8vCh3xIfDVv1xF9CcMwUqlUq9UahrFYrI8fPwJAenq6t7e3yaYcHBwSEhJ0/z99+nT2\n7Nl37tz5/Plz6dKlb926ZbIKJnYIIYQQQqBRqw9tWlu3dYe8id2KiJFn9+8qW7Vm1YZNn9y5\nGbNo1suE+6MWr8rbyLWTxy4c/t1GamdYmJGRodVqq1evXqRIEX0h6++8kKKoNm3aGMZzOByC\nIHbv3l20aFFdyYcPH+rWrQsAXbp0kUgkp0+fzm8U/7HE7t6puF1Hzz1J/KAlBU4e3nWadurU\noJTuraz3bzN5Ti5S6p9P5R82dX1kj8gXGbr/CYIU2TqXr9YwtHcbFy5pTnVV5oM1C9ZdTXgn\ncivVbVR4nWLi/CIZRnnpQOyRs1devP2kIbjOHl7V67fs3Lwah/i2jhdie5/ONxrOWdqlhIme\naGW9OoamqumhW3YFS3k/ZPIIIYTQj6FRq58/uBu7bL5SIc/77pM7N8/u39Vx6JhOQ8foSmYP\n6HHp6IG+U2aLbaWGkdky2dLwwXlb0D30fMmSJSVLlsz7rkAgiI6ONiyxsbFZv379/v374+Li\ndCUDBw5Uq9XXr1/39PQEgKVLl+Y3lv9SYvf6YOTkDfENOvZu38ebS2e9uHs5JiricdbSqSEl\nAODC9HGHK0xdOcjvn0/onzfFkwZPHVsXABit6nPio4NxcaNuPVq9epKUXXjOtS1iToJv9+Vj\nqjw5snDpxPlBO2aZrMNoM9ZPHn70KSe4TYvW3YuR6sxXD/76fcPcC/E91k5u/2NSu3ylPYxO\n04Ajhzyw61XwgO+wCBBCCKGfQ6VQdK1UkqHp/ALWTB3H4XLbDxqhLxk2b/mFQ/u0Wo1hGMMw\n08LaObq4ZWWkG7Vw9+5dALCzswPzZGRkjBo1avHixVJpbuL4/PlzgUCgy+rAYG9fXv+lxG7T\nzjuu9acO7+ave+lXrlIpwcvRMfMgJDq/KlplNskV/tBemZwEi+NctmzZ3Bf+lWrV8R/Ya3Lk\nzudLupUstO6599nVJgU52gptWjRR7Vwi0zIS0kSednv95KPPRNPXLva3z91DFlC9doNq7mET\nt6551HCQn22hEzIxFpohWd+SE17ecIfv2GZwsQtzzmyiB8zHS3IQQgj9V3AoatqGOABQKuRz\nB4XlDUh68czFswRJfkmZbKR2zUP7GoXtX78q8emT6LPXR4c0NEoTT5w4wWKx+Hz+gQMH3r9/\nX7Ro0eDgYDY73xysU6dORYoU6du3b1ZWlq6kRIkSV65cSUlJsbe3L3g4/6XELkfLKNM+GpYU\nbTpkkkcqAxDds+ORVAW8H9fhUs3d28Z3bRPSNXrDp41Lz9znx8RMZjSpe9dHn7/9OClN5epV\nvnVY/wZ+UgAwWb7266byq2s0iYJ7TtmUGVHdKfJoLHSbUmjd7uXsYtedHji18bHoHZKS7U1m\ndYw2bfHxN6WHrNRndTrSsp1mTioKVO4xX6MJqTIebVi55crd5zIV7eBasnGXoR1qugNAWNvW\nLZbPSpg7/2aSTCR1rta017BO1QFAkXwnelVc/KOncrZjrVZhtnn7AQAAWmXi5lcyv5HBPsWV\n6mGHd77P6eIiAIATY0K3KNpuX9k6d/F93NO539bwmD1BEiq/uYoQQgj9ZASLVa56LQCQZ2fl\nfVeenaVRq30qVPojdsvhres/vU10K1Gycp2GnUeMNUz1PiS+2rFsXr+pc2wdnPI2cvHiRRaL\nVbZsWZlMpitxcHCIi4vz9/fPG5yQkHDmzJlbt24RxJcEYPPmzXXq1KlRo0a/fv1sbGz+/PPP\nU6dOmRzOfymx6xNSbmxsVO8xl+tWD/QvX76UtwfFKxEQUAIA+kTHFBna83i5Ccv6555yd2nF\nDP+gsLlhXgAQM2HkcXmZ/v1Ge9gQj64c+S1igHbV5mBXgclyo6byq2s0iUJ5NHVRX7gh0zI2\nJFFw3foRE2O7jx04eIfQs8ni+d1NtiZPOZKppVtVdcz7VoWq1Q1fGk5oy7gZl8W1R0zpZUdp\nH5zbtH7hmKDAWGeKBQCHJ86v32NYr/Jub6/tmrthrmO9uE528mnDIt86Bg4cNc2WST2wYdn5\nFLmrqc58urJOzbD7VHMSUT2cqGNntjzqElEJAAL7Vlw5Yfs7VUtXigSAp9tO8h1aBkmogucq\nAKxaterKlSu6/0Ui0YoVKwqYsSwWSygUCgSCAmIMkaRZZzoihBBCAKBWqQAg4ca1P/ftrN64\nRfXg5gm3/toXvSLh5rXIbb/rci+tRj2pa2sf/0rBnXqYbCQ5OVmr1Q4fPnzEiBFqtfrgwYPD\nhg0LCQl5//49n883Cg4LC/P19a1YsSLDMLa2uTtVbG1tR4wYERERMX/+/II7/F9K7Hy7TF9R\n+sKfF6/dPrVrz9a1JE9SNrBW+7Awfycem+JSBMFiU1wuRxec4dyvc8PyAKBIObD3ScbsHaPL\nCjkA4OVTVnutW9zqB0Ej35ksD44M1DeVX93gyEDDSZiDYytmGCZZTduQZAF1tYo30XMXKl0r\naZNu+rau58RhZT67m8Qu4VdM9FWYMgkAilBfcpSZ3drfyFTp/hc49Yhb38FoPgCAU+MOwxq0\nCJBQAOBepOO6gzNfKDXOFAUAwmrhYcH+AOARMqr49guPPis+v1r5WMFbtCC8JI8EAN9S/E7d\nZ5sc2rGYpyL3bsV5JAC/l6/tohvrFMwqHkHY+vS1I89tvJc6ubIjMOoN1z6XGtaygCWim6sA\n8O7dO/3V3VKptICd1TqYqyGEEPpBdAdV379+GRmzr1RAVV3h4lEDLx87+PTuLR//ygCwZtp4\neVbm5HXb82tky5YtXC63Xr16upcDBgzgcDh9+vTZs2dPr169DCPj4+Nfvnx5/fp1ACAIQv8N\nOHbs2EWLFo0ZM2bYsGG6PXb5Teu/lNgBgKd/7V7+tQFAnpoUf+Pa4d07pw+OX7Y9yjPPBacu\nDTx0/2S9vcUwzMQu7QzfFWqSst7eNlkOEKh/mV9dXYx+EubQZGQRBOHAYRl172tM9KjxN1xa\nrV/eKfP6xv5zw72Kr5esXRQjHrNh+ld7a0muOwAk5Kj1Aw+bMrOthgaApBMrNj00MR8AoFXr\npveuXd6XmPTx44eXCdcNGyzSyFP/vw3JAgY+n0/iSYN1WR0AUOIqlUWclDw9VmXeOJAs9+ld\nLDExEQBsGhTV3ru96YVskJeEIMX9ytit2vIXVG6e+XZ7opo/uZoTFDZXASAoKMjZ2Vn3P4/H\nk8tNXKOkx+PxVCoVnf9Jr0Yo6jtcN40QQugXQXI4AFCkaDF9VgcA/afNvXzs4L61KyJWbX4c\nf/PMvp0TVm/hC0X5NdK4cWO1Wm34ddaiRQsAiI6O7ty5s2FkWFiYRCKpUKECAGi1WpVKBQBZ\nWVlLliypWbNmZGQkANA03a7dV9+hhv4ziZ1KdmlR1LnQ8PHuFAkAfDu36sFtA2r5tus8Yfvr\nzIk+xieACcS5Q2MLKYIU7ozdZPguweLIEx+YLDd8mV9do0mY4+0f7zmiyjZ/nzBnsq4q8+qx\npKypC9ryWQS/ap8prR/PmjRBoJFVmO5uFMm3byEmd/1x4l2TTrk3H/H0K637J2WrwjBSPyFa\nnTxr8NAnwtKNa1YoE+jXqFWd0cNn6sM4/Dw7vfJcRSFhs/Imdm+PbmcY5vGG6UMNCq9tiB80\npw4AlOtTPXNkzCd101ebLtqVHejEYUFhcxUAgoODg4ODc7tN07qrxPNDUZRSqdSt+ubA3XsI\nIYTMxxcKCYJwci9qWCgQiwHgU9IbAHh4/SrDMHMGhhpVbOfnKrF32HjpLgDQNK1UKpVKpf5d\n3f4IuVyenZ2tL5TJZPfu3RsxYoTuXY1Go3v39evXNE337NlTHywU5ntB5H/m+kWScrl+7drO\nW1+lFlpFOgAUEXHyqQQAIHBuDHTO8VQtLxd3x+xpK898yK/cnLqWdl6d9Wj5pY/uTboWEkdr\nAOC9PPfy6UqhM3zJjzmk09ByxhdIE6RkTD23V7vn3Pj8VRqX9fr0yifGV1nnvvV2w81PqqjF\nU3p0aBVUvbKH1MQpooacgtwU6SdfKnJvk61VPL8sU+YN23Hwjdiz50EDEwKc0hPWp2kYABAX\nDfPgKDfcT1p3N6XegIq6Kt9rriKEEEI/Gkmybezsk148MyzMSk8HAN1x2FKVq3QaOsbwj8sX\ncHn8TkPHhPQZBADpyZ+qVq26d+9ewxbS0tIAoGHDhoaFu3btYhimX79+Rn3gcDgA8Pz5c3M6\n/J/ZY0fySkxo6Tt7/ghu+85VShUXcon09y+OxmwTF28a6iIEABYB8o/v0tJcpVIbw4qUOKBv\nBfst42fx+rf3cxPFn9x4KCFl2ngnSuRmsvzrpkzXLbS3tPqT7iwxhlYnJz46uGNXpm3lhV0K\nucyCktSsYbdi28SFNoPaO0Ha+f2bn5ElfODFooNPp7T2MQquOGR20IuhswcNaRjStIxXcQmZ\n8/Lx7cN/PG7c1O3kdRONc8TeDHPp9/P3mpdzTk18sGdjDAAkvk+vKjY9HIcKg32o/lMmLB3c\no5kdK+Po1pXiPMe7FcmH/spU1Z9Yz7CwfN8G9MDY6Acp4/0dgKD6BjrOWhoJnDLd3HP3Uee3\nRAqeOQghhNC/omXPAduXzLl94UzF2vUAgKHppWMGA0CbfkMAwK9SoF+lQMP447FbGJru+Pfd\njMW20vv3748ePbpRo0ZcLhcAtFrtsGHDCIIwyuHWrFkjFAqdnIy/EIsUKSIQCFauXNmnTx/9\n5RT5+c8kdgBQpe/8aUVjf//j+NIDn+QaQurkXqFu91HdW+pu+lsmpKpy4xCRsmMAACAASURB\nVIpB4UFxG0YZVWwxdakyOmr3mvlpao57ifKj506qIOIUUG7YVH4xBVOk/TF+/B+Q++QJx3LV\nO4zq3d6MuxOzRi+buSlq48bF0+SE0LdS0IK1obYvY3pNnrDXb0O7r29NR5DSkYtXl9+z49jZ\no+d+T2PxJd7+1SeuXurBXP4sN3G0ke/QdnrPT+tiFhzJIYt5+3edsFK6ZGjc+KGVY2NNdoVg\n289cMWnVb1uXz5kEPIegjuMHXlsS83XM021HSV7RAaW+6pjQtXMF0d57G67Aby0BwCe0kapf\nTIkuEYY7h79triKEEEI/X6te/Y/v2DS7f/eazUKKFC0Wf/Hss3vx9dt1dvbwLLwyAMnmLFu2\nbPDgwRUrVuzYsSMAnD59+tGjR+Hh4YY3pVOr1UlJSV9ugmvYAkmuWbOmZ8+e/v7+nTt3trGx\nuXr1qv72EUYIhmG+aZgI/QyFnmMnlUqzs7PNP8fOxsbm8Mu85woihBD61cmzs7pX9mncObT/\n9Hl539o4Z+qNMydzMmWuxbyCO/do2q2XyUYAoHfN8gxNb7pyX18SUtLpwIEDy5Yti4+PV6vV\nZcqUGTBggNHzYZ8/f16tWrVZs2YNGDDAxsZGdwZ5ZmamPuDq1atLliy5ceOGUqn08fG5d++e\nyaljYof+r2FihxBC6L8upKRTTk6O4cUTBTOZ2BlycHDIr+5/5uIJhBBCCCFUMEzsEEIIIYSs\nBCZ2CCGEEEJWAhM7hBBCCCErgYkdQgghhJCVwMQOIYQQQshKYGKHEEIIIWQlMLFDCCGEELIS\nmNghhBBCCFmJ/9KzYhH6Ltr6uhRwO++8eDwej8dLT083M57D4UgkEgBITU2ladrMWvb29jKZ\nTK1Wmxlva2vLZrMVCkVWVpaZVfh8PkVRGRkZZsZTFGVjYwMAKSkp5j+ixsHBIT09XaPRmBkv\nlUpJkpTL5dnZ2WZWEQgEJEmavwS5XK5YLAaA5ORkM6sQBGFvb5+WlqbVas2sYmdnx2KxsrOz\n5XK5mVWEQiFBEOYvQR6PJxKJGIZJSTH36SksFsvOzs7SVVHXK4VCYWYVsVhM07RFS1AgEBT6\nXBlDJElKpVJLV0UAyMzMtOh2/xqNJicnx8x4oVDI5/O1Wm1aWpqZVdhstkQiMX8J6lZFAJDJ\nZOY/YkcikahUKvNXRZFIxOPx1Gq1+dsHDocjFostXYIAkJGRYdGGTqFQWLQqcrlclUolk8nM\nrMLlcgUCgUVL0NbWFgAs2tD9TLjHDiGEEELISmBihxBCCCFkJfBQLPrl7Hv83sIaagBzj/rl\nxn8w91DOFykfLIz/bPEkwNzDH1/i35t7cO2LFAtnb8onyydh7tGiv6kBzD3c+UWypQP5aPEk\nUsw9vv83S1dFAAD4bOlALFwVASDly/G4IHuOxdURQt8P7rFDCCGEELISmNghhBBCCFkJTOwQ\nQgghhKwEJnYIIYQQQlYCEzuEEEIIISuBiR1CCCGEkJXAxA4hhBBCyEpgYocQQgghZCUwsUMI\nIYQQshL45AmEEPql5bw4HbM0+v79hx9TFY5e5YM6j+rYsRahf5tRdytbXKGlDasQLN6ehy9M\ntuDh49+h15ixPYIIg/j0hD+mzY46cfWuTE15+dcYNHnhsGaldW8p00+5e3cx2TGBQ4fXCau+\n30AR+iVgYocQQr8u5adDI1oPzgCHmm3a1rRhnp7Zu2tqx/tJeyNHVdcFqDOvKLS0bWBwWSf+\nl2oEJ78Wki/sWzi63cXEAwcn1dAFpD3cVK3hBBnLpU2Xnm6U7M89u0e0rJBy8tXUukUAgEUV\nadOmjXG3GPXhg0eERcv+yKEjZJ2sIbGb0qX9nWxV+9U7Qt1EhuXxC/tPvfDBs9WiFX19AKBV\nq1at18X1dhbk105Y29blV8SMcRMblRda8Z9jtLJeHUNT1fTQLbuCpbzv1awq88GaBeuuJrwT\nuZXqNiq8TjHjoRl0IPPc/p1/nP/r5btkLSkoUsy3dqNW7er7k0R+NQAA1Dn32nWeNDtubzlB\nIU+HvHcqbtfRc08SP2hJgZOHd52mnTo1KKV7K+v920yek4uUsnx8CKF/6mb4tDQ1M+zE+Toe\nYgCAURNXN/A/vT7s85AER4oEAHXGaQCoNHPZkOK25rQQNGvaqMqld6zo9mbsMw+KBICIDtMz\nCPu4a5fqugkAYNzEIX2rNJjfoVfEp2MAwBGUjY6ONmozYWOXg0eLrI3r8+MGjpC1spJz7AiS\nuLD1yVdFjGbT9WSS+JKYNG3a1I//LYnsN1c0X9rD6DQNOHLIA7tefcdmt0XMSXBsvHz96rAq\nyhUT5zP5hNGqDwtHDly+869i1VqOjpgWMXpgDS9qX9TUoXNjNfnVscTrg5GTV+x2rNxi4oz5\nsyaPaVHRYX9UxMwDucdxLkwfNyvuRcEtIIR+kPuvMkl+mdysDgBYvIYNXRltVrxMqSvIepQA\nAJXz/8GZt4XuTd1obdbZdCUAKFIP7fuUU7z9Ol1WBwAcYcklq4MUqScWJspMNqiSXWk35Uz9\n2btrS7nfZYwI/VKsJLFzrlc++dZ6FfMlDcl+F5tIO9SRfNkuDBo0qIbNt+wW+uaKelq6kPzo\n8oY7fMc2gyvafziziS441BLn3meXbx/kaGsf0KKJKuuuTGu6G3/Om3T1o+Os6KgBXVpWqexf\nuUqtLv3Gr507IOWvuOkHXv/zbmzaece1/tTh3Zr7l/HxK1epWbehc0JL3o6Z989bRgj9Q6U8\nRVp5wu1Uxd8F9F+XPhCkTRlR7kYv7eJHgkWV56VdP7b7yOaN509dyvr6fLu8LRw/+4HFttFt\nNpWyKwDgVMfVsIq0XE0AOHHmg8kubek1QO7UYXOY7/caI0K/FGs4FAsANp6h5IVxMYlZfTxz\nfzU+2XbBrlxf/stF+pj2ISHNomN7Owu0isSYqI1X7z9KVnD8KtfrNyzMk0fqYmhN2pa5kcdu\nPWUJHKo16T28S3WjipuXr79y96Gc69Ks5+hHq8e6L90yoIhQlfFow8otV+4+l6loB9eSjbsM\n7VDTHQDC2rZusXxWwtz5N5NkIqlztaa9hnWqnrfzWmXi5lcyv5HBPsWV6mGHd77P6eIiAIAT\nY0K3KNpuX9laF5bzcU/nflvDY/YESShGk7p3ffT524+T0lSuXuVbh/Vv4CfN23L3cnax604P\nnNr4WPQOScn2ElMHVjU5j1beTK48bk4Z26+SV4lfs4igg7NilzOtlxAA+Y1RTyVLmDZkSk5A\nryXDmxtNJ0fLKNM+GpYUbTpkkkcqAxDds+ORVAW8H9fhUs3d28abWLQIoR+pWtTaE626zm/W\nvFmPdk5i5umZHedeKYNnHnbl5X47fLyZAgR3fO1q7zLVuhLKvuyA6J11y0hNtrD7YuzO54qe\nS4578dgAwOYVB4DU68nQtph+ojnv7gFA8uVkaOVg1J+0hGUTz78P/3MGVeB5IAih/FhJYgcs\nbt9KDqs2P+wzrSoAAKPeePNztYWl6Gl5IhnNihHjrvMDho6YJiXTD635beIY2L6yt+7Nm5FT\nmnYasqiX25tru+ZumOvSaGcHB/35wsz68Ann2ZVHjJvNUybtWDHuaY5al9psGTfjsrj2iCm9\n7Cjtg3Ob1i8cExQY60yxAODwxPn1ewzrVd7t7bVdczfMdawX19nJ+Fy9T1fWqRl2n2pOIqqH\nE3XszJZHXSIqAUBg34orJ2x/p2rpSpEA8HTbSb5DyyAJBQAxE0Yel5fp32+0hw3x6MqR3yIG\naFdtDnY1brl+xMTY7mMHDt4h9GyyeH53k3Mu+93vWobpWtl48woAPp0qas4euZ6pqiKmTI7R\n7u9IVeaj6UOmmszqAKBPSLmxsVG9x1yuWz3Qv3z5Ut4eFK9EQEAJAOgTHVNkaM/j5SYs619K\nHz979uzTp0/r/re1td27d6/JnusQBCEW53vuoMl484MRsnocSUCr0PrzFh4+sGKWrkTs171x\nsLc+4HaaAmi5R2jUjLAmQk3qw1Obfpu5dlX3tr5XTrrw2CZbsPfvPzK0mr0tBQB20uH+oukP\nd4x8u/COv4QCAFr1LqLvCQBQJqvs7e2N+jOtZ5TUN2JBXW8wxc7OzmR5AUQikUgkKjwOAAAI\nguBwOHw+v/DQv+MBgCTJvAMpuJZF8TqWbujYbLZAYO6p4bqBcDicnzAQGxsbiyYhFAqFQqH5\n8QBAUdRPGIhEIrFoEpauigDA5XIpysQBQ61WW0Bda0nsAHxDa6eOWC+nq/BZRNa7HW/pIouK\nijbnCct8u+nMB82c2JFlBGwAKDZLFrn4fJqGkbIJAJD6jw5r5A8A7iGj3LadT0hVwt+JXc7n\n3UffZE/bPqySiAPg6zn9VY9R+3VvOTXuMKxBiwAJBQDuRTquOzjzhVLjTFEAIKwWHhbsDwAe\nIaOKb7/w6LMC8iR2x2Keity7FeeRAPxevraLbqxTMKt4BGHr09eOPLfxXurkyo7AqDdc+1xq\nWEsAUKQc2PskY/aO0WWFHADw8imrvdYtbvWD4MhAw2a1ijfRcxcqXStpk276tq7nxGFlPrub\nxC7hV+yrFUv+MYsgiGJ/77M0xBYUA4A3Sm0Vsekx2pEAACrZoxnjZn4q3WOtqawOAHy7TF9R\n+sKfF6/dPrVrz9a1JE9SNrBW+7Awfycem+JSBMFiU1zul8sv5HK5TJZ78g1JkoWmYpirIfTN\nbi1oM2/j9cBec3r0aOlkQz+/vC86Ys6EFknLTm514pIA0GhedF2qmH/VEgAA4Fax4+TZ5INh\nk86tOpoY2bZE3hbcX50a1HNCjbKJ954fLs4jCVK4b30fny5rqhWvEhbW3JGVdnpnTIKoNMB1\nks82+vAmx09c9SJj1PXR+X2ov+HDbmmVb9ue/ISp4ED+36byLw6k4KasJ7ETuXb1ZO3f/Eo2\nqITkydaL9hUGcE2NPOVaAkdUUZfVAQDPrvHs2Y3177o18dT/b0N+dQJi2r1bJM+rkig3/xB7\nNAfITexatW5679rlfYlJHz9+eJlw3bBWkUZfN5jnJDdV5o0DyXKf3sUSExMBwKZBUe2925te\nyAZ5SQhS3K+M3aotf0Hl5plvtyeq+ZOrOQFA1ttbDMNM7NLOsB2hJgnAMLFjokeNv+HSav3y\nTpnXN/afG+5VfL1k7aIY8ZgN0/0NK/KcRAzDvFZoi+fJ7bSKNwDgziULHuPaUdNpHivr5asC\nTiT09K/dy782AMhTk+JvXDu8e+f0wfHLtkd5ck0klCEhIZUqVdL9T1FUVlZW/g2DQCBQqVQa\njaaAGEPm/xZHyOppc+IXbr4hDZgXMT5UV+IXPGCqY2KfLpuW73o+u4cPAJSuXd+ollOTcTDp\n3Pvdr6Btibwt+Dfuv3//E6+Ga7uuuH1ykB8AODVf8Fdcickrdx7avFTGktZuOe52ZIkSnj34\n7jyjT/e6sHU8SZ2pvvy8n3oWiyUQCLKzsxnG3Eu6dHtHFAqF+dsHHo9H07RKpTIznqIoiqJo\nms7JyTGzCovF4vP52dnZZsbrdlmBhQPh8/kajUatVpsZz+VyORyOVquVy+VmViFJksfjmT8Q\n3RIEALlcXvAOJ0MCgUCtVps/EB6Px2azLRoIm82mKMqiJagbSE5ODk2be1b8N3xVkSSp0WgU\nCkXedxmGKWAPrvUkdkCwe1V1XL7x3qDIKhtuJddcYvrEW1rNEKx8r4TgC0zkGTqMigYwyBSJ\nv0/LUyfPGjz0ibB045oVygT6NWpVZ/TwmfooDj/fBnXeHt3OMMzjDdOHGhRe2xA/aE4dACjX\np3rmyJhP6qavNl20KzvQicMCALaQIkjhzthNhu0QrK9uOKLKvHosKWvqgrZ8FsGv2mdK68ez\nJk0QaGQVpn91YhwAiNxCWMTV2PiUidWcjN56tucmR+BbRUwVPEbnZuFTWpGhPWfPOd5malMP\no0ZUskuLos6Fho93p0gA4Nu5VQ9uG1DLt13nCdtfZ070MXEDhcDAwMDA3CSVpunU1NQCZiCf\nz1epVBZtiM2MRMjqKZL3qGjGu2uQYaGk3AiATR8OvoYePiZrkbziAMCotCZbUCgUotLDAda+\niH2i6FVMV1i0fs+t9XvqY5RvxgOAS3ARwy8tlezy1HspfiOmapSKvN9+JEkKBAKFQmFpYqdW\nq5VKpZlVKIrK76vUJJIkAYBhGPOrsNlsPp9vfrw+sbNoQ8flci0aCJvN5nA4NE2bX4XD4XC5\nXIvmlS4fUqlUFiVqarXaol7pEjvzq+iSWovmlX4gFiVqlq6KJEkWMJACEjsruSpWx7tb/dSE\nDe8Tt70D127upsdsH1hMlXnjmSL354Iy/UxYWNitrMJXMttypbWK53eycyOz3x7R/ZP1dsPN\nT6qoxVN6dGgVVL2yh7Sg3Ut57Tj4RuzZ86CBCQFO6Qnr0zQMAIiLhnlwlBvuJ627m1JvQEVd\nFYFzY6Bzjqdqebm4O2ZPW2l0fRmtAYD38tx1rlLoDF/yYw7pNLSc8RkqbEHpQRXtbyyb/0j2\n1SZD9uyPuX++K9tjGFHYGDu2C6AkVaZ38Lm1fupjufFaTlIu169d23krxbBQq0gHgCKiQu5+\nhxD6oVgcZwCQv/pqp4tG/hwAKHs+ACiTY8a1bxp19Kur41XpxwBAWqdI/i08AwCuY+7e8V3b\nYuL2JRgG3Ft2AQBGV3I0LHy5a5aGYfr2K/k9RobQr8uqEjuBc3tvjmzmopOOlfrkd0WVTYkB\nVWyZGZOjrt978jzh5uqp61W8KpXMyDBEbqFNigoWTVt988GzhzfPLZx7GwBYAByxN8Nofj9/\n71Pyx0e3/lw4aQsAJL5PN2f/rCL50F+ZqsCB9QwLy/dtQGszoh+kAAAQVN9Ax5tLI9M4Zbq5\n554bR4kD+law3zZ+1vELN1+9eLx/bcShhJT6Nb/a30ZJataw422buPDczQcJNy9GTxv2jCzh\nw05ZdPBp3m40nBhZxf79xP4j1u8+dvPOvTs3r+7euGjA2FUONXpNbVYUzBujb+cZlQRZ8+ce\nN2qc5JWY0NL3/PwRUdsP/HXr7oMH9y6dOhA5apm4eNNQFyEAsAiQf3yXlmb6jlYIoR+H59TL\nk895s3HCqy+/6+irSyYAQMVBvgBA2TbLePLg4oxxH5S5P4YZbfaxCYsJgt22u3d+LRyaNQ4A\nGo7y071+/tuMUcM63/g7IOfDn713vnCsPKvR17epO7LmCSUs2zXPWcgIIYtY0aFYACDInjWd\nJpxM6hCR7w2QCBZv3IpZG6Ni1i2amkELSvoHzxnczbzWWQMWLxUuXf5bZARIvfpMGhs/bJCE\nzeI7tJ3e89O6mAVHcshi3v5dJ6yULhkaN35o5djYQlt8uu0oySs6oNRXhyOFrp0riPbe23AF\nfmsJAD6hjVT9Ykp0iTDMwVtMXaqMjtq9Zn6amuNeovzouZMqGOemrNHLZm6K2rhx8TQ5IfSt\nFLRgbajty5hekyfs9dvQzu+rKZKU2/jfVp/Zt+vE+X2ndiYTQnt3d892QyPbNSivS4/zG6P/\n+gkGM1YwYlr70DHrtj6sGVr6q3uvVOk7f1rR2N//OL70wCe5hpA6uVeo231U95ZsAgCgTEhV\n5cYVg8KD4jaMMmMpIIS+G4IUTVzUd+iwNePq1A1q09RJrH1x9cD1Ox+d6ozr5+8IAATbfsrk\ndiOn7Rpdv1n9kAYiyHh8ft/dZxkVh+yqYccz2cK6mweP3/jg0XDCvIDcHXIDNoxc1XBmm6qN\ne3RrSnx+/Mfvx1I43kePjTbsCa1OjUrKlJQdjldCIfQPEeafr/CL06reHj95p1rjZvZsAgAU\nqcc79Vq9ZOc+L1PXk6LvpdBz7KRSaXZ2tvmnntjY2Bx+mVJ4HEK/jNQb+2LWbIqPf5CtYtl5\nlq7Wtm+3nq04BhnW2/NbYzduf3D/WY6G7exbuWFoeEjzSvm14OpVpkXnAZMHhRgeNnl3bc+E\nmSuvPXyi4jpUaRAydUFkkKe94ac7/fkU72prKs+6cHyAn8lOkiQplUpTUlLM/85ycHAAgMzM\nTPNPbLKxsdFoNOafRy8UCvl8vlarTUtLM7MKm82WSCQpKeZuhfR34pDJZOZv6CQSiUqlMv8C\nApFIpDubLSMjw8wqHA5HLBYXvH02pFuCAJCRkWH+OXa2trYKhcL8E+DEYjGXy1WpVPpbKxSK\ny+UKBAKLlqCtrS0ApKenm3+OnVQqzcnJsWhVpChKqVRmZmaaDNCt3qZ7aOY0EIuUnN664UKK\nIDykClv5cdfSWJvinTCrQwj919kFtB2xvm0BAe5BoWODQs1sIcjexJktrlXbbznSXv9SIDC+\nON3WK/Lz50hze4wQyh8mduYiSHHkojErV8WNOLxCzRL7Vg6aNazTv90phBBCCKEvMLGzgNCj\n5ri5Nf/tXiCEEEIImWZVV8UihBBCCP3KMLFDCCGEELISmNghhBBCCFkJTOwQQgghhKwEJnYI\nIYQQQlYCEzuEEEIIISuBiR1CCCGEkJXA+9ihX05bX5cCntOSF4/H4/F46enpZsZzOByJRAIA\nqampNE2bWcve3l4mk1n0pB02m61QKLKyssyswufzKYoy/5FBFEXZ2NgAgKXPcbL0STskScrl\n8uzsbDOrCAQCkiTNX4JcLlcsFgNAcnKymVV0z3FKS0vTarVmVrGzs2OxWNnZ2eY/x0koFBIE\nYf4S5PF4IpGIYRjzH0jFYrHs7OwsXRV1vbLoOU40TZu/BBFCPw7usUMIIYQQshKY2CGEEEII\nWQk8FIt+Ofsev7ewhhrA3KN+ufEfciycBEDKBwvjP1s8CTD3OO+X+PeWH1xLsXD2pnyyfBLm\nHk3+mxrA3MOdXyRbOpCPFk8ixdzj+3+zdFUEAIDPlg7EslUxyJ5jWfsIoR8J99ghhBBCCFkJ\nTOwQQgghhKwEJnYIIYQQQlYCEzuEEEIIISuBiR1CCCGEkJXAxA4hhBBCyEpgYocQQgghZCUw\nsUMIIYQQshKY2CGEEEIIWQlM7BBC6NeS8+L02mGdhtUr19Hfe0jbdjt3XWTyD/4zvNWojpPy\ne/fJ8ohp21/kLU9P+GNE95alSnq6eXoHtQrbcj4xvxZuzB1rsgWE0LfBxA4hhH4hyk+HRrTu\nefrck5JBbduGdimierRrasepS6+YDP58MmLl4Rsf35h+fh2tfr9iU+yp+BSj8rSHm6o2CNt1\n9m29Nj0Hd2/BeXx6bIdqCy6YeFKZVvVu2OrteVtACH0za0vsHq8ZEtK6Q4b2y+/PP4Z3Dwlp\n/Uyh1ZfcmtGnTft+mvx/onZtE/LbuyzDf8x071TclNGDOrVv075Tt8Hh03eeTtC/lfX+7fs0\nlclaqswHv00Z2bV9x/4jpp17VdCDIBlt5snYVeGDe3ds16ZD5x7h05acf2LpsyZ/lO19Oo+K\nNf7ZvbZnxz7T7/wr/UEImXQzfFqamhly5PyIGTM6j5k55eDNhi7ihPVhn1Vao0i17NrU8B0m\nG2HUmYnxf27o1+ydwsQDiCM6TM8g7GOvXVq1cMak2UuP3zobbM/+rc9wlcFWl1bJ7l85PrFz\n42dySx9hjBAqiLUldq7NyzO08kCyXPeSYRSxSVkMQ8clpOljTj6TCV07sInvPOnXByMnr9jt\nWLnFxBnzZ00e06Kiw/6oiJkHcnOdC9PHzYozfbhhW8ScBMfGy9evDquiXDFxfn4JJ0PnrBw7\neO2RJxWbdIuYMmV4/25F4fHi8QOPvbX8Me0IoV/V/VeZJL9MHQ9x7msWr2FDV0abFS9TfhXH\nqLeH9cl26VBVyjNqQat40cnfb1Tn7sevfszbviL10L5POcXbr6vrJtCVcIQl5y2vpUw7E/U2\n94erRv6Ux7f1r9V8o6ndeAihf8LaEjuRS0cui4i/8En3Uv5pb5qGHeolebozd+eZVpV0RaZy\nb1Xmu0960847rvWnDu/W3L+Mj1+5Ss26DZ0TWvJ2zLxCK557n12+fZCjrX1AiyaqrLsyrenU\n7vHWSaff2s5du7BbqwaVKlSqXb/J8OkrWzjCtrmHzeyhli7gRBoLaJXfLZX8Xl1CCJmplKdI\nK0+4nar4u4D+69IHgrQpI6IMw56u73bkKTF82ywuy/hrgkW5TNmwc/qmXVNWz8rbvlJ2BQCc\n6rgaFtqWqQYAf17M3TKTXLdjJ06ePHly17a532VQCCE99r/dge+MYEtb2vH/OH0f2hcDgKSj\nV/mOrev2eLF97g4tU5skIOfjAZphGgQ4AACjSd27Pvr87cdJaSpXr/Ktw/o38JOabPbTrWNr\nth1+9OY9IbQvVaXx6IHtBCzjPX45WkaZ9tXv16JNh0zySGUAont2PJKqgPfjOlyquXvbeKOK\n3cvZxa47PXBq42PROyQl20tIU/sSGfWSw6+8wpZ7CzmGo+0Y3t/+fm6apVUmbVsZfeZGQoaa\nVdS7Yvt+g2sXFwNAWNvWLZbPSpg7/2aSTCR1rta017BO1QFAq0iMidp49f6jZAXHr3K9fsPC\nPHlkAe10bRPSNXrDp41Lz9znx8RMViTfiV4VF//oqZztWKtVmK2ZSwiggC7pyOVytTr36AzD\nMARRyM5VgiAKjTEMtqSnCFmbalFrT7TqOr9Z82Y92jmJmadndpx7pQyeediV9+XrICdx57Rl\nlwOnng5w4F/K0wLB4perXgsANNl8XQEYfAw5/OIAkHojhWhXXF9F8eEhAKReTyW6ltS10KBB\nA5qmP77R6Fow52MO3/T5tWj78A3x+loWRX7DJusnDOQbtqX/n0vkhw7kZy4RizqmZ22JHQDU\nqOv8+8H9WqYFScCf5z66Nq8pLVWFVo09lKpobc/7cCqB5Lo1sOUCQMyEkcflZfr3G+1hQzy6\ncuS3iAHaVZuDXQVGDWpyHgybuaZMh8HTBnsrPz9auih6hnuV+a2KGoX1CSk3Njaq95jLdasH\n+pcvX8rbg+KVCAgoAQB9omOKDO15vNyEZf1L5e1w/YiJsd3HDhy8/lHJnQAAIABJREFUQ+jZ\nZPH87iYHpcw490GlbVbDyahc4lO/rY/uX2bNqLHnVV4DR0xyE6qvHNiwJHyEXUx0GQEbAA5P\nnF+/x7Be5d3eXts1d8Ncx3pxnR2pFSPGXecHDB0xTUqmH1rz28QxsH1l74LbubRihn9Q2Nww\nL0aTMm1Y5FvHwIGjptkyqQc2LDufIncFC5joklPunJ89e/bx48d1/0ul0pMnTxbclFgsLjgA\nIaTHkQS0Cq0/b+HhAyty97eJ/bo3DvbWBzCa5OVdJ/H9R43t5GtOgyRPwuVyAYDH4wGAnXSE\nv2j6w+0j3i686y+hAIBWvRs/5DQAaGRce3t7fUUWi2VvJ9G1YFheADs7OzOHqScSiUQikUVV\n+Hy+RfEkSZrZfz1L48HyDR2HwxEIjL/OCsZms3/CQGxsbCyKZ7PZQqHQoiocDucnDEQikVgU\n/w2rIpfL1X24jGi1xmfEGrLCxM41uLJ2z54zGcp6/E/H05Rh9V1IPq+BLffsiXetu5S4ffmz\nyKM/C0CRcmDvk4zZO0aXFXIAwMunrPZat7jVD4IjA40aVGXdktNMk2Z1faVcKFkicoL0HdfE\nB8y3y/QVpS/8efHa7VO79mxdS/IkZQNrtQ8L83fisSkuRRAsNsXlcoxqaRVvoucuVLpW0ibd\n9G1dz4nDynx2N4ldwq/YV4tfq3wLAO5UvofOcz7G/vE2a+SmSfXseQDgXbrMg67d1+17vay7\nFwAIq4WHBfsDgEfIqOLbLzz6rMhUbj/zQTMndqQuYys2Sxa5+HyahuGmFNROhnO/zg3LA8Cn\nv2Y+VvAWLQgvySMBwLcUv1P32RYtprxdAifLtkEIoW9wa0GbeRuvB/aa06NHSycb+vnlfdER\ncya0SFp2cqsTlwSAy9Pa3c5ymbNu+Lft3CZYgn3r+/h0WVO1WGBYWHNHVtrpnTEJotIA10m+\nFX7jIPT/xgo/ZnzHtiJy75n7aZXtY4Hj0tKOBwBNajlNOXkWOrsfSlF4dC8FAFlvbzEMM7FL\nO8O6Qk0SgHFix7cPqet9ak6fvmUrVyxdqlSFytWqeJo+YuvpX7uXf20AkKcmxd+4dnj3zumD\n45dtj/Lkkvl0lokeNf6GS6v1yztlXt/Yf264V/H1krWLYsRjNkz3N4xjUc4AkKSiA4zqa2Vv\nktIlbh45CfdIrnt9+9zTnAkWv7WLYOXlROjuBQBFGnnqq9iQLGAg5VoCR1RRl9UBAM+u8ezZ\njQHgfYHtuDTw0JV/Pp/EkwbrsjoAoMRVKos4Ft2xIG+X9Hr16tWqVavcgbNYGRkZBbQjFosV\nCoX+0G2hLP3lh5A10ebEL9x8QxowL2J8qK7EL3jAVMfEPl02Ld/1fHYPn/T4+Uv3PWu6+npJ\nofGv0PzQqiy1Wk3TtEKRe96efZO5V3YUm7pq98HNSzNZtrVbhF+ZVLS033XKUav7OHO5XB6P\nR9N0hixL10LBH3MAIElSJBLJZDKGMffEXN0OlZycHIu2D1qtVj+QQvF4PC6Xq9Vqs7LMvX8C\nSZJCoVAmk5kZTxCEbheXpQPRaDRKpbLwUAAA4PP5FEVZNBA2my0QCMwfCIvF0u10zM7O1mg0\nZtYSiUQqlUqlMn1PibwEAgGHw9FoNNnZ5p4LzuFweDxeZmZBt6QwpFsVASArK6vgPWeGvuGr\nis1mq9XqnJwckwEF7C+0wsSOIEVtHQWHD798zntsUzxUd8aae8tqisP7nn20z9DQfSvYAwBb\nSBGkcGfspq/qskxsywjSZvTizR0Sbsbfe/jw7pl9W9eWbTN9elgFwxiV7NKiqHOh4ePdKRIA\n+HZu1YPbBtTybdd5wvbXmRN9TJ+Bpsq8eiwpa+qCtnwWwa/aZ0rrx7MmTRBoZBWmuxtFciV1\npey1Fy58DGntaVie9mjl0AlXZuzY68yA7kwXPRaLAIbW/c/hG2eWtJohWBTkwRTYjkD89wqT\n5xRDCZtlUWKXt0t6Xl5eXl5euf2k6dTU1ALaYRhGo9GY/2mhadr8TiJkZRTJe1Q04901yLBQ\nUm4EwKYPB19DD5+M62cZhjk6MODoV/UOt/Nz5dq323FpRd42GVpD0zRN04Yfw+INe8c07K1/\nmfZkDAA417HXxXA4uVtatVqja6HQj7Duk6tWq81P7HS0Wq1F2weL4ikqdytqfhVd/82P159i\nZdGGjmEYiwaiO95ntBDNmYr58SSZu83/oQPRrScWDYTFYlk0EP0aqNFozM9Qf8JA9Kztqlid\ngGCXzFcHdz1KL96ptK6E79zejk2v3HeMzSsWJKEAQODcGOic46laXi7ujtnTVp4xce19esL+\ndRv3epQKaNkxdPz0BUsH+Nw9stkohqRcrl+7tvPWV7mNVpEOAEVE+f/wpTUA8F6eu2ZUCp3h\nS37MIZ2GljM+j4Rg8Uc3dHu+fcGjTIMfLox238p7PGm9iiKObekyWuWbs2m5PzQZWnEgKdu+\nqifkwz6wmCrzhv72fsr0M2FhYbey1Ga24xTkpkg/+fLv6lrF88syc38aIoT+LSyOMwDIX321\nM0Mjfw4AlD0fAGwrd+80dIzhnyefQ/J8Og0d075PMzOnsmtbTNy+BMOSBysvA8Agf4fvMgqE\nUAGscI8dADjXraHeuvURwNzSucdMCYLXtah4xfF3Ur+xup8/lPh/7N1nXFNXGwDw596bPUlA\nUNyDobj3pNZZqyIiIg5A6qoDB1oRLbi1uPdABRXr1qpFxVWr1lWrtVUL2lati70Cgey8H6IY\nQoB7UXzb+Pw/8Asnz7nnnIybJ/eem9N6dHP7XWGLeGN93auL7p6L+T4xc26Y5dUJAMCWFn5/\nbF++UPZ5mwaEMjn+1EthDW+LGIpXL7y/2+KoKVxf/7YN6wq5RE7y41Nxe8R1+wRWEwIASUBh\n6qvsbGeZ7O28UY60U0f5+j2zl0vG+zpC9uVjO/+i6rnC4xUn/ozwdrVoounYRZ0eTJwzbrq3\n34Am9atq81Kunz5w4ZVu5PIvAEDgNKxn9ZNbwqKocb7Vhbqr30UnaaUL/UpN7CT1xrW1uzr/\n6w2Tg/rIWXnfb96u4XVsKWKDiNZ2HJpPcOWMjQhfPSHgczmZe2r3RnEpp5u1+c8SE4sdGqzv\n7l5arxBClYrnGFybv+J5TPjTEYfrSExvTMONVeEA0GK8GwBIWw73a1msSvK+zSkGV79J0+m3\n8ve6+eteChv0uNVawgGAgpQfxh9+Yt9s9qd2Vs4SIITeL9tM7Hj2/WWsPQXCDkVzyACgqV9d\nWHq31sC3CVO/yNXq6A2HtkRla9k16jUNXTqnubWja0LnofO+UOw8uXPWvnyhnUODpj2XTPAp\nGdZ2dNTcWvu+O5Ow+nhaoY6QOdZo3nXEtBH9Tb+E7DGgnTpm/fgZnvt3TDOrRIauWRC7ISZm\n5dxCQujW0nPZ1kC7J3HBX4cfcd8xyL3YCVyCJZu+dkP8nt3nTu4+nqEgeZI6bi2mLwv2dDGd\naCcnrF4m3hi9fflchY6s4dIqdMWExoJSDxYSJG/m+kUxG+K2rYjMNQgaNOu1ZMJw+tshWPYL\n1s/ZtG732iVzgOfg6Rf25c1VcdYaynm0Laz4D7xsOvxdab1CCFUqghLNXjF6UsiWmZ909RzY\nx1Gsf3zj+K3fUh0/mTmmWZX31cq4HVM39VgwsF3vgOF9iPSHZ747ncVusO/A+Pe1fYRQGQim\n8xUQ+pDKnWMnk8mUSiX9qbUSiST+CS5MiT5qWb8cjdsSe/fuA6WGlNdu1N5n9PCRXuxSLoJd\n26nBTUO3vdejS96lU94e0qq/68hTv2/pZjAYzKerv7p5OHzBxpt/PNJwHdp2HzBz/uyWDm9X\nsBAIBAKBwGAwpDw7U73u564jT11dbnnVmgWKomQyWWZmJv3PLAcHBwDIy8ujfw2BRCLR6XSl\nTVcvSSgU8vl8vV6fnZ1dfjQAALBYLKlUmplJdy9EEITplzgUCgX9HZ1UKtVoNIWFhTTjRSIR\nj8fTarXlXsVShM1mi8XisvfP5kzPIADk5ubSnzdmZ2enUqnoX84iFou5XK5Go6F/VQeXyxUI\nBIyeQTs7OwDIycmhP8dOJpMVFBQweilyOBy1Wl3aVR2ml7f1HtJsAyGEkG2Qt/aZst3KaQer\nplz9q7S7WMJWR5JeedpbOTPg3M5310nfcjfOEbVJT0+n2ROEEB22efEEQgghhNBHCBM7hBBC\nCCEbgYkdQgghhJCNwMQOIYQQQshGYGKHEEIIIWQjMLFDCCGEELIRmNghhBBCCNkITOwQQggh\nhGwEJnYIIYQQQjYCV55AHx0ft2plrNNSEo/H4/F4OTk5NOPZbLZUKgWArKwsg8FAs5a9vb1C\noWC00g6LxVKpVPn5+TSr8Pl8DodDf8kgDocjkUgAgOk6TkxX2qEoqrCw0HxBqrIJBAKKoug/\ng1wuVywWA0BGRgbNKqZ1nLKzs/V6Pc0qcrmcJEmlUkl/HSehUEgQBP1nkMfjiUQio9FIf0Eq\nkiTlcjnTl6KpV/TXcUII/XvgETuEEEIIIRuBiR1CCCGEkI3AU7Hoo3P0YTLDGloAumf9Xsen\nFDBsAiAzhWF8BZZOp3ue9218Mt3To29lMnx4M9OYN0H3bPIbWgC6pzvfymA6kFTGTWTSPb//\nBtOXIgAApDMdSKkvRU97NuPWEUIfFh6xQwghhBCyEZjYIYQQQgjZCEzsEEIIIYRsBCZ2CCGE\nEEI2AhM7hBBCCCEbgYkdQgghhJCNwMQOIYQQQshGYGKHEEIIIWQjMLFDCCGEELIRmNghhJDN\nKnh8YWvIkJBPm/g1c5noM+jAwZ+MxQMKX/y0bfrQcZ0a+XnUHdWje3T0sUK90eqmHq2dNffb\nx2W09cvSr6wGPLkQG9C/q0udGs416rTr7r3i26sVHw9CqDyY2L1/EUN9vby8dr+0XMLo7vKx\nXl5eIdsfmf718vKKSS0AgGEDB6x7lW9+430pauI9ujMn2MuMr9/w6XNX30kppL8FbcE9Ly+v\newVMl7dCCDGjTvt+ivfIC5ceNfD08QkcWlWTdDDSL3L19bcBmedD+w47k/BrvU99fccGu9hn\nnVk1YeKwuSVTO4M2eX3svvN3M0trS695GbL525IBqVeXdBwa9uOfhPfIiVPHDa+a81vUVG/v\nlb++v1EihIrBtWIrBUERV3Y/Cgxv+bbIqIu9lUERRFFBnz593PmV+/hXUhNcaZe5YX0AAMCQ\nk/Y4PvbbxVNf7fx2mZgiyqmJEPqAbs+Ym601hpy9/ElNMQDAtNmbuze7sD0ofWJiFQ4FAFdD\nvkrXGEd8e9m7pSMAwJQ556Z13nJ6+6bbE0NaO5k2YtTmPX9w68ya6a9UWldrrRg0eQ9uXts6\n98u/Cq0ErBi/jeC7n79z1k3ABgDDrKm+DVtcXDK8cM4TbiUNG6GPGyZ2lcLp06bpV7ZrjBs5\nbzI55at9zwwOn0hz/n4TM378+ApvX28wUqSVLMqinHYTBr2RpJ+VkewqjRs3fvNf02YNcodP\nOnIovfCLqoJy6+rVzBeVRwhVyP2neRTf43VWBwAkr0cP5/NxD+8q1D0dBAAQn5jFrRL4OqsD\nAKC6zlu05XTAH7F/QmsnANCrHg9t2UVvsH5yFgB0qr9r1e6gLSXAoE2PS1E6dowwZXUAQLKr\nTGvneOXsP9cUmk8l7Pc1UoRQETwVWykktQOrQnLcs7fnVR/tuSJvMppv9nj7DhhQ2nlSoy7r\n8JZvJo8LHuQ3PCQ86kJStqk8yMf70PP7CyYE+Az0Hj5y7PoD18suf92EUevl5XUw4+3Z0iAf\nb9M53yAf7z13z08N9PPxHhg4dsaZR7l//RA7Pmioj9/wGUu2KUqZamOBLXYEgCydHgA0uUmb\nl4QH+vt5+/iOnjTr0NUXpphhAwfEp2fERM0ZOXq1eV2NIjE8wHfK2pP0mkIIMdCwtkhfmPhr\nlupNgeHnqykEJfEQcQAADCqDc526rfuZVyFYcgDQF+hN/5KcahE7DsyLPRixeZHVJiiO8/5D\nh0+fPn3i8Epr95Nr1q37ZnYL86LMHA1Bclwq+XwFQh8tfGtVDpI7uqXDpp1/jJrbDgDAqI25\nnd5+eUPDXFq148KnJhR6jB0TWlNCJF0/uW7WOP2mnb2cBQAQPzuqW0BIcNPqL24eXLpjaZVP\n9/s7llVermNLvhs9c1EzJ/LEygWbZ4XIm3adOX8lkfFr5KLo5df6L+xStczaRkX6k6NrDhCU\nwNtBAAC7Zs6/Ju4yJSJYztE/uBS7ffl0zzb7nDgkAFxdP7+ZZ9DSoPoAr7M9TV7SvImRBa2D\nV03ua3688O+//87MfD1ThyRJFxeXMnpAEASLxTIa6SaGJIlfZtDHov2GrWe9hkV93vfzgEGO\nYuOfF/deeqrutSDemccCACB5a05esqiScjIKAGoPq2v6lyD5TTp0BgCdkg8ABMlisy0Os7G7\nd+8uEAhUuQIrAeyqAQEBppuFiuyszNRbZ+NCbqe5+sXW4lIGg6HE1kpFURQAsNls+m/2oor0\nWyFJkmm86UYFBkIznnhz2ofRjo4giAoMhCRJ+lVYLBZBEBV4rFgsBonHBxgIRVGMBmJ6BuHN\nI0Cz1gcYSBFM7CqLW2CXrCnbCw1t+SSR/2rvC0PVFbVEO2lUVGUeP/Iod/He0MZCNgDUd22s\nvzl8/+YHvRa2AQBh+xlBvZoBQM0B0+p+eyUpXQWOgjLKy1V/9OzPWlcHAL8vXU+F3Z4bHlSb\nS0EdZx+HuMsPcsFaYleYcdTL62jRvxSvqv/0xQ14FAA49h4c0r1faykHAGpU9dt2YsFjtc6J\nwwGAXKcx/j2aAoC24AUAaBRJ82cuSGsUsLV4VgcAsbGxCQkJptsymezcuXNlD0EgoDVShD42\nbGlrr8Bu3yyPP77+9fE2sfuI3r1K/ab0z7n1kfN/4jr0mNKtptUAkiOSSqVW7zJy2WUHTHKt\nvidNCQBOHSbe3BMIACRJlhZcGolEwigemO8fWCwWl8ts+h9FUUwHwjQeKjQQHo/HqMqHGYhQ\nKGQUz+fz+Xw+oyosFusDDEQkEjGKr8BHFZvNttoxvV5fRi1M7CqLyHlYbfLYzqeK8fWkj3b/\nZN98HJdeap//4o7RaJw9dJB5oVD3EqANAFTtWbuoUEKR8Ob7W2nl5bJr+HpHyRKySXaV2lzK\nbCPWt2J28QSweOLqtWqKOa+/inl597l389rRZy9TU1OeJN4yr1Wte7GPiq3T5hl4ZP6Tp3gO\nFqFKcmfZwG9ibrUJXhIQ0N9RYvj72tHoWUvC+71cc26345t3uok6/e6+BbO+P/c7v/oncw5G\niyrhQqjJMd9+lvoq8ZezK7du8ujJeXh+pdDaRGGE0DvCxK7SEKzgdlXWxtwbv7DtjjsZnVa5\n0azHEnIISnhgX2yxjZGvD8ay+ZS1SqWWW6Ut9Xg+rdOUxS+eeMugzVg0YdIjYaPenZp7tHHv\n6fVJ6OQFRfcKxMVebE6fz4jwogJHLl6SMDCyT7GcLzQ01Pyyj+zs7DI6I5FICgsLtVq6P57C\n9DsWQv9R+oK7y3f+Imv9zaywQFOJe69xkVWejRoau/bg34sDii5gNd7ZHbFx+a5cg9BzXFRw\nyHAJq9T9gF6dZ/X9KBQKVSpNGQEA0KCjZwOAzwf696rZ95PZq8denhHnWTU3N5fmcEyH93Jy\ncuifjpTJZACgVCo1Gg3NKiKRSKfTqVSq8kMBAIDP5/N4PL1er1AoaFahKEosFufk5NCMJwjC\nzs4OAPLz8+nv6MRisUajUavVNOMFAgGXy9XpdHl5eTSrsFgsoVDI9BkEgLy8PJ1OR7OWRCJR\nq9X0ByIUCjkcjlarzc+n+9thHA6Hx+MxegZNR44VCkXZR87MSSQSlUrF6KXIZrM1Go1SaeWK\nQ6PRKJfLS6uLiV0lchneLWvijuRnj16B8/Aa4vIrAACAwKk3GH5OyNJ7O5uOVxtjImbldJ4c\n2rv6u3QmX/d6b6jOvZpfOZcq5L/YcTtNs+tohB1FAIA698cygv0GteYI2PMGu87aHvmw6zY3\ns5nU5q9Xg8GQlZVVdrsGg4H+u4vpBB2E/qNUGYc1BqPLME/zQmmTKQCxKSf+AVNiZ9Sd+Kr3\nrvjEqp2DZy6c41atvFNFRr3V95rRaHz9zioeUJh26fgPyfX6+rQVc4oK6w4MhNnX78W/BM+q\n9N+5Jnq9nulbmOn+wWg0VmB/Qr+KaVYW03j4IANhVMU0CYzpMwjMB1KBPTyjgRgMBqj8Z4Rp\nfAUGUgQnklcigZOvC1uxYMW5Ki1HcWifc+CIW49ubr8nbFHCldtPHz88tnXW94mZ3To5ll+z\nNATbTcC+vOHgXy/T/km6ve7rTfTnezLCFrsYjbrvLt9Ly0hNuvPD8jm7AOBZco6h9Cpu/vNb\nCvKjliZURn8Q+piRbCcAKHxa7Ou+rvBvAODYv56x9HTHsF3xiU3Hbt2wfXH5WR1zmoKEkJCQ\nxRdemRfq1S8AgGuPP2OHUKXAxK4yEdTITo4v/1F2CaR7HtakX+Rq/46iQ1uiQmct+OGJPHTp\nquaid/rBp68XjK2R+9OsiWNCZs7PcBnWRcIpvw5zfAefeSM//zlu2YRJM7d/d/fz8I29XRz2\nh016rCr1CwdBCqbM9c38bdvuP8o634oQYornGFybz34eE/5UUXT2x3BjVTgAtBjvBgBgUK/e\ncJNfLTgytH8lTXYTOU+yZ1O/RS7JfXPGAIza/bN2A8DQ4XUrp02EPnYEnpn6eBiNmpw8o0zy\nX/qiXO6pWJlMxmgOjUQiiX9S6rJICNmSjAsLJ4VsMXBrew7s4yjWP75x/NZvqY6fzNy0dSoB\noMn6bmjHiYI6Pdq1sLeoaNdq8gjfYomXTnl7SKv+riNPXV3epmRDYrFYlXvdzunTkgF31vv1\nXnBRVKtj4OAuIl3OnQuHz9/PbDRs04Nvx9OZaFGEoiiZTJaZmUn/M8vBwQEA8vLy6M/Qkkgk\nOp2uoIDuSoxCoZDP5+v1+rKnApszXbBZ9ItO5SIIwt7eHgAUCgX9HZ1UKtVoNIWFdBd7FIlE\nPB5Pq9XSnzPHZrPFYjHTZxAAcnNz6U8WtLOzU6lU9Gc9isViLper0Wjoz5njcrkCgYDRM2ia\n9ZiTk0N/sqBMJisoKGD0UuRwOGq1urRZj6aXt/Ue0mwD2QCC4MgY/1YAQui/yqF7xKbdHnFb\nYm+fiFVqSHntRv3D5g8f6WU6PqdR/AQABU/PX3xqWdEZhlkkdhXWMuTgySorV8Qc2rtljVLP\nruXWLHTZxPkTB7yXjSOESsLEDiGEbJa8tc+U7T5W7xLVWXkkyepyEVawhK2OJL3ytC91TghH\n3C49Pd3qXW39px/0n25egnOAEKo8+P5CCCGEELIRmNghhBBCCNkITOwQQgghhGwEJnYIIYQQ\nQjYCEzuEEEIIIRuBiR1CCCGEkI3AxA4hhBBCyEZgYocQQgghZCMwsUMIIYQQshG48gT66Pi4\nVStjAb6SeDwej8fLycmhGc9ms6VSKQBkZWUZDAaatezt7RUKBaMlFFkslkqlys/Pp1mFz+dz\nOBz6a0FyOByJRAIATBfoZLqEIkVRhYWFSqWSZhWBQEBRFP1nkMvlisViAMjIyKBZxbRAZ3Z2\ntl6vp1lFLpeTJKlUKukv0CkUCgmCoP8M8ng8kUhkNBrprzRKkqRcLmf6UjT1iv4CnQihfw88\nYocQQgghZCMwsUMIIYQQshF4KhZ9dI4+TGZYQwtA96zf6/iUAoZNAGSmMIy3vuB6meie530b\nn0z39OhbmQwf3sw05k3QPZv8hhaA7unOtzKYDiSVcROZdM/vv8H0pQgAAOnlD8TTns14swih\nfyU8YocQQgghZCMwsUMIIYQQshGY2CGEEEII2QhM7BBCCCGEbAQmdgghhBBCNgITO4QQQggh\nG4GJHUIIIYSQjcDEDiGEEELIRmBihxBCCCFkI3DlCYQQ+i/RKi74tw2wehfXftDeq+tNtwse\nX4hbHX3//h+pWaoq9Zt6+k/z8+tMmAUXvvhpz+qNv9z4LTunUF69ft/AKXMnDRRRb0KMmjpV\nnZR6g/n2CZKXlvq86N8nF2Ij1+y6ce8vpZ5d273loJGhM4Z3ep9DRQgxh4ldBRn1eecPxp25\n8suz1GwjW1TbrYXX8C88Xe1M9w4bOKD9xm8nO4vobEpbcG+Q/5zF+480EZSzqs+98/sPnrr0\n6FmKnhI41nT5pM+QId0bmu7KT36Rx3OsJuOUrKXJe7Bl2bYbia9E1RsOnzbjkzpiqxu//VXQ\n/IfZJcuPHD/BJpiN6H31HCFUEsmu2rnvAMtSo+56wil+dQ/Tf+q076d4T8gFh04DfTpJjH9e\nPHIw0u/+yyMLp3V4HZB5PrTvF+k6QZuBfnWrsHJvHdu5aFz86dv3Ti9+HaD4Sak3OHb4rFNV\nflEjBPl2H5V6dUnHoWtYcg//kRNr8DWXDu+Kmup9K+P8gSnNKm/sCKFyYWJXEUZDwcavJvyY\nZj/Qb/iwWjJlVtqvl75bGfalcv2OPjWEldToPycWfr3jbne/L3xHuXAN+Y9/vxa3YdbD/NWR\nA+oBwJV5M+ObR24c716y4p5ZSxLdRqyd3vbRyeWrZ0d57l1ElAwCAACeXbfImT0sClmlRVd+\nzxFCJVF8j2krN1sUPtsbcO2809RtwaZ/b8+Ym601hpy9/ElNMQDAtNmbuze7sD0ofWJiFQ4F\nAFdDvkrXGEd8e9m7pSMAeNrPixvdLvR49LSbk/f2tQcAdfZZAOixat3aBjKr3VgxfhvBdz9/\n56ybgC0Wi2dFzOhTy+3y8mBVyG0e+c57DYRQRWFiVxEPd8+58MJuWexyF+Hr769dPu3BHzdi\nz9L4PhuHMNqUXk13kfXYA785d4ucPPz1t2H3Ji0bCp6Exn0DA6LLrngpWdl+jmcVO6Gk32ea\nA6sUeqOUsr7bJdlVGjduTK87Br2RLGUz763nCCE6tHk35i8IKUbxAAAgAElEQVT9scWcC02k\nXFPJ/ad5FN/jdVYHACSvRw/n83EP7yrUPR0EABCfmMWtEmjK6gAAgPJb/k3o8aHXNj2Cvo0A\nIOfefQDoKedbNgYAAAZtelyK0rFjhNub8wwk23FaO8crZ5//nKf1lOIBeIT+bzCxY86oXRX/\ntH7Q2qKsDgCAYPnNGGt/3zJL0+Qm7di46/rvfys0BgfnBr2HThrcqQYADBs4YFj0jrSY1Rfv\n82O2vj2rolEkzp0YUdA6eNXkvhZpU4HeqM5ONS+p1WfinJpZRoDokX4ns1SQPHPw1U6H9oRZ\n9GFEE/m+bRe+jOx9OnqvtIFvaVkdTUE+3j0jJ/2yasuTXL3Uqf7wGRH1XxxduetsaiFZr3nX\nyLDRkhLbr3DPEUJ0nJ08Qe3gO3OIa1FJw9qis78k/pqlaiHnAQCA4eerKQQl8RBxAAAMKoNz\nnbpu/cw3QrDlAKBT6kz/ppxPIUiOJz8r4fiVZ8l5slruPXp1lLGKrrcj16xbJ6nXwnwLmTka\nguTU41OVNEyEEB2Y2DGmzr2UotF/3tHRolzq2s3H1TJ418z518RdpkQEyzn6B5dity+f7tlm\nnxOHBICr6+c38wxaGlQf4IUpWJOXNG9ipNWsDgBGDWjy1b4NX0y/1rVDm2ZNmzZ0qcnh1Wvd\nuh4AjIqOqzppZEKT8DVjG5bscLdZs/eN+OrLCXuFtT9bGTWijKEZtOmJiYnmJSRL5uZS1SLs\n2JLvRs9c1MyJPLFyweZZIfKmXWfOX0lk/Bq5KHr5tf4Lu1jGM+35rVu3nj9/PUGbw+F07dq1\njD4TBMHhcEiS7vXdFIWfOsim5D9aF3M9ZfDRCPNZE+03bD3rNSzq876fBwxyFBv/vLj30lN1\nrwXxzjwWAADJW3PykvlGeDze0/1RANBkXCNTybMbGQTJ7d24zV8KjamEX6XZ6iMnhreQAwDw\nqo8cOdJUXqDIfvXPq5unYiffTnMZvL2BpPzpKCwWCwAIguDxeDSHaXqP83g8o9FIs4oJm80m\nCLrfZkmSZLFY9Htl2p9UbCA044s6z2hHV7GBkCTJqEoFBg4AHA6H/n6YJEk2u5zZ5xa9Mv2l\n3zEWi1XhgZheyXQQBMHopVj2QMp+F2Bix5he/QIAanBovcEcew8O6d6vtZQDADWq+m07seCx\nWufE4QBArtMY/x5NAUBb8AIANIqk+TMXpDUK2GotqwMAt6Hz1je68sNPN389f/Dw7q0UT9q4\nTWffoKBmjjwWh8shCJLF4XIt3wB61fPopcvVzi31L2+7eX/qyCbz/vr9Jaueex0rl0Gocn4I\nC/vBvIQn73tw5ziLsPqjZ3/WujoA+H3peirs9tzwoNpcCuo4+zjEXX6QCyUSO6Y9P378eEJC\ngum2TCbr168flIn+GxIh27Nv4iZR3Un+jeTmhWxpa6/Abt8sjz++fpGpROw+oncvl9I28uTs\n+l7TfhRW7bvXr5Hps+dChsqoL2gydc+P07zttBlXjm0InLgqpM/n3dLvuvCLfXCMr191T5oS\nAJw6TPz522AR7XMCBEGIRMyuxxIKGU9irsD+gcNhdiqZJEmmA2EaD8wHQlEUl8tlWuUDDITP\nt35+vzRcLvffORCBQMAovgIvRRaLZbVjer2+rFpMm0EkxwkAXmoMrYuXG/WK5y9zpNVrmp/r\n9PLuc+/mtaPPXqampjxJvGUeX617TfN/t06bZ+CR+U+elpGH127WJbhZFwAozHp595eb8YcO\nzJtwd823G2pzS/v2Y4yeFvZLNa/ta4fk3YoZu3RG/brbpVtXxImn75hn5co1QZUh+3cML2vw\nAABg11BiusESskl2laLWJRQJpXyNYN5zhFD5FIlLE54r+h+2/PZ1Z9nAb2JutQleEhDQ31Fi\n+Pva0ehZS8L7vVxzbrdj8TedOv3uvgWzvj/3u7hOr/ibh+RvjvuN2XUogFu/16em0xC1Phuz\n7Ar1m/uos6P3P74UXOzcxOSYbz9LfZX4y9mVWzd59OQ8PL9SiBdPIPT/g4kdY1xpVxlr65Ur\nqQO8a5uXZydtnBR+ff7eIy1Erw8+GbQZiyZMeiRs1LtTc4827j29PgmdvKAoXiAu9uA7fT4j\nwosKHLl4ScLAyD7Fcj4A0CiurthwKXBGWA0OBQB8efUOvXxad3Yb5B/+7T95s9/8zIplrbwb\np1/mRy7z4ZMEv92oCO+Hi+aEC3SK5vNqvPvj8EY5Ry4r0PNFixYtWvT6MIPBYMjIyChj+zKZ\nTKlUajQamt2VSCQ0IxH697s0ey9b0jnAw968UF9wd/nOX2Stv5kVFmgqce81LrLKs1FDY9ce\n/HtxQFFaZryzO2Lj8l25BqHv1BWLZwbISWVGhtLe3p4giJadu6hUKvN3n7jbdICzDzf/mtG/\n2NHBuu06NRWLDUNH9qjR7dM5q4O+/2JLJ8vD9hYEAoFAIDAYDFlZWTRHSlGUTCbLzMykfyrW\nwcEBAPLy8tRqNc0qEolEp9MVFBTQjBcKhXw+X6/XZ2db+a0oq1gsllQqzczMpBlPEIS9vT0A\nKBQK+js6qVSq0WgKCwtpxotEIh6Pp9Vqc3NzaVZhs9lisZjpMwgAubm5Wq2WZi07OzuVSqVS\nqWjGi8ViLper0WgUCgXNKlwuVyAQMHoG7ezsACAnJ0en09GsJZPJCgoKGL0UORyOWq3Oy8uz\nGmB6eVuFK08wRpD80B7V//52WVKe2XvMqD+68R5P9mlRVgcA+S923E7TbFgZETDYy7NDq5qy\n/DI26zeoNUfadt5g1zvbIx8WWr5WKE61WzdvHrhTbF+gV+UAQFVR6fMPDDoASH6ztZaB892o\n1ALKcVITealV3rcK9hwhVB5t3vW4pKwaQyMsTn6qMg5rDEbnYZ7mhdImUwAg5cQ/r/836k7M\n6LF4SQyvXeDi83c2zwmSs8v5OGDx6gKAQaMDgMK0S/v37/85r1ieUd8nCAD+OJv8bsNCCL0T\nPGJXEU3HLur0YOKccdO9/QY0qV9Vm5dy/fSBC690I5d/YR7GFrsYjVe/u3yvbxOnrGcPDsfE\nAcCz5Jx2YssLL4q4+c9veTooamlCzIJiE8soXr3w/m6Lo6Zwff3bNqwr5BI5yY9Pxe0R1+0T\nWE0IACQBhamvsrOdZbK3R6Q40k4d5ev3zF4uGe/rCNmXj+38i6rnCo9XnPgzwrvEhR7WLp4A\nALv6rtU4FT9hWrGeI4TKlXpiid5o7BNQ36KcZDsBQOHTYhfp6wr/BgCO/evpTU93DNsVn9h0\n7NbI0P4lz5sqU7Z+0jfadXz0erPzEursUwDg1KMaAGgKEkJCtnfktT/uXacowDT/mCtjNh0K\nIfR+YWJXEQRLNn3thvg9u8+d3H08Q0HyJHXcWkxfFuzpIjUP4zv4zBuZti1u2ckCqo5Ls2Hh\nG2WrJu0Pm9Rq375St0wKpsz1DZy+bfcfnQIbFftd0Lajo+bW2vfdmYTVx9MKdYTMsUbzriOm\njehvmhLjMaCdOmb9+Bme+3dMM6tEhq5ZELshJmbl3EJC6NbSc9nWQLsnccFfhx9x3zHI3fI0\naMmLJwCgx5a9FV5w4h16jhAqx42df7IEHt0cLGdw8xyDa/NXPI8JfzricB2J6ToAw41V4QDQ\nYrwbAIBBvXrDTX61YKtZHQDw7X3SH0x6MHN6aJ8DdbkUABj1yu0hywmCNW2MKwCInCfZs2N/\ni1yS22+r1PRONmr3z9oNAD6+tSprwAghGgiml44j9CGVOwunAnPs4p/Qnd2C0L+WUZcV0Kwp\nt+HGHYdLLC8GkHFh4aSQLQZubc+BfRzF+sc3jt/6LdXxk5mbtk4lADRZ3w3tOFFQp0e7Fq8n\n5zlxXyd4Tu2nrZ7chiCI2+tHtJmyl+fQZLhfDynk/nLhyKWknG4zjh4I62KKvLPer/eCi6Ja\nHQMHd5GTBbfO7Dvze0bDIWsubyj/AiycY4dz7GjWwjl2FZhjh0fsEELov0f5Yl2h3lCjv/W1\n+By6R2za7RG3Jfb2iVilhpTXbtQ/bP7wkV6m9E2j+AkACp6ev/jUsmIDCFg9GQDALXjLT47N\nl26MO7p7c56WVduj9dzosEkDWxVFtgw5eLLKyhUxh/ZuWaM0cOq4twhd9mVYcM9KGCtCiAFM\n7BBC6L9HVGfekaR5ZQTIW/tM2e5TSt2VR5JWmpd42lu5ksm1+8jY7iPLaKKt//SD/tMBQCwW\nGwwGpZLuAokIocqDV8UihBBCCNkITOwQQgghhGwEJnYIIYQQQjYCEzuEEEIIIRuBiR1CCCGE\nkI3AxA4hhBBCyEZgYocQQgghZCMwsUMIIYQQshGY2CGEEEII2QhceQJ9dHzcqpWxAF9JPB6P\nx+Pl5OTQjGez2VKpFACysrIMBgPNWvb29gqFgtESiiwWS6VS5efn06zC5/M5HA79tSA5HI5E\nIgEApgt0Ml1CkaKowsJC+usWCAQCiqLoP4NcLlcsFgNARkYGzSqmBTqzs7P1ej3NKnK5nCRJ\npVJJf4FOoVBIEAT9Z5DH44lEIqPRSH+lUZIk5XI5o5ciQug/DY/YIYQQQgjZCEzsEEIIIYRs\nBJ6KRR+dow+TGdbQAtA96/c6PqWAYRMAmSkM49MZNwF0z/O+jU9mvqx7JsOHNzONeRN0zya/\noQWge7rzrQymA0ll3EQm3fP7b5T6UvS0ZzNuHSFki/CIHUIIIYSQjcDEDiGEEELIRmBihxBC\nCCFkIzCxQwghhBCyEZjYIYQQQgjZCEzsEEIIIYRsBCZ2CCGEEEI2AhM7hBBCCCEbgYkdQggh\nhJCNwJUnEELog9IqLvi3DbB6F9d+0N6r6023C1/8tGf1xl9u/JadUyiuVq+dX0jAqAF8iihZ\n69HaWRfcJs4fXq9YqVFTp1pNpd5gXkaQvLTU52YFhvPbl6zZefT+k3R5bZceQ6fMn+j1TmND\nCP2/YWLHzMMtE2cmpO0+clD6Zvd6ZvKITf/krzxwpAGPMpXcmT9q4T3y0KFtLCt7YACAYQMH\ntN/47WRnUdENmq3fO7//4KlLj56l6CmBY02XT/oMGdK9oemu/OQXeTzHajJOyVqavAdblm27\nkfhKVL3h8GkzPqkjtrrx218FzX+YXbL8yPETbAKYdvW99Bwhm0Syq3buO8Cy1Ki7nnCKX93D\n9J8683xo3y/SdYI2A/3qVmE9vvbdmVUTbly4s23/AovUzqBNXh+7T+Tvb5HYaRTXlHqDY8fP\nutWy02g0RqMRAAiy2MpjcSFdQ/cnNuzcJ+hzl5Tbp2IXjL5yf8OjwxPe94gRQh8OJnbMOPdt\najx18nhGYaCTAACMRtW+l/lGo2F/YvbXLRxMMef+Ugidx5SW1VXYPycWfr3jbne/L3xHuXAN\n+Y9/vxa3YdbD/NWRA+oBwJV5M+ObR24c716y4p5ZSxLdRqyd3vbRyeWrZ0d57l1UWtd4dt0i\nZ/awKHz3gVS45wjZJIrvMW3lZovCZ3sDrp13mrot2PTv1ZCv0jXGEd9e9m7pCAAwZc65aZ23\nnN6+6fbEkNZOphijNu/5g1tn1kx/pdK6lmhFlXMeAHqu3rCnbf2srCyDwWARkPHL/ND9ie2+\nOhw/8xMAAIhoO7RF+HchxzO/8Hbgv8fxIoQ+JEzsmBFV8+OSp+5eSQv0rQMAhWlHsnWswPr8\n7w8kQosuAKDXvLyu0LgHebz3pmMP/ObcLXLy8Gamf92btGwoeBIa9w0MiC674qVkZfs5nlXs\nhJJ+n2kOrFLojVJrZ3MAgGRXady4Mb3uGPRGspTNvLeeI/SR0ObdmL/0xxZzLjSRck0l8YlZ\n3CqBr7M6AACq67xFW04H/BH7J7R2AgC96vHQll30BmNp28y9/wcA9JKXmqIdm76Xxa0dF+pZ\nVDJ84wr94b8JnWUKiBD6D8HEjhmCJesv55+5cB986wDAy1M3+FW8uwY8/nbpXr2xC0VAQepx\ng9HYvbUDABh1WUe2R1/+9eHLbI1z/abeQWO7u8usbjbtzukte+KTnicTQvuGbXuHfjlIQFom\nTQV6ozo71bykVp+Jc2pmGQGiR/qdzFJB8szBVzsd2hNmUXFEE/m+bRe+jOx9OnqvtIFvaVkd\nTUE+3j0jJ/2yasuTXL3Uqf7wGRH1XxxduetsaiFZr3nXyLDRkhLbr3DPEfpInJ08Qe3gO3PI\nm+NuBpXBuU5dt37mMQRLDgD6Ar3pX5JTLWLHAQDQqx4tHP91yW2mXEwlSI4nP+vEwfMP/ky2\nq+nWo1dHGavogjnD6r9yJfXmy8yOyfPk3ceO7W5vL3jf40MIfTiY2DHWsavTdyeO6Y39KAJ+\nuJTq3LeTrGFbg+ar77NU3va8lPOJFLd6dzsuAMSFT00o9Bg7JrSmhEi6fnLdrHH6TTt7OVvu\nNHUFD0IWbPEYPGHuBBd1etLqFdHza7SN8qplETZqQJOv9m34Yvq1rh3aNGvatKFLTQ6vXuvW\n9QBgVHRc1UkjE5qErxnbsGSHu82avW/EV19O2Cus/dnKqBFlDM2gTU9MTDQvIVkyN5eqFmHH\nlnw3euaiZk7kiZULNs8KkTftOnP+SiLj18hF0cuv9V/YxTKeac/Pnj378OFD020ejzdiRFl9\nJkmSy+Wy2ewyYsxRFEUzEqEPI//RupjrKYOPRrxNsUjempOXLMJSTkYBQO1hdU3/EiS/SYfO\nAKBT8gGAZPGFQqF5fPLPmQTJ6+XR6s9cjamEX6XZ2mMnR7SQA4A275c0jd61faPre5cu2njg\n/tPsaq5NOvYZGhUxhiAIAOByufTfLCwWy2g0WnSg7HgAIAiCfhVTrwQCxkknl8s1NUcHRVGM\nemXa8zCqQpJkBQYOADwej9GOjsPhkCTdH74wPUQURX2YgXA4dCdVkyTJ4XAYvRSB4UAoiiJJ\nktHATTf4fH7JGQ5l1GL6UgQAFotltWNlt4uJHWPOvVrpDx++mKv+lJ+WkK0O6laN4vO623F/\nPPvKe2i9X6+li2qOJQFUmcePPMpdvDe0sZANAPVdG+tvDt+/+UGvhW0sNqjJv1NoMH72eVc3\nGRca1FsYLnvFtXJ9g9vQeesbXfnhp5u/nj94ePdWiidt3Kazb1BQM0cei8PlEATJ4nC5lm97\nvep59NLlaueW+pe33bw/dWSTeX/9/pJVz72OlcsgVDk/hIX9YF7Ck/c9uHOcRVj90bM/a10d\nAPy+dD0VdntueFBtLgV1nH0c4i4/yIUSiR3Tnl++fDkhIcF0WyaTjRkzppSn4jUul1t2AEL/\nZvsmbhLVneTfSF5GzD/n1kfO/4nr0GNKt5pWAwgWl88vdtb1YqbKqC9oPGXPxWnedtqMK8c2\nBE5cNbFX767pd134LFCmAUDKtXEDdj/v6Ttsiq9d0k9H45ZPPXc95fnlpSwC2Gw2/TTChP6H\n1us+E4RFn8vFNB4A6OcQJhRFMR04SZL/woGQJPnvHAjTPTbTgQMARVG2PRC9Xl9GLUzsGONX\n8RFRRy7ez25lvw/Y1frLeQDwWWfHiHM/gn+N7zNVNUc0BID8F3eMRuPsoYPM6wp1LwEsEzu+\n/YCuLueXjBrduFWLRg0bNm/Vvm1t62dsazfrEtysCwAUZr28+8vN+EMH5k24u+bbDbW5pX2b\nMUZPC/ulmtf2tUPybsWMXTqjft3t0q0r4sTTd8xrVjJaUGXI/h3Dy30E7BpKTDdYQjbJrlLU\nuoQiwWh9xg+jnsvl8urVq5tuS6XSsl/BFEUZDAZjKe2WRP8rLEIfgCJxacJzRf/Dll+fiqjT\n7+5bMOv7c7/zq38y52C0qLSpFEaDxTtlVOyB4dx6vT51I0nSYKjR84ulPxJ3PcacG7X3z4sj\nXXVaJQDk/fnPsot/TetsertFxQ51H3Pom0k3p25p71SBtxX9oxcEQZiqlP3uLlmFfjy8OeZR\nqQMxHbUyGo1Mx44Dod8xo9HIKL6yB1L06mU0kAp8VJUxEIPBUMZRTEzsGCMokU8VQXz8k795\nDyV1A0272Rr926vij/6Vap+rM4xubg8ALCGHoIQH9sUWq0ta+f5EUJLQlTsHJ96+e++PP36/\neHT31sYD580Lam4eo1FcXbHhUuCMsBocCgD48uodevm07uw2yD/823/yZrvaWe2qJu/G6Zf5\nkct8+CTBbzcqwvvhojnhAp2i+bwa7+nBgHJ/47oCPQ8NDQ0NDTXdNhgMWVlZZWxfJpMplUqN\nRkOzuxKJhGYkQh/Apdl72ZLOAR721u403tkdsXH5rlyD0HNcVHDIcAmr1LebXq3Izi72c0WN\n27YDgJycHLlcnpOTYzAY7HrMADj3aOvv2QOqqJU8AJDWnTPSQ1BUsc+iuXAo6MzS+3DcqaCg\nQKVS0RyFWCw2GAxKpZJmvEAgEAgEBoPBos9loChKJpPl5OTQ/2h0cHAAAKVSqVaraVaRSCQ6\nna6goIBmvFAoNJ2Poz8QFosllUrpxxMEYW9vDwD5+fn0d3RSqVSj0RQWFtKMF4lEPB5Pp9Pl\n5ubSrMJms8ViMdNnEADy8vK0Wi3NWnZ2diqVitFLkcvlarVahUJBswqXyxUIBIyeQTs7OwBQ\nKBQ6nY5mLZlMVlBQwOilyOFwNBpNXl6e1QDTy9sqPHpREa17Vct7euJgUk7dIY1MJXwnXznL\nsPHoaRavjqeUAwACp95gKEjI0vNe4+5dPHfjxZSSW8tJPLYt5kjNhq37+wWGzVu2epzr7yd3\nWsRQnGq3bt48cCfTvFCvygGAqqLSD7YbdACQXPj6ldcycL4blVpAOU5qUtZJn/ergj1H6COg\nzbsel5RVY2iElcNwRt2JGT0WL4nhtQtcfP7OlGkBZWR1NLF4dQHAoNEBAFvUgiIIYe1i1+9z\nJB0AQPnU+gcJQug/AY/YVYRT147a3buTAJY2en3OlCB4w2qJ1ye8krl/ZdpFc8StRze33xW2\niDfW17266O65mO8TM+eGOZbcGlta+P2xfflC2edtGhDK5PhTL4U1vC1iKF698P5ui6OmcH39\n2zasK+QSOcmPT8XtEdftE1hNCAAkAYWpr7KznWWyt0ekONJOHeXr98xeLhnv6wjZl4/t/Iuq\n5wqPV5z4M8K75O9eWbl4AgDs6rtW41T8goOK9Ryhj0HqiSV6o7FPQP2Sdz3dMWxXfGLTsVsj\nQ/tX4Dr2grRdA4bvcZ+4faNP3aJCdfYpAHDqUQ0ASJbM25539s+rAF2LAkw/fefQ3spuCiH0\nX4GJXUXw7PvLWHsKhB08BG8fwKZ+dWHp3VoD3yZM/SJXq6M3HNoSla1l16jXNHTpnObWjlEJ\nnYfO+0Kx8+TOWfvyhXYODZr2XDLBp2RY29FRc2vt++5MwurjaYU6QuZYo3nXEdNG9DddSecx\noJ06Zv34GZ77d0wzq0SGrlkQuyEmZuXcQkLo1tJz2dZAuydxwV+HH3HfMcjd8jRoyYsnAKDH\nlr0VXnDiHXqOkO27sfNPlsCjm0OJKz0N6tUbbvKrBVcsqwMAnqxfxh+zvps5fUbfQ6bj80a9\ncnvIcoJgTRvzeh81ZXzjo4vWRv0wIqxbbVOjO8YuBIBRM9//z3AihD4Ygv58BYQ+vMqYYxf/\nJLP8OIQqmVGXFdCsKbfhxh2HLZcX02R9N7TjREGdHu1aWM69s2s1eYRvXfMSnfL2kFb9XUee\nurq82IVZj3aHdJ5xgOfQZFSQF0+VfOv8kUtJOd1mHD0Q1sUUYNCmB7dpe/qVuuvAoa3qiH6/\neOjsr+mNh238fc94giDy8/M/wBy7st/d5kwztDIzM5nOscvLy6vsOXZ6vZ7pHLvMTLp7oaI5\ndgqForLn2Gm1WqZz7Jg+gwCQm5tb2XPsNBrNB5hjl5OTU9lz7NRqdQXm2OERO4QQ+j9QvlhX\nqDfU6G9lMT2N4icAKHh6/uJTy7ucYZhFYlca18D1P1VvtXRj3L7oVQoNVduj9dzosEkDWxUF\nkOwq2386s2LOggNnjl2J11at33TyN2vmjOpV4REhhP4NMLFDCKH/A1GdeUeS5pVy18ojSStp\nboclbHUk6ZWnvZVpHq7dR+7q+YVcLre6ViwAsEWu4Wv3hNPuM0Lo3w+vikUIIYQQshGY2CGE\nEEII2QhM7BBCCCGEbAQmdgghhBBCNgITO4QQQgghG4GJHUIIIYSQjcDEDiGEEELIRmBihxBC\nCCFkIzCxQwghhBCyEbjyBPro+LhVK2MBvpJ4PB6Px8vJyaEZz2azpVIpAJT2c/9W2dvbKxQK\nRksoslgslUqVn59Pswqfz+dwOPTXguRwOBKJBACYLtDJdAlFiqIKCwsZrTRKURT9Z5DL5YrF\nYgDIyMigWcW0QGd2drZer6dZRS6XkySpVCrpL9ApFApNq7LSjOfxeCKRyGg00l9pFCH0scEj\ndgghhBBCNgKP2KGPztGHyQxraAHoHhx6HZ9SwLAJgMwUhvHpjJsAuocD38Yn0z2K9lYmw4c3\nM415E3QPOr6hBaB7VOytDKYDSWXcRCbdw8BvWL4UrS4RixD6mOERO4QQQgghG4GJHUIIIYSQ\njcDEDiGEEELIRmBihxBCCCFkIzCxQwghhBCyEZjYIYQQQgjZCEzsEEIIIYRsBCZ2CCGEEEI2\nAhM7hBBCCCEbgYkdQgghhJCNwCXFEELoQ9AqLvi3DbB6F9d+0N6r6y0KH62ddb36uCDfuqVt\n8NHaWRfcJs4fXs+i/MmF2Mg1u27c+0upY9V0ax40edGkgU1Nd6lzztdwGWp1awKHwf8kbqI7\nGITQvxUmdgAAVyYMX/7CymKgBME5fvxwkI930/Vx06uL37GV/OQXeTzHajLOO27nHZt+l+Fs\nHen3c505O+Y1oxOsLbg3yH/O4v1HmghwOUuEgGRX7dx3gGWpUXc94RS/uodFsUGbvD52H+k9\nuLTEzhQg8ve3SOxSry7pOHQNS+7hP3JiFSr/2vG9c0d/evmfH/ZPbgIAJKfqwIEDS/RBG3/i\npLBW43cYHELo3wITOwCAptMilqh1AGDU582JWOo2PshA8hYAACAASURBVDyophgACOJ9nqq+\nMm9mfPPIjePd3+M2//1NI4RMKL7HtJWbLQqf7Q24dt5p6rbgohKjNu/5g1tn1kx/pdLWsLYd\n8wDXEveuGL+N4Lufv3PWzfSFanboEPfml5aNVE36hUcSbEHj6OhoiyqJMUNPnKq6df+odxsf\nQuhfARM7AACpi7sUAACM+mwAENdv2NjV7v/bJb1aSXGFzKoYjBRJVFJ/EELvnTbvxvylP7aY\nc6GJlGsq0aseD23ZRW8wllal7ACDNj0uRenYMcLtzWFykl1lTueqP8Q//TlP6ym1crpAo7g+\nKOJit8WXusi47zwghND/HyZ2tBh02buWLjx9509S4ND+sy8mD+0AAEZd1pHt0Zd/ffgyW+Nc\nv6l30Nju7jIA0OQm7di46/rvfys0BgfnBr2HThrcqcbWkX4ns1SQPHPw1U6H9oSVVnfYwAHD\nonekxay+eJ8fF/e1eR/06pd7NkZf/CUxV0vWcmnhO2ZCl7piAAjy8e63dlHi0qjbLxUimVP7\nPsEhQzqYV7Romulw6LA65GIBisS5EyMKWgevmtyXIt6pLYRsxtnJE9QOvjOHvD3uRnKqRew4\nAAB61aOF478uWaW8AHLNunWSei3Mi9Kz1QTJqcenrPZhV/C4QsfBO4Pc3mkkCKF/DUzsaLm9\nMKLPkIkrgqs/v3lw6Y6l1XoeGOzAjwufmlDoMXZMaE0JkXT95LpZ4/SbdvZyFuyaOf+auMuU\niGA5R//gUuz25dM92+wbFR1XddLIhCbha8Y2BIDS6gLA1fXzm3kGLQ2qX7wLxi3Tvrqsqf/l\nlDnVhdrrx3esmjFFHhftIWABQPzsqG4BIcFNq7+4eXDpjqVVPt3v7ygoqmnRNNPh0Hl8rA5Z\n/uZeTV7SvImRRVld2cMHgP3799+9e9d0WyAQhIWFldE0SZJ8Pp/LpXuwgcXC1zz6V8h/tC7m\nesrgoxEss+PsBMlv0qEzAOiUfKu1LAJItlAsNp8vKx4zZozpVkFuVlZmys9ndo26keI6ZGdD\neytnIbLuR82+nDznxkp7yduNEAQBADwej82mOzuWzWYbjUaSpDt3haIoU0PFO18WU6/EYrHR\nWOrhTKt4PB6HQ3dmM4vFoijK1D2a8QBAkiT9gZAkyWjgRRjt6CiK4nK59Hd3pkiKoipvIKZn\nEAAEAoHBYKBZi6Iopi9FAGCxWPQ7RlEUo2fQfCD0X42mjypGL0UAYLPZVjtWdrv4IUeLrFlo\nUM9mAFBjwLTqey4nZqlVxNkjj3IX7w1tLGQDQH3Xxvqbw/dvftBrYRvH3oNDuvdrLeUAQI2q\nfttOLHis1jmJuRyCIFkcLpetyjxeWl0AyHUa49+jqUUHClL3nXmRPzV2zqf2PABwaeTxYNiI\nbUf/WTOiPgAI288I6tUMAGoOmFb32ytJ6SowS+xYnLdNV2A4dB4fq0OWUwAAGkXS/JkL0hoF\nbH2T1ZU9fAC4f//++fPnX3dVJouMjCy7dfrveYT+PfZN3CSqO8m/kbz80NIRFLu0D/vRTVz2\npCkBwKnDxJtxAVzKyjyNRX6rZG6zFrVzLnkXi8Vi+i2Ifj5kQhAE/UzFhP7nYpEK7B8+wECY\nxgPzgZAkyfQZJEnyXziQCrwUP8xAmL4a3+NA9Hp9WQ0xauOjVf2z2kW3JRQJAPkv7hiNxtlD\nB5mHCXUvAdp4efe5d/Pa0WcvU1NTniTeKrm1MuoCQLXuNUtWyU28R3FrdLPnmf4lSL53NcHG\na89gRH0AqNqzePfK+wrBaDjlbAsAAMoY8tZp8ww8Mv/J06JOldtW48aNdTqd6bZAIFCr1WU0\nzeFwdDod/e9/mAWifwNF4tKE54r+h8e943aMem1pb5Avt+7snpb88M75Nds2NepO3TsdJSw+\nBzfzt8hNj3MnX51ksQXTB4lOpyv7w8Oc6Yhd0du2XBRFsVgso9Go0WhoViEIgsPhaDQa+sdI\nTAPRarWM9g+MBmI6wsdoICRJstnssndrFio2EIPBQP8ZNA3EYDBotVqaVUyJI9NnEBgOhMPh\n6PV6Ri9FkiQZDcR0jLYCA2H0any/AzEajWV8/cDEjha+wPIRZAk5BCU8sC/WvJAg2QZtxqIJ\nkx4JG/Xu1NyjjXtPr09CJy+gWdd0QyC28qQYjQBQbKdMkgQYX7832KXMnnn34dDZWtlDdvp8\nRoQXFThy8ZKEgZF9atJpy9/f39/f//XGDYasrKwyWpfJZIWFhfTfkxKJhGYkQpXn0uy9bEnn\nAA/7d9yOQavMy7PyU00A4Na5qxuAl+/wIQ29W0xdN/bsmC2dqpoH7Bi1gyvtEu7CtdgCh8Mh\nCEKlUqlUKprdEIvFBoNBqVTSjBcIBKbErrTOl0RRFIfDycvLY5rYqVQq+lmURCLR6XQFBQU0\n44VCIZ/PNxgM9AfCYrGkUin9+KLDgYx2dFKpVKPRFBYW0owXiUQURen1evodM50lZPoMAkBB\nQQH9rMvOzo7pS5HL5ep0Ovod43K5AoGA0TNYNBD63wFMH1WMXoocDker1ZbWMR6PV1pdXHmi\nggROvcFQkJCl573G3bt47saLKfkvdtxO02xYGREw2MuzQ6uasnz6dctozq6Rh179/Mfs1y9u\no0F1/KXSvl3tMqq8l+HQqVv2kP0GteZI284b7Hpne+TDQt07toWQDdDmXY9LyqoxNMLa2dF3\nUph2af/+/T/nFfv4dx06DgD+OJtsXqhRXFvwIMsleB4Lr6RHyLZgYldBHHHr0c3t94QtSrhy\n++njh8e2zvo+MbNbJ0e22MVo1H13+V5aRmrSnR+Wz9kFAM+ScwwAJAGFqa+ysxWl1S2jOYHT\nsJ7VhVvCoq7cfvA46bc9UdOTtNKxfnQTu6KmmQ6nZKQ2/1licUZRqUMu4uY/v6UgP2ppAqO2\nELJJqSeW6I3GPgH1yw9lSFOQEBISsvjCK/NCvfoZAHCL/5rJk4OLdEbj6DEN3nsfEEL/X3gq\ntuL6Ra5WR284tCUqW8uuUa9p6NI5zUVsEPnMG5m2LW7ZyQKqjkuzYeEbZasm7Q+b1GrfPo8B\n7dQx68fP8Ny/Y5r1umUhJ6xeJt4YvX35XIWOrOHSKnTFhMa0V3Qwb5rZcErIebTN4irVTYe/\nszrkZtvDi2IIUjBlrm/g9G27/+gU2EjGfPgI2Y4bO/9kCTy6OdC65JwRkfMke3bsb5FLcvtt\nlZqOxRm1uyZtBQAf31rmkSe3POIIGw9zfP99QAj9fxFMLx1H6EOiM8dOqVQymmMX/yTzfXQN\noYow6rICmjXlNty443CJ5cXM6JS3h7TqX8P/+7XzWpUR4Dry1NXlxa5wurPer/eCi6JaHQMH\ndxHpcn794ci5exkNh6y9vGFYUYxBm9WgVkNe4y1/nCuxvBiAvb09QRD5+fmVOsfO9JsXZb+7\nzVEUJZPJMjMz6X9mOTg4AEBeXl5lz7HT6/XZ2dk0q5jm2GVm0t0LEQRhb28PAAqFolLn2PF4\nPK1Wm5ubS7OKaY4d02cQAHJzcyt7jp1Go1EoSj1DZcE0x47RM2hnZwcAOTk5jObYFRQUMJ1j\np1arS5tjZ3p5W+8hzTYQQgi9O+WLdYV6Q43+lbW+X8uQgyerrFwRc2jvljVKPbuWW7OvN+2c\nMqQDmF2HqHi2Ok9ncPVtWEl9QAj9H2FihxBCH46ozrwjSfPKDWMJWx1JelVugKe9lTkMbf2n\nH/SfbrpNkqRcLs/KyjKf82pXf2F6+kImvUYI/WfgxRMIIYQQQjYCEzuEEEIIIRuBiR1CCCGE\nkI3AxA4hhBBCyEZgYocQQgghZCMwsUMIIYQQshGY2CGEEEII2QhM7BBCCCGEbAQmdgghhBBC\nNgJXnkAfHR+3amUswFcSj8fj8Xg5OTk049lstlQqBYCsrCyDwVBuvIm9vb1CoWC0hCKLxVKp\nVPn5+TSr8Pl8DodDfy1IDocjkUgAgOkCnUyXUKQoqrCwkNFKoxRF0X8GuVyuWCwGgIyMDJpV\nTAt0Zmdn6/V6mlXkcjlJkkqlkv4CnUKh0LQqK814Ho8nEomMRiP9lUYRQh8bPGKHEEIIIWQj\n8Igd+ugcfZjMsIYWgO7BodfxKQUMmwDITGEYn864CaB7OPBtfDLdo2hvZTJ8eDPTmDdB96Dj\nG1oAukfF3spgOpBUxk1kWj8MbHUFWIQQogOP2CGEEEII2QhM7BBCCCGEbAQmdgghhBBCNgIT\nO4QQQgghG4GJHUIIIYSQjcDEDiGEEELIRmBihxBCCCFkIzCxQwghhBCyEZjYIYQQQgjZCFx5\nAiGE3p3hzp5vju4//uSfdHHNBi19JgV90Z9LEnQCtIoL/m0DrG5U4DD4n8RNpts5iWcWLN10\n5vpvOVpO/aYdRs1YGORZ622oUVOnWk2lvtjaxATJy0h/+Z4HihD6d8PEDiGE3tW5WT22HEuq\n3a53rx4Nsn5LOLPiy3uJ6vUrB9MJINlVO/cdYL61KhwSjNr4EyeFtRqbSrL/iG3fI1xBOfuP\n/LIWNzc+Lu6rwedSD9+Z2aWqKUCjuKbUGxw7fNapKr9oOwSJS5Mh9NH5jyV2G4L8fnOL2Da7\nSVHJ4/ObQ9cndB0bNbWvu5eXl/e2/V84Cd5LW+qcc4MD128/csyRXbknrO+d33/w1KVHz1L0\nlMCxpssnfYYM6d7QdFd+8os8nmM1GadkLU3egy3Ltt1IfCWq3nD4tBmf1BFb3XglPWJMK1Zs\njAj9J+T+tmjLsaSGkw4smtQFAADmuI9rs+PU1J8jvNraccsNoPge01ZuNt+gpz07MWboiVNV\nt+4fZSqZNXheLmF/9NdfvNwdjUbjpGmjgtt0Wzdq8tSHBzkEAIAq5zwA9Fi1bm0D2YcbOULo\n3+e/Pcfunx+2Tl+f8OnYZVP7ugNAnz593Pn/sVT1nxMLv15/qEqrfrPnRy36enq/Fg7HNsxa\ncPyx6d4r82Yu2v/YasU9s5YkVum9dvvmoLbq9bOjjDSbe0+PGKOKFR4jQv8J1yL3U9zas8Z3\nLirp/k1UcPh84s2J0XIDLGgU1wdFXOy2+FAXGRcAVFnfH00rqOu7rVuN11+l2MIG36ztrM6+\nuOFFnqkk9/4fANBTzre6QYTQx+M/lgaZ++fHbVPXnvp03PLJn7uaSsaPH28RozcYqWLTXD4Q\nvVpJcYV0ImMP/ObcLXLy8Gamf92btGwoeBIa9w0MiC674qVkZfs5nlXshJJ+n2kOrFLojVKq\nnJG+x0esZMUyVHiMCP0XGA4/zhXUjhCZvQE5sm59A7vRDrC0K3hcoePgnUFupn/ViusA4PiJ\ns3mMnUd7gHM//JQWOlQMACkXUwmS48nPSjh+5VlynqyWe49eHWWs//ZXd4RQBfxXE7vnl2Om\nrT756ZfLJ/dxLSr0HTDg8+h9XzgJgny8+61dlLg06vZLhUjm1L5PcMiQDgCgVz3buXb79d//\nKORW+3xkaNLmr2qs3jWuqjDtzukte+KTnicTQvuGbXuHfjlI8Ca5yXl4fv22g4nPsoVV6342\n+Muh3RqAUes1YNCImAN+Dq+/HAf5eLfasGeys2jYwAHDonekxay+eJ8f4Zn69U+NDu56nQDl\n/r05cPqPmw7urc6hzAdSoDeqs1PNS2r1mTinZpYRIHqk38ksFSTPHHy106E9YRaPwIgm8n3b\nLnwZ2ft09F5pA99ys7oKPGKqzGN+wTHmGxFVG793ax/ziv9j7z4Dosa2AACfJNMLw1AFQRSU\nYgELWFbFDnawFxTE3rAXwK7Y6ypYUGyoYF11Leyq69rLil3B3sCC0mGYPu/HIA5FSFxx1Xe+\nH7tj5tzk3iQTTnJvEp06bf+myLM3HiSnK60dXH0DhrZyLtoT9MVtROj7p8m9laHSWNe2vxUT\nFrv9txdJGVL76i7Nug0YG6DP5MoMKCLn4erQs28m/TWH8/FLFq8KAKT98wH6fgrLe3MfANKu\npkEfBwB4fuUDQXK9ano8yVLqA3hmtZbG7utbx6xcm48Q+t78kIld8rkt45YfMqk3xTBHKeJI\n6OKW/YMCXSsmXdmzMGqheYvY3hb8TZNCzrLqjZ0yn6dI3rVmyiOZygZALbsXNHd9jR4jZ42s\npnifuHJZ5Byb+os7599uFjZ3b4ehg/ysuHdP74n+daLaelt/p9IuxV1YM8fNM2BhgIMZ97Li\nyPobOYPriNgAcGPTFeOqg4pkdQAwyKfW5JjwgRMvNm/k4ebq6lLNlsOzd3e3B4BBkdEVRg+I\nqxWyaqhL8QW1DA6N6Td5+MhdQru2yxf3K4811sus7ZYt+iFBIH9/eWJIZL2uNYuUig4ZF5dX\nY+iQCbZGROKlo6uDh2nWbvWyLjT2jmkb165de+nSJf1nkUi0Zs2aUppGkqRQKBQI6I72o6ii\nmwChf0OjfA0A6dfGzjvw2tW7SwcvSfL1Y6cjQ2/Ev47cEUoRZQcUETNqrdRxysKm9gVTJEaj\nXEWzE3aNfbTkVh0AgiCMBLIpo04BgCqLZWxsDAAX0hQ6jazWmG2nxvoYqz6cP7w2MGjVBJ8u\nrd/EmwAYGRnRbxFBEAAgEAh4PB7NIhRF6XQ6NpvuvRokSer/q688/VpJJBKa8QUEAgGfT7eH\nmqIoFovF4dAd8vtlDSEIgn58AaYHOoqiuFwuzXh9Q1gsFqOGfMEWBACRSKTT0Rw9BBRFMd0V\nAYDNZn+DhojFYvoNIUmS6a4IABwOp8SKabUlj+LQ+/ESu+zne8Zee9zSu8qfJ9ZeTqvX0KTk\n7S1sOCnAyw0AbH3GV9l5LvG9XEYcOfYqd9bOoLoiNoCT3ezn/ccfBABlzvU8ra5t++ZOUi5U\ntZ8XIn3N/XQjgmPQvF5NKwCAc426sgS/uDXn+oe3LaV6mZZDerd2BQCAdvVEUTFn3tbpYKtV\np25KzGi0uEHxeKc+s9dUP/fX+Ss3Tu7Zt30DxZPU9GjSPSDAzYLH4nA5BEGyOFxu0cOlRv4q\ncuFShXVdTXK8k28LCzaZ/fh2MsveubLoK64xwsLE1JQHABpl8pxxW81bjZ/obWtYRJ56aP/D\nzPm7JtQUsgHAwbGm5opf7Lp7XvM8/k0bX79+nZCQoP8slUpZrDL2UszV0H9Ip5UDgPxFckD0\nlU7u+ntUZ/41vnHE8fBNt4cMczMvM8BwblkJC+NeZY3/Z1Lh3d7ot02DHPusb2TfICCggzmZ\nfmp3dIKoOsA/LAFXHzl0215/roNXC/2Zm1GHYcvOse84D/pz2L6XZwIdy/wRFUeSpP6PPU36\nv45Ml8K0Yl/QEKbHhy9oCEEQ2BD6/m8b8gV/qj7XEI1GU0qpHy+xy3v/2H/Wmm5uRro7AauC\n12/dMJZHlNCdUaGNXcFnI4oEHaTfuU7xHOqK8hMIsW0HgIMAwDf1aV7t5IJBg2vWq1PdxaV2\nvYb17T51Jnasa1rwuXlbq0M7zwGUlthZtfqU+vRpbTV9/x/QYXDa7chclvWgqiWfNNu5NQ10\nawoAeWnJN69dObJ39+yRN1ftDLfjfm4n0EWOn3rNqvOmX3tl/7N56MJJDlU2STYsixZPjJrt\nVjz6i9fYx6Upt08LeWbeZuOoZkWK5CRd1+l0oX26GU4UqpMBPIpEMmqjp6enpaWl/jOPx8vL\ny/vMesgPUCqVpZ++GKJ/Lo4QHSTbBACElYI/Jm0AQDadNSvi+MCbGx7AWvMyAwzndiZ0F9uo\nyZzqoiK7vVXn5df2VJ0esfvItpVZpEnTzlOvzbSrZh/ArUDqIz2aNQcAw1IVOk4H+PNhZAIE\nOsrlcvqXFvQXFVQqlVqtplmEw+HodDqVSkUznsVisdlsnU4nl8tpFiEIosyjQRH6hiiVytL/\nChricDharZZ+w9lsNovF0mq1CoWCZhGSJLlcLv2G6BsODBvC5XI1Gk15N4TD4TDdggCgUCjo\nH7G5XK5arWa0BSmK0mg0SqWSZhGKothsNv2G6LcgMGwIj8dTqVRfqyFarVYo/Gzn4Y+X2JnX\nCe5W2wwAhiwYf3nggunRrZb51yoexuYXzRh0Si2AQUJDUB//bzRh+dYeCfE379y/f/v0ge0b\nanaZPTugdv63BnNgidgEUUIiojI4YgrEn1aprW9n+cHwu7KAh1F3LRtN4RW7KUGZdWFZ+Bn/\nSVNtOBQA8E0qNvLq6t7EqVvvkJ0vskMdS74yrMy+fDw5Z+aSrnyS4DcYNMP3Qdi0EIE6q/Zs\nmxLjv3iN6Z1bP+Xo64rLNw8qng6yhByCEu6O2WI4scijs76gjV5eXl5eXvrPWq02LS2txIrp\ncTgchULB6DdMMxIhOljCOiRB8GxqFJoobggA8uRcOgEFVNmXohPTKg2doZDlFv/ratPcP7bt\nUH03VmpqavrDiQBg0cQoNze3WCwAgFZbAQA0ebkAIJPJGP0FIghCoVAw+lOn1Wo/V5PiBAKB\nPrGjX4SiKB6PJ5PJmGaoCoWCfrJCUZRarZbJZDTjhUIhi8Vi1BB9Vy/9+IJ8SC6X0z/QsVgs\npVJJP30UiUQsFkuj0dCvGJvNZrPZTLcgAMjlcvrnAGw2W6lUMtoV9fkQ/YpxuVyKohhtQX1i\nl5eXx+jkh+muqN8bP1exUhK7H++eKeLjfV5caf35Qz0e7Z915EU2nYLGtapr5E9u5ebvT7lJ\nR/UfMhIObty839bFvVNP/6mzl6wc5nj76NaCUsdufsoqzh58JajYQv85R51/cFFkXsjRlHyg\n4Unb1Bext564uDMpp4N/CYPbKI7VP1eu7L6eajhRI88AgAqiz49W0aoB4E1e/v5U13+OE/VO\nRlmMrmVSYvgXrzEAeHly1fITqWOWzyjx0prA0hu0srg0DS8fd9f8WRGn336FNiL0gyAo48Ym\nvNynFwwnKjNOAYCRmxmdgALvDi/Q6HTt+jsUX8qeHdGxBxIMp9yLuAgAI9zMAECWsq1NmzZB\nB18YBijSjwFAhTaF7qVFCP30frzEzpBdu9Ae1YRbQ5ekqss+GRVV9G9bSbBs1rr4e4/vx59Z\nuvAGAJAAbEne7we3r9x96sHTFw/vXN57LFlo07ig1NWVM/b/ffXxg9sH10+PeS7rMbYBEGwn\nAfts+J7HySkvEuNXT19LlNSzqdfLu+KjLatIcaNOZiUMmaR49iGdnM4uHhu+89DV67fv3btz\n4eSheeNXiau087cSAgBJQN671+npWYalOJLGv5jwdoQuPRN/LyH+fOSsoMeUvSMrddnhR193\njWU/PTop/HTTIdNdecqMjIyMjIzMzEIZIUfsPri26Y6pYXHn4p8/fXBwQ/DvCaktG1v8+zYi\n9APpMqCG/G147LmPeZVWETdxPgC0HuJIM0Dv8tZHLEGNlmYlDJB/snrO+KDe/3y841X29q8R\n+56ZuoW2MOYAAE/a8cP9u79NmfhMkd/Ro9PkbgpaShCs8UM+e78UQuin9ON1xRZG9J477ax/\nyLTVZ9dPaF5WMDls+Urhyl9XzwsGqcOgaZNvBo2QsEihWZ/ZA7O2Ht0aHJMjNDar6tpmwciu\n+QVY0jmDmmyNCd/1QWlVpWpgaHgnWxEATJ87dOmavcGjflNqdS6thzXN2Pq5Rdr6+Oj2rbLr\n2udzAfUHL55VKea3P+JWHkrJUxNSC5vazfuN79eJRQAA1PBpoNi8ZsQkz9io8YYNmbBq7pbw\nzZuXz8ojhE51PZds8Dd+Fh04PWS/c1Q359Jv7WGwxt78FSfX6s6sm3zm41PxKa7tb3sjDGM6\nzlypiAzfu35xuoptY+86YeG02sWuw31RGxH6YVQKjPLY1XjfUM9H7XtVqyR6dn7/tTvvq3Rb\n3clWTDMAAHTqtIOvc0Quo0s8TRwWNW5t67kdarcYMqgLkXL/YMzBNHbVmN35T1Mi2aa7F3Zv\nMml3szpefj1bSyDz2qn9ZxIzWk464GNG93ZChNDPgaA/XuFHp1EmxZ241dC7vSmLAAB5Wlyv\nwHUrdh9w4H3hoCudTpmRrZMalXY/ed6H33sP2rwgZm8NwY+eQ/83yhxjJ5VKc3Nz6Q89MTIy\nOvIstew4hJjQ5D7asyDs79NX0rNV0sq1mvYe5efXhmASkPN8dkDbyGohpxcFOHmaljBK4fWV\nfdPC1l2590DBM/do0WnKnNC6hZO2h6e2LoyIvnjzUbaKZVfD3W/Y1NFd6pEkaWJikpaWRn+M\nnampKUEQOTk59Ac2icVipmPsBAJBmb9uQxRFSaXS1NRU+n+zzMzMACA7O5v+wCYjIyOmY+z4\nfL5Go0lPT6dZhMViSSSS1FS6RyGCIExNTQEgKyuL/oFOIpEwHWOnH92fmZlJswibzRaLxUy3\nIABkZmbSH2NnbGwsl8sZ7YpcLlepVGZl0e0F4nK5AoGA0RbUP4IkIyOD/hg7qVQqk8kY7Yr6\nYXnZ2SUPndLv3iXXkOYyfgIkJTm1PepcqmCST32W4t2elTFGVXp9cVYHAATBkZbycCidWqXV\n/PHrAZFtX8zqEPq5UcJqfeZv++yVeRoBosqz9yfOLmUR1g26x5zoV3DzRPEAx1YDtrQaQK++\nCKGf1v9RwkFQ4nnLJkasjR17ZI2KFDvV8wwL6lV+i1Nknu7hv4ZkS0esbl9+S0EIIYQQKvB/\nlNgBgNC28ZSFjcuO+xq4khZrV9hxrO0t8HIdQgghhL4JzDnKDcGyqYr3oyGEEELo2/mxH3eC\nEEIIIYQKYGKHEEIIIfSTwMQOIYQQQugngYkdQgghhNBPAhM7hBBCCKGfBCZ2CCGEEEI/CXzc\nCfq/09XJqpT3tBTH4/F4PF5GRgbNeDabLZFIAIDpe5yysrIYvWmHxWLJ5fKcnByaRfh8PofD\nof/KIA6HY2RkBABM3+PE9E07FEXl5eUxeiEVRVH0tyCXyxWLxQDw4cMHmkX073FKT0/XaDQ0\ni5iYmJAkmZubS/89TkKhUP/yLprxCCFUJrxihxBCCCH0k8DEDiGEEELoJ4Fdsej/zoEHbxiW\nUAHQ7fXLj38rY7gIgNS3DOPfM14E0O3n/RT/UCtGVAAAIABJREFUhm736CepDFdvagrzRdDt\nTf5IBcC8u/MD04a8ox/racpmNnOEEKIHr9ghhBBCCP0kMLFDCCGEEPpJYGKHEEIIIfSTwMQO\nIYQQQugngYkdQgghhNBPAhM7hBBCCKGfBCZ2CCGEEEI/CUzsEEIIIYR+EpjYIYQQQgj9JDCx\nQwghOrTXdyyY3rGBXy374e29IjcdVmh1hl+/PbttUb/WAXWr9HSrNrpr9737LhYpL3t6akNQ\nr6AWtXq6VfNo6bMk+qyucMCzU1v6d2perbKNtU3lBq18l+288LmqXFs4edbOp1+tZQihnwgm\ndgghVLYTwa3nh4XLTKt7DRrkZJn3x7LhkybvK/g2/eriMcNCbz0lGvce0c2/j0nW7djp3cMi\nbxcEKFJ+H+s74NSZh1U9u3b171NFlbh0Qjfv2ecKAt5dWPBLn6l/PyJ8B4waN8yvQsatxeN8\ne/16q3hNNMqkoHU7T95MLdf2IoR+UN/Fu2IfrB81JS5l+/49EorQT/ljTL+1L3KW795flUfp\np1yfM2jeHXLv3o0sooQ5KDJO9PBfs2n/QQv2v01VA7r6uq6JnlhRXGakTpMV2NM/TaUdvW2P\nl5T3L5dbQJl9b/2SjZcTXosquviNn9Ss8mdrotMpLhyKOfr3padJKWqCa2nr0Khlp94dGrJL\nWkX/3s5Bva+1XrCyj30JNSmfVYHQdyLzVtj6g4kuo3eHjW4KAADTnId5RB0bd3VG5/rGXADY\nOzkKeM5LTx2z4bMBQDc2aM4v9W9HDFEOvswhCQCInzQrXaUL+vNsM1sxAHiGzRpfr/qu5d1f\nhr4xAQCAZSM2Enznk9f/dBKwAUAbPK67S52zSwPlQfE8Mv8nrVVm3710bt30wY/zVI7/wWpA\nCP0AvosrdtYdXHVaxaEPefp/6nTymOQcnU4bm5BeEHPicZbQukeJWd1/Jf1+ZLoazNnUoT3P\nv+JsdwQvSDD3/nXTuoD6ijWhi3WfCdNpMjeFDl2+43wlj3YTgmeFTBjVsrpJXNTCUfP3fa5I\n+SmnVYHQd+LizFiKaxc8oknBlFaLFgeGzCE0WgDQqd+fSMmV1ArRZ3UAQLDMu9W10ChePchR\n6afcfZ5N8WvoszoAAJLXr11FrSb7ZIYcALSq99Fvc83qzNBndQBAss3HN7BQK15dzc6fg1r+\nxMy8Yq1f2q/96/W3aDNC6Mf0XSR2IqueXJK4eS5F/8+8lP3papa/g+TR7gT9FI0y+VKW0qZz\njf+ujiW4GHWLb95lZB3Tt6e3aL/ebM+8yXXt7mlubOresa0y53aWpuQ87cam6ccei2ZvCB/h\n59vAvbZ7o6bdB08Mn9f37dXt6xMzigRrFLl0Fq3RfmFOWE6rAqHvg3bf00yB7TgR9enMkiNt\n2cF/sIcpHwAAyFELVw4ZV9uwTFaWkiDZVh/7HFzsRJq8hBtp8oJ5xv39lmQZNTXi6uewavXq\nRaF1DOeQmqEkSI49P38OFMf6wKHDJ0+ePH7o13JoI0LoJ/FddMUSLGknE/4fp+5C98oAkHzs\nMt/ct3n/pzsX7tLomlIEyN4d0up0rdzNAECZmRgVse3S7SdZSq2ZdVXvPqN7NLbRzyfjwck1\nG/ckvEwXVqjStsfwPi2rlhKfcv34+h1HEl+9IYSmLvW9JwzvJijo71Cnb1s47/j1R6TArGHb\ngWP6NCpeZ43i5dbnWc7jvByrKFRBR3a/kfWxEgDAnxP9t8m77ozw1YfJ3u3rPWT7pOh9nhKO\nTp22f1Pk2RsPktOV1g6uvgFDWzlLi8+5Xy2TmI2nhs/0Ph65S1K1u4Qq4SqlTpO+PO5V9VER\nbqaF+j2lNXvNnVYJOPl/Cfp28ekbGZWyeeXpu/zo6OmfWxUBXX07/hqWsHBxfHKWSGrZsF1g\nUK9GACD/cCtybezNxEd5LPMmnQOMP7P5ym9VIPQ90OTeylBprGvb34oJi93+24ukDKl9dZdm\n3QaMDdCnegTLtLlvT32wIjsjO/3dw7Ox4bdSrDuEm338MTYM3/Bn576L23do37+bhVi393zM\n7ifyweFnqvFZOTlAsk179+6tj8zLSk9Lexd/cldQfErVrutsPs6BIPnNmzcXiUSKLP43XwcI\noR/Gd5HYAcAvzS1/O3xQo+tIEfDXmXfWHRpLXeprlZN/T5P7mvLenkyguBVbGXMBYNuUORfF\nTcfOCDThaO6d2bJp6URPjxh9zhE2d2+HoYP8rLh3T++J/nWi2npbf2fjEuNN1QlBc9fX6DFy\n1shqiveJK5dFzrGpv7hzJX1l4ufNaNdr1LLAiq+u7FkYtdCqze4eZkWPpCmXNqp0rEENLUSc\n/hac46e3JfYJrgsAHoPrRITsfK3sZM2hAODRjhN8s06eEg4ARIeMi8urMXTIBFsjIvHS0dXB\nwzRrt3pZC4rMuWVwaEy/ycNH7hLatV2+uF+Jqysv9Wi2Rtu5gXnxr2o3KJSGXlgzx80zYGGA\nw+dWnSWHBIAjoYtb9g8KdK2YdGXPwqiF5i1ie5nkzQqal2TuMXz8LGNd2qGoVWdT86xLqsxX\nXxXz588/deqU/rOxsfH+/ftLXAl6BEGIxWUPiDSMpx+MEABolK8BIP3a2HkHXrt6d+ngJUm+\nfux0ZOiN+NeRO0KLnHmtb+t+NlUGAMa1Axct8i2Yzpa4d/ZvuWjpkUNrwvRTTN2Gju7txuVy\nuFyu4Rz8a1TekZILAJaNRl2NGVL81E6/D1M8iampKc0mSKUMTpz08xcKhUKhkH4RnU7H4zEb\nX0uSJP0m6JmYmDCKBwCRSCQSiWgGEwTBZrP5fLqpc/62oChGDSEIgmnDAYDpgY7FYgkERf++\nlBIPAGw2+xs0xMjIiNEimO6KAMDhcL5BQyQSCaNFMN0VAYDL5XI4nOLfajSaUsp+L4mdtVc9\nzb59pzMVLfgpcemKgJZWFJ/Xypj795+vffvY37j4XmQ7VN9tbOHdI6hVR3cJBwBsKvTceHju\nU4W6LgAAOAbN69W0AgA416grS/CLW3Ouf0SnEuPFedfztLq27Zs7SblQ1X5eiPQ199NvRuo2\nIaCNGwDY+IyvuONsQpoCiiV2x6MfiWz8qvAoAH6gk/GyaxvlurU8gjB2HGxCndl8J216PXPQ\nqaKuvHcJ6gQA8tRD+x9mzt81oaaQDQAOjjU1V/xi193zmudhOFuN/FXkwqUK67qa5Hgn3xYW\nbDL78e1klr1z5UJ7g0aRDAAVPp7KA8Bcv+7XspX6zwKL/rGbeug/Z1oO6d3aFT6/6iw5HAAQ\nNpwU4OUGALY+46vsPJf4Xv7+ecQDOW/Zkkn6+1ecXPi9+s0vcdt99VWRl5eXlZWl/0xRVJmp\nGOZqqFzptHIAkL9IDoi+0sm9AgAAzPxrfOOI4+Gbbg8Z5lbo/KrD/Ig6qW+T7p45vHvr2IHs\n8C2zuCQBANeXdFm0+R+PwAX9+3eyMNLaPD85YkDILzVf3nlypAqPMpzDmM072757nXDtz+Ub\n1tb04jw4uVxIlriHE/T3/C/4jTAt8mU/w2+wFGzI97YUbMi/L1X6rL6XxI5v3lVE7T99N72e\naQywrTqZ8ACgbROLGSf+ht42v6fKbfu56CM7+7a7c+XigZfJ7969fZbwj+FMOtb9lHE3b2t1\naOc5gE4lxvNNfZpXO7lg0OCa9epUd3GpXa9hfbtPZ7QV29oVfDaiShiGqMy+duhDnuPAyi9f\nvgQAo1aVNHdubHmaNcJBQlDiITVM1m67CvU6ZCftfKniT29oAQA5Sdd1Ol1on26G8xGqkwEM\nEztd5Pip16w6b/q1V/Y/m4cunORQZZNkw7Jo8cSo2W6GBSmuDQAkyFR23Pw/CQEz5nZVawEg\n+c81W+5/irRqZVvwuZRVV6FN4Sbr4P3ZZJ7Uq+CuZI64fj0Ru/jzFcpjVfj4+NStWzd/uRxO\nTk5O8U1QQCAQKJVKtVpdSowh+ufiCOmRbBMAEFYK/pjVAQDZdNasiOMDb254AGsLJXZVm3tX\nBYBuAY2qdJm0IHLdtRHj6ltqZDeXbr0mdV8UPNVfH+bmPfTgwYcOrTf0W3fvjyGF7jR3adbK\nBcCnZ//2lb0bT1058I8RUU2t9F+x2Wwul6vT6QBAq8or/aehp7/gkZubqy9Fh1AoJAhCoVCo\nVCqaRXg8nk6nUygUNOM5HA6Hw9HpdLm5tIb/AgBJkgKBgFFD9FdH5HI5/eMDj8fTarVKpZJm\nvL4hWq1WJpPRLEKSJJ/Pp99w/RYEhg3h8/lqtZr+FuRyuWw2W6PR5OXl0SxCURSPx2O6BQEg\nLy+v9AtOhgQCgUqlYrQrslgsRg1hsVgcDofRFtQ3RCaTabV0R5V/wZ8qiqLUarVcLi/+rU6n\nK+UK7veS2BGUqKu54MiRZ094D4yq+Os7H2w6NZQfOfD4nWmmWju4tikAaFUfwkaOfiis7t24\ndg0P5zadm00YM/fTTAxmyBKxCYL6XDxBGU1YvrVHQvzNO/fv3z59YPuGml1mzw7IH/vMFxQ6\ngS4u6dhOnU73IGr2aIOJV6JujljQDABqDWqUPS46RdXu+ZbzJjWH65/AwhJyCEq4O2ZLoVaT\nbMN/KrMvH0/OmbmkK58k+A0GzfB9EDYtRKDOqj3bpkgF+KYdxdSeP/583bZX/p8EO+fq+g+p\n2wvtBAJx/iYufdWx+cWaXOwigYRFFk/symNVeHh4eHjkJ3larTYtLa3YYg1WBZ+vVCoZHYhp\nRiKkxxLWIQmCZ1Po5i2WuCEAyJNzAUDx4dyl828qtO7iLPq0G1t36A8Lrrw8/QbqW8o/7FNq\nddX6ehZ8K5fLRdXHAGx4svOxvL91XsqZQ3+9se/Qtb740/5p27k/TL1458hzucen086Cflud\nRlHiEb8IkiSFQqFCoaD/F0ifRqhUKjrz12Oz2Vqtln48SZL6xI5+EYqiBAKBXC5nmtipVCpG\nGefn/pR+rlYAwKghLBaLz+fTjy9I7Bgd6LhcLqOGsFgsphtRf5rBdAsCgFKpZJSoMd0V9Ykd\n/SL6pJbRuipoCKNEjemuSFFUKQ35ARI7AHD3sorZd3gPZFSZlJ+j8C27m7D2RRw4zuJV1o/N\nykmKik9Rbjsww5giAECR+bfhHI7dTHNrbKn/fPbgK0HFwM/FZyQc3HtJPWRgd1sX904Ar45P\nGbtlKwSsolnVXYdfie0G7FzTtWDKpbmDF9/YlK72lLIIcaUAW/axqLvJT2+ntliVf5ubwNIb\ntFfj0jS+1vqxArrNM4IzmoyZ4F3x03y1agB4k6cGMQcA6vrPcYrr90BnMbpW0WElBCWZ2KLi\nvL0LrrUMdzf/NK4l58WpiIcZpFkJdS591RVn4VlRfv7EM7m+jxU08icXsxQVioWV16pA6LtB\nUMaNTXjXnl4A+JSZKTNOAYCRmxkAqGVxa4K31FhRf277ygUBWmUyALCkXAAg2ZYAkPe80LUN\ndd5jAOBZCgBAKYsLCtr0C6/hId9Pc9AokgCAKy00Ag8hhEr3XTzuRM+y+S8q2b1EmapH9fzT\nU4Lg9a0kfhL3Wly5h/7yEVtcTadT/3b2TsqHd4nX/1o6bRsAvHyToT8Vvbpyxv6/rz5+cPvg\n+ukxz2U9xjb4XDwlyfv94PaVu089ePri4Z3Le48lC20a06yn/MPvV7OVHsNbGE50HdxKq8mM\nvJcKAEBwBnuYx6+cl86u4WeTPzaOI3YfXNt0x9SwuHPxz58+OLgh+PeE1JaNLQxnwpE0/sWE\ntyN06Zn4ewnx5yNnBT2m7B1ZqcsOPypejTqj5nva5M0fMSoiet/fF+NvXDl3YPvqMaEHvNuV\nnB6VvuqKM6s90pEjmxGy8uL1+4k3L/0aOkvMLXpVr/xWBULflS4Dasjfhseee5H/b60ibuJ8\nAGg9xBEA+BVGGbGoJ4sX5xY8nEin+nteNAA07WQLADyLQDs++9XmkOdZBVdctL+HTQEA76nV\nAUBkPdqUTd2auSBT/WkOscHbAaBr90rfpo0IoZ/Dd3TFjmfaScraIRM2qiH4VCvXnlVg4c1K\nXfKfss436zp7QMrG6CVHZVTlam59QyKkK0bHTh1dc10gyZLOGdRka0z4rg9KqypVA0PDO9mK\nAEqOrxcTM3tg1tajW4NjcoTGZlVd2ywY2fUz9Srq0Y5jFK/SMJdCT/8QWveuLdp/J+oSrO4E\nAI7+bZRDou37BBsmzh1nrlREhu9dvzhdxbaxd52wcFptEbvwvMkJq+ZuCd+8efmsPELoVNdz\nyQZ/42fRgdND9jtHdXMutESCko5bvs51367jfx8781s6yZdUc2sUum6lre7i+7wSupI/t+rq\nxcSU2EyCZTp3zbS1q7f/umAa8Mw8e04dfmVF9LdbFQh9RyoFRnnsarxvqOej9r2qVRI9O7//\n2p33Vbqt7mQrBgCSYx06rmnwskPDvFPadG7MV2c+OnfgekJqJd/lnaxEAEBQotBlg0cHrZ/S\nrLlnl3YWYs3G+MNx197aec9cWd9ClpNDcSruCvH0nvtb7Qbv/Hs0Fakzrp/ad/JuqkuvVSNs\n6N5GhxBCAEDQH6+A0LdX5hg7qVSam5tLf+iJkZHRkWf4kk3EmCb30Z4FYX+fvpKerZJWrtW0\n9yg/vzaGA1ETD67cu3P/4yfJeVq2pYPrL92H9+7T2jAg7dqB6PVbbt68l6skrR1qdOw9bMGk\nvjySKLgH4mrs8mWb9954mJSrYVdycvPxGzU1sI3hGRGPxxOJRIqsizxJY8cBxy4sLXRPfYlI\nkjQxMUlLS6M/xs7U1JQgiJycHPqjjsRisVarpT+OXiAQCASCMn/dhiiKkkqlqamp9P9mmZmZ\nAUB2djb9gU1GRkZqtZr+OHqhUMjn8zUaTXp6etnRAADAYrEkEklqKt2jUMGTOLKysugf6CQS\niVKppH8DgUgk0o9my8zMpFmEzWaLxWKmWxAAMjMz6Y+xMzY2lsvljHZFLperVCoLHq1QJi6X\nKxAIGG1BY2NjAMjIyKA/xk4qlcpkMka7IofDUSgU2dnZJQbod++Sa0hzGQgh9P+MElbrM39b\nn88HOPuOn+E7vpQ5mLh3Hbspv2fA05QNANzCdyjV7z1xT++JZdaEI270/v37smuMEPq/9B2N\nsUMIIYQQQv8GJnYIIYQQQj8JTOwQQgghhH4SmNghhBBCCP0kMLFDCCGEEPpJYGKHEEIIIfST\nwMQOIYQQQugngYkdQgghhNBPAhM7hBBCCKGfBL55Av3f6epkVcp7Worj8Xg8Hi8jI4NmPJvN\nlkgkAMD0PU5ZWVmM3rTDYrHkcnnBC6nKxOfzORwO/VcGcTgcIyMjAGD6Hiemb9qhKCovL4/R\nC6koiqK/BblcrlgsBoAPHz7QLKJ/j1N6erpGo6FZxMTEhCTJ3Nxc+u9xQgihrw6v2CGEEEII\n/SQwsUMIIYQQ+klgVyz6v3PgwRuGJVQAdHv98uPfyhguAiD1LcP4L3gNPN1+3k/xb+h2j36S\nynD1pqYwXwTd3uSPVAB0O6w/+cC0Ie9oBnqashlXBiGE6MErdgghhBBCPwlM7BBCCCGEfhKY\n2CGEEEII/SQwsUMIIYQQ+klgYocQQggh9JPAxA4hhBBC6CfB7HEnaUlP3+eW8MQEJyenr1Qf\nhBBCCCH0hegmdvIPJ7s16XXsQVqJ39J/3RBCCCGEECondBO7SJ/+xx9ldxwR3Na1Moso1yoh\nhBBCCKEvQTexC/vnvX2vA7+v7VyutUEIoe+S9vqORQdiDz178V5sW7Vu19EBAztxyU/nuG/P\nbtsaGZ1w/0mehmXh4Nas74Qe3X/5VFqn8qtZRa7RGs6RIHm5OZ/6QLIenZw7f/2FW3dfvJdX\ndHTrEThxcn/PEk+iL88cucMscI6f/dduI0LoZ0ArsdNpst+rNLV6uZZ3bRBC6Dt0Irj1+oOJ\ndg28vVpXTbsV98ey4XcSFGuW99B/m3518Zhhqylp9Ra9R0ionHvHY2Ond3+QFjd9aP4xU5V9\nSa7RGnt41bTgA4A5hwQAgvz0YjHZ28ONmw/9AOa+fbr7SHTX/9y3dEK38y8PHZ72S5GaaJRJ\ngSuidD07Y2KHECoRrcSOoETNjXlPt14Dn8rlXJ+vRqfJPrkn+o9z116+S9exRXZOdTr7DfR0\nNNZ/27eLT8OInWOsRXRmpZLd6dZ72vzY/bUEZbzh8c7J2D3Hzjx8+VZDCSxsqzVr16tXKxf9\nVzlvkrJ5FlZSTvFSyux765dsvJzwWlTRxW/8pGaVxSXOfMOAnlcrT4ua7VZkeufOnX03xg60\nFNBpCx2MVo6eTpMV2NM/TaUdvW2Pl5T3tWqC0Pcg81bY+oOJLqN3h41uCgAA05yHeUQdG3d1\nRuf6xlwA2Ds5CnjOS08ds+GzAUA3NmjOL/VvRwxRDr7MIQkAUGWeAoC6c1eNqmIMJb0r9uTw\n6e9UuvB/Lva0EwMATJsxvl71XWv8Xk1+bMuh9DFaZfb922e3zQ96IFM5fqOmI4R+PDQfd0LE\nHpmnPN5vwLxt73LV5Vujr0GnlUVMHrnh6MM6bf2CZ8wYM9SvEjxYPnX48STmbzSn7cXhedPX\n7DWv1zF0zuKw6RM71jE7GB4899BT/bfnZk8Ji31aYsEdwQsSzL1/3bQuoL5iTehipvehtGvX\nzpnP7O7mry79fmS6GszZ1KE9z//bmiD01V2cGUtx7YJHNCmY0mrR4sCQOYRGCwA69fsTKbmS\nWiH6rA4ACJZ5t7oWGsWrBzn5zxDISUwAgHqfP+c5/ySLLaiZn9UBAMnr166iVpPzd4ZCP0Et\nf2Jj69CgVbe1f73++i1ECP1E6CYE3YMPWVqxt80csH3WIJMKFfhUobEfr169Koe6fbkH26ed\nSjJesmVpNWH+obZpi9b8Yf12LDzSLqIXo1lpFHRzwS27b1m3nDnGL/+KmnOtui6CZxOiF4FP\nZOkFz7zJbTjN09xYaNSxrXL3iiyNTkIxuD9lxIgRReus1VHk17zDpcwZXoy6xTfvMrLyuQWn\nt2iHLcanI6KfiHbf00yB3QyRwa+SI23Zwb/lx3+RoxauFFSqbVgmK0tJkGwrXv7FtvTz7wiS\n48pL/+f4+ZR32e9carT2+kXK+vRDaWAv3nrp/l+p8pam+uRPG/f3W5Jl9ItR/jV+imMdu3cf\nh8Nh65617Tym3BqLEPrh0U3szMzMzMxa29UuO/K/p1OtOPLcIeDXgqwOAIBg9Zw01PRu0SxN\nmZkYFbHt0u0nWUqtmXVV7z6jezS2AYC+XXz6RkalbF55+i5/8wafT/FZCbNGzZC5B64Y06FI\n9iXT6BTp7wynVGo3apptmg4gckDPo2lyeDOlx4XGe3dMLVKHfrVMYjaeGj7T+3jkLknV7oyy\nOgDo7uPTPjJmoKUgoKtvx1/DEhYujk/OEkktG7YLDOrVCAA08pfR4Zsv3038IGc712sxJCjA\njkcBgEaRvCMi8vS1hEwVWalane5DRjatUqgX+HMzLEKjeLn1eZbzOC/HKgpV0JHdb2R9rAQA\n8OdE/23yrjsjfPPXz7t9vYdsnxS9z1PC0anT9m+KPHvjQXK60trB1TdgaCtnacEM09LS8vLy\nCv4pEJTRy0ySJEVRNFcXQeBN3YgBTe6tDJXGurb9rZiw2O2/vUjKkNpXd2nWbcDYAH2qR7BM\nm/v21AcrsjOy0989PBsbfivFukO42cde1HfxqUBwpzZt+DpbBQCbAXjmrst3HxjYSEQQBEVR\nPtGbtzfp7v9L26FDe1Yy0l7/Y0fsE3ngqj8dhdz8elCiFi1acLlcluYWAABB0dzn9Ts8SZJM\n93ymPyt9Q+jH6z/QL0KSpD6e6dO1vtuGMF3EN2gIoyJMG6KPB+YN+YIj/HfYEKbxpTek9F8B\n3cTut99+oxn5n1Nknnmr1LT/xaLIdIljy67FRqZsmzLnorjp2BmBJhzNvTNbNi2d6OkRY8kh\nAeDCmjlungELAxwAkvTByuzE2aNmlpjVAcAgn1qTY8IHTrzYvJGHm6urSzVbDs/e3d0eAAZF\nRlcYPSCuVsiqoS7FK9wyODSm3+ThI3cJ7douX9zv37T9SOjilv2DAl0rJl3ZszBqoXmL2N7m\nnDVjp/zDdx89dpaUyvh9/erQibAzYiCAbv34yWeVDsPHTqsoVF06FLVi0liT6MgaAlYZM7Qo\nmmalXNqo0rEGNbQQcfpbcI6f3pbYJ7guAHgMrhMRsvO1spM1hwKARztO8M06eUo4ABAdMi4u\nr8bQIRNsjYjES0dXBw/TrN3qZZ0/5xUrVsTFxek/S6XSEydOlN5qkYjBcECEGNEoXwNA+rWx\n8w68dvXu0sFLknz92OnI0BvxryN3hBY5Dqxv6342VQYAxrUDFy3yLZh+I10O2jxb//A5AW2F\n6jTp3T3+o1aM6+TT5v3NajwWl8sFqffU8e19puxbs2iWvoip29Bx/RtIjYuOylVmAwBQXLFU\nKgXajI2NmTZcIBCUeU5VBI/HbHwtSZKMWgFf1BChUCgUCunHs9lsPp/PaBEURTFtCNN4YH6g\nY7FYTLcgi8X6Bg0Ri0seR/45X7Arstnsb9AQIyMjRvFMd0UA4HA4HE4JQ/M1Gk0ppZiNzZIl\n39x36MT9p69lGpaVfQ0v3+71bL+7v6kaRRIA2HBo9QdaePcIatXRXcIBAJsKPTcenvtUobbk\ncAAg03JI79auAKCSJQGAMitxzpS5KdX7bygpqwMApz6z11Q/99f5KzdO7tm3fQPFk9T0aNI9\nIMDNgsficDkEQbI4XG7RQdMa+avIhUsV1nU1yfFOvi0s2GT249vJLHvnyl+yYoUNJwV4uQGA\nrc/4KjvPJb6XZyt2nn6rXhAzTp+xVQ7Lmrf8bLpax02N+SMpZ9yWaS1MeQBQrXqNe337bTzw\nYlU/h9JnCMUSu+PRj0Q2flV4FAA/0Ml42bWNct1aHkEYOw42oc5svpM2vZ456FRRV967BHUC\nAHnqof0PM+fvmlBTyAYAB8eamit+seuLKHNZAAAgAElEQVTuec3z+IImI1SudFo5AMhfJAdE\nX+nkXgEAAGb+Nb5xxPHwTbeHDHMzNwzuMD+iTurbpLtnDu/eOnYgO3zLLP0jUdosimzOqezW\nQH8fa8W2Q5aco245D/pzcOzTM4GOAHBssqfPsgudJ0YsDupRWaqNP7FzxICQRjVe3nlypAqP\nwSUBhBBikNjtn9nbb/4ehfbTBcBp44b3mLZz99xu5VCxL0dyLAEgWal1Lzxdp8l6lZwhqWhr\n2NfZ2bfdnSsXD7xMfvfu7bOEfwzjrVrZGv5zw/jZWh6Z8+x5KRdA7dyaBro1BYC8tOSb164c\n2bt79sibq3aG23E/d2jWRY6fes2q86Zfe2X/s3nowkkOVTZJNiyLFk8sfvcrHRXa2BV8NqJI\n0EHqlQS2qE7BdTieiff8+d4A8CbhDsW1+TigBwiS72sliLj4EgondsVnWIQy+9qhD3mOAyu/\nfPkSAIxaVdLcubHladYIBwlBiYfUMFm77SrU65CdtPOlij+9oQUA5CRd1+l0oX0K7TZCdTJA\nfmIXGBjYuXP+ExNJkszMzCylyWKxWC6Xq1QlvOmuRExPmND/OZJtAgDCSsEfszoAIJvOmhVx\nfODNDQ9gbaHErmpz76oA0C2gUZUukxZErrs2Ylx9SwCo3rSlYVhmZqaJ91SAPx9GJir9Kmd9\nuNBtxcUKjVZsn+EHAAod1Gw9aP/+B47ekX1/vRY33LmgIIeT37mrVeaU/rv4VH+SFIvF2dnZ\nWq227GgAADAyMiIIIi8vT6lU0iwiEAi0Wq1cLqcZz+VyeTyeVqvNzs6mWYSiKJFIlJWVRb8r\nViKRAIBMJmN0fNBoNPQbwuPxuFyuRqPJycmhWYSiKKFQmJWVRTOeIAj9lSGmDVGr1QqFgmY8\nn8/ncDiMGqK/Iki/IfpdEQByc3PVarp3YYpEIqVSyWhXZLPZarU6N5fu+Hg2m83j8ZjuigCQ\nk5NT+pUzQ1/wp4rFYqlUKplMVmKAfvcuEd3E7tlev+7zdtu2GLQsdGgTt6oCQvH4zsUNYRM2\nzevOqf0sumtlmvP5BriS5lLWhnPn3vn42hlOT0+MGB1yac6u/XVE+ZfNtKoPYSNHPxRW925c\nu4aHc5vOzSaMmVsQLxAXWjmW7SfN6Ez5D5i/IK7LzHaFcj4AUGZdWBZ+xn/SVBsOBQB8k4qN\nvLq6N3Hq1jtk54vsUMeSuw+U2ZePJ+fMXNKVTxL8BoNm+D4ImxYiUGfVnm3zZW1n84tmkFqV\njiBLuJCr0wFAoQuPJEmAruihv/gMi0g6tlOn0z2Imj3aYOKVqJsjFjQDgFqDGmWPi05RtXu+\n5bxJzeEWbBIAWEIOQQl3x2wxnI/hM70cHBwcHPLzS61Wm5ZW8ovsPjZEp1ar6f9a6P95QwgA\nWMI6JEHwbGoUmihuCADy5FwAUHw4d+n8mwqtuziLPu3D1h36w4IrL0+/gfqWxeepUql0lC0A\naBUqrVab+XqXXKuzH9jUcDeW1BoLEPl09xPVoE/nWgUD63Rauvu8fjyQSqViuudrNBpGPyut\nVks/ns3OX1dMf7kqlYrpGDumDWEUX9BNRr+Ivv704wvG2DE60Ol0OkYN4XK5AMBoI+qXQj++\nYKxYuTZEv58waghJkowaUrAHqtVq+hnqN2hIAbr3Ly4bd1hUcUDiyY09W9e3NjcxNrNyb9Et\n8kTCQBvxwaDlTJdargiSP6F1xSc7lyRmG+T4Os2BiDs8aYs6BgffnKSo+BRl+PIZ/Xt09mxU\nz1Za2plKz27uHEn92T0cr2+a+SCv6LakOFb/XLmy+3qq4USNPAMAKog+//Q7rRoA3nycW13/\nOU7UOxllMbqWCb22ls3Uo7Iy+9pjef5ZhSLjdEBAwPUclXH1GhrFq7/T809MdVr5oeRc0wZ2\nn59TyXYdfiW2G3DYQIi7RUbCpnS1DgDElQJs2Yqou8kbb6e2GFZHX0Rg6Q1aWVyahpePu2v+\nrIjTb79SixH6mgjKuLEJL/fpBcOJyoxTAGDkZgYAalncmuBxu84mGwZolckAwJJyAUDxIXpK\n93bhx14YBijSjwFAhbbWAECxLQEg50mh44867zEAcM2ZDfZCCCG6iV3se5nj0LGCws+8IEjB\n2NFOee9jyqFi/4rr0LDGFunThk2MPnjy5p27/1w8uXrm8N9fq/tMH2gYxhZX0+nUv529k/Lh\nXeL1v5ZO2wYAL99klHJi69R7Tl1BzuKFcUWmUzz7kE5OZxePDd956Or12/fu3blw8tC88avE\nVdr5WwkBgCQg793r9PRCV605ksa/mPB2hC49E38vIf585Kygx5S9Iyt12eFHJS5dlfMyoTBl\nWSevRvbD6hvr5kwP/+fOwycJ8etmblLy6tcVsQWWfdtUFK6fuvhc/L2nibd2LJ6YqJIM7cks\nsZN/+P1qttJjeAvDia6DW2k1mZH3UgEACM5gD/P4lfPS2TX8bPJHDXLE7oNrm+6YGhZ3Lv75\n0wcHNwT/npDasnHRm10Q+k50GVBD/jY89tzHzEyriJs4HwBaD3EEAH6FUUYs6snixbmajz9G\nnervedEA0LSTLQBwjNtnPrx3fs6Ut4r88yudJndT0FKCYE0Z4QQAwgqDqws4iRFT7mUUnItq\nfw+bAgCtx3/qh0UIITrodsWKSFL+roRhB/J3coL67u6fIFjSib+GH9mx/cTR7Yc+ZJE8o8pO\ndSYuCfSsVqhPmm/WdfaAlI3RS47KqMrV3PqGREhXjI6dOrpezGdTVYIUjJ3V3X/ixu33G/tX\nL3QTTf3Bi2dVivntj7iVh1Ly1ITUwqZ2837j+3ViEQAANXwaKDavGTHJMzZqvEEhcsKquVvC\nN29ePiuPEDrV9Vyywd/4WXTg9JD9zlHdnIt24GY83Di18MNS1u4r425lguRNWRO2OTx647KZ\nmVpBVTevBSP99IseuXKJOCJy09JZWWrSplq9CctG1izr1RpFPNpxjOJVGuZSqJ5C6961Rfvv\nRF2C1Z0AwNG/jXJItH2fYMNziI4zVyoiw/euX5yuYtvYu05YOK12Kdc1EfpPVQqM8tjVeN9Q\nz0fte1WrJHp2fv+1O++rdFvdyVYMACTHOnRc0+Blh4Z5p7Tp3Jivznx07sD1hNRKvss7WYkA\ngGCZzpjebdysPRNatm/p00oEmasv/nYmMaPlpANdzfgAQFCineuHNBiwto1bk26921cy0tw+\nfzDu2lvb1iGL3M3LqBxCCBVG0ByvsLKWWfDzShdeXnKXcgsmKjOvN7Ft9NRu0Yc740spi9AX\nK3OMnVQqzc3NpT+01sjI6Miz1LLjEDKgyX20Z0HY36evpGerpJVrNe09ys+vjWH/ReLBlXt3\n7n/8JDlPy7Z0cP2l+/DefVobBiSd3R6zeee9u49lalaVGu5+w6aO7lJPKBQSBKEfrv7m8r65\nK6JOX7ubqSCtHGp07D1s+ggfTuEb8Hk8Hkd3h2v0i+OAYxeW0rqLnCRJExOTtLQ0+mPsTE1N\n9bWifw+BWCzWarX0h6vrH2BR5q/bkP6RIqmpqfTH2JmZmQFAdnY2/XsIjIyM1Gr154arFycU\nCvl8vkajSU9Pp1mExWJJJJLUVLpHIYIgTE1NASArK4v+gU4ikSiVSsMHgpZOJBLxeDyVSkXz\nphwAYLPZYrGY6RYEgMzMTPrjxoyNjeVyOaNdkcvlKpVK+nd1cLlcgUDAaAvqH7uTkZFBf4yd\nVCqVyWSMdkUOh6NQKD53V4d+9y65hjSXEbhv7qwaQY0ruw0cHdjYtSoP8p7cubg1fPNDGWf1\n3kCaM0EIoR8RJazWZ/62Pp8PcPYdP8O3tPNbG0//yZ7++s/F3xULAFYNu6/b073MmnDEjbRa\nLf20ACH0/4ZuYmfsNPL+CVa/kaHrFwSv/zjRxMkzIiJ6eLEeQ4QQQggh9O0xeI6dTYuhfycM\nSUqMv/fktQK41vbV67rY4ltBEUIIIYS+E8zePAFA2Di72+B9WgghhBBC35/SErs6deoQJPd6\n/GX951Iib9y48ZXrhRBCCCGEGCotsROJRASZfw/sF7x6GSGEEEIIfUulJXbnzp0r+Hz69Ony\nrwxCCCGEEPpydG9+aNSo0bKkEt649fbimKYt+3/VKiGEEEIIoS9Rxs0TWc8ev1FqAODy5cv2\nCQkPco0Kf6+7e/TsxXPPy6t2CCGEEEKItjISu/1tGwx8mP9c6V1e9XeVFGNUedTXrhVCCCGE\nEGKsjMTul7kr1mfIAWD48OHN5q3sY84vEkCyxY26lf20dIS+H12drEp5T0txPB6Px+NlZGTQ\njGez2RKJBACYvscpKyuL0Zt2WCyWXC7Xv5CKDj6fz+Fw6L8yiMPhGBkZAQDT9zgxfdMORVF5\neXmMXkhFURT9LcjlcsViMQB8+PCBZhH9e5zS09M1Gg3NIiYmJiRJ5ubm0n+PE0IIfXVlJHZO\nvQKcAAAgNjbWd+DgYdaiIgE6rSw7Vw3AKZ/qIYQQQgghuug+oPhzd8Umnexi3zlRJX/x9aqE\nEEIIIYS+BN3ETqfJCR83ZNupa6l5hXpY3r58QfCrl0PFECovBx68YVhCBUC31y8//q2M4SIA\nUt8yjH/PeBFAt5/3U/wbut2jn6QyXL2pKcwXQbc3+SMVAN0O608+MG3Iu1K+9DRlM64AQggx\nR/dxJzfmNh8THptlXMXRSv38+XNn19purs6s1NeESYu1h+LKtYoIIYQQQogOulfsQtfcM60Z\n9vDiNJ0mx14kbRK+fZqtOC/lTM0q7XOsheVaRYQQQgghRAfdK3bnspSVe3cEAIIS9bcQ/HU9\nFQD4Fs22D6gc1n1jOVYQIYQQQgjRQzexk7IIVXb+AJ0GNsLkQ8n6z3ZdbTIeryyXqiGEEEII\nISboJnaDK4ofb1n0SqEBANvOFZOOReqnvz1V2nhhhBBCCCH0zdBN7IZtHpL3/oCDWaVnco2D\n/2BZSnSjwClL547vuPyuSY2p5VpFhBBCCCFEB92bJ6yaLbmx32rOht9JAoRWw2LG7fNbteyy\nTmfk4L0vbli5VhEhhBBCCNFBN7EDALcu4w90Ga//3GvFiXbjHz7L5VV3qsQmyqdqCCGEEEKI\nCbpdsY0aNVqWVOgJn0a2jm7OlVIvjWnasn85VAwhhBBCCDFTxhW7rGeP3yg1AHD58mX7hIQH\nuUaFv9fdPXr24rnn5VU7hBD6z2iv71h0IPbQsxfvxbZV63YdHTCwE5f81EORl3R+x8qIa5dv\npWfkia3sG/QM6j/Ih099Cnh7dtvWyOiE+0/yNCw7p9o9Bk6e5NfYcAFP/twYsjTq/M0HuWqW\nbUkBavnz8NlLjp+/dPdVtkPtJuNmrxzaplp5Nxsh9EMrI7Hb37bBwIdp+s+7vOrvKinGqPKo\nr12r0ug02Sf3RP9x7trLd+k6tsjOqU5nv4Gejsb6b/t28WkYsXOMtYjOrFSyO916T5sfu7+W\noIy3/dw5Gbvn2JmHL99qKIGFbbVm7Xr1auWi/yrnTVI2z8JKyileSpl9b/2SjZcTXosquviN\nn9SssrjUdmUF9vRPU2lHb9vjJeXRqX8pOnfu7LsxdqCloJTqfUVft/IIfQ9OBLdefzDRroG3\nV+uqabfi/lg2/E6CYs3yHvpvFaknJ3QY+F4t8OjSs4o56+nF3/5YMfLyqesbY+fqU7v0q4vH\nDFtNSau36D1CQuUk/RG7eJzvPx9O7h7rpp/DuwsL6nRZxTat1WvAKHMq58LBXUUCdJqcEc1a\nHXoub9N7QJC37uSu6BHt6uRefzmulvS/WB8IoR9DGYndL3NXrM+QA8Dw4cObzVvZx5xfJIBk\nixt1615etStGp5VFTB75d4ppl55+fStJc9NSbpz5bfnU4blrotrZlNcLMF4cnjc96marngO7\nD6rG1eY8vX0xOjz4Qc7KmT72AHBu9pQjtWdGjHAuXnBH8IIEp36/Tqz/8OjSlaGLPXeFlTIc\nMf1+ZLoazNnUoT3PvYaVMDdG2rVr58xnlV69r+jrVh6h/1zmrbD1BxNdRu8OG90UAACmOQ/z\niDo27uqMzvWNuQBwIWjye6Wu386zvnUtAADGTjsxvsn645vWxo8KcrcEgL2To4DnvPTUMRs+\nGwCazJnQ3aXO2aWB8qB4HkkAwLIRGwlB9QuJ5211CgDQBo8rEvA0duDBp1kdV5/f0scJACaM\n7dm0ZrtZnYLHPd/w36wUhNCPoIzEzqlXgBMAAMTGxvoOHDyM3pWw8vNg+7RTScZLtiytJsy/\nxta0RWv+sH47Fh5pF9GL0aw0CrpvN9+y+5Z1y5lj/PJPo51r1XURPJsQvQh8IksveOZNbsNp\nnubGQqOObZW7V2RpdBLqs6ndxahbfPMuIyufW3B6i3bY4uKDHzWKXIpbkLxqNTry8zODESNG\nlNWsr6nMyiP0Y7k4M5bi2gWPaFIwpdWixdrfnxIarf6fRxLSuOb++VkdAADVfHbY+uP97295\nBO6WOvX7Eym5xh4h+qwOAEi2+fgGFuf+fHU1W+Up4WhV76Pf5lo2neciZOfkKIoHAMCOZdfY\nAud1vfTHYOAY1V7bw77t9o37P6xqjresIYQ+g+5dsadPny7XetCiU6048twh4NeCrA4AgGD1\nnDTU9G7RLE2ZmRgVse3S7SdZSq2ZdVXvPqN7NLYBgL5dfPpGRqVsXnn6Ln/zBp9P8VkJs0bN\nkLkHrhjToUjCJNPoFOmFnsNcqd2oabZpOoDIAT2PpsnhzZQeFxrv3VH0eX79apnEbDw1fKb3\n8chdkqrdS8nqNIqXW59nOY/zcqyiUAUd2f1G1sdKoP/KsMLR0dMDuvq2mTn62or1zzI1EksH\nv0kzHJIOLN/257s80r5285lTBxtRBAB09/FpHxmjmjrAsHqfWyca+cutv266dPt+Hteq/YAJ\niesm26zcNqyCUKdO278p8uyNB8npSmsHV9+Aoa2cS+gD+lzl/5zov03edWeEb/5qfLev95Dt\nk6L3eUo4NOeM0H9Eu+9ppsBuhsjgN8uRtuzg3/Lj93KtdeUqTh0NyxAsEwDQyDQAAECOWrhS\nUKm2YUBqhpIgOfZ8Sh+wavVqi+r1PhugU25/myuuOopncJ7kPKIebH+49X568xrcr9RShNDP\nhkZip1M/vHPHtLqbKSv/AHNt/+ptx69oTJxbtO7Sw6tm+VbQgCLzzFulpv0vFkWmSxxbdnUs\nGrxtypyL4qZjZwSacDT3zmzZtHSip0eMJYcEgAtr5rh5BiwMcABI0gcrsxNnj5pZYlYHAIN8\nak2OCR848WLzRh5urq4u1Ww5PHt3d3sAGBQZXWH0gLhaIauGuhSvcMvg0Jh+k4eP3CW0a7t8\ncb9SmpZyaaNKxxrU0ELE6W/BOX56W2Kf4LoF3xpUGADg4ILfBk8Jc7MkDy+fuy44yMS1+ZQ5\ny4kPN2aGRS692Gle0wqfal64ep9ZJ8SmSSFnWfXGTpnPUyTvWjPlkUxlAwAA0SHj4vJqDB0y\nwdaISLx0dHXwMM3arV7WApqV9xhcJyJk52tlJ2sOBQCPdpzgm3XSX4oofc5PnjxJTU3VfyZJ\nslq10kaLEwTBYrF0Ol0pMYZIEq8nojJocm9lqDTWte1vxYTFbv/tRVKG1L66S7NuA8YG5Kd6\nJG/V0TNFSr09uhgA7PpWAQCCZdrct6d+uiI7Izv93dFD+4LiU6p1j6wi5AEAsCv079+fx+MR\nBKHOy0lLfffPn9GGAcrs+Cy11qF2VTb703mssEITgJg3p1PYte1ptkW/w7PZbK1Wy2glUBRl\nuGiaS2EUz6gIRVH6ePo/9oKCjCr2BQ2HL2oIzXiCyP+bxOhARxDEFzSEJEn6RVgsFkEQX7Cu\nWCwGz1n7Bg2hKIpRQ/RbED6uAZqlvkFDCpSxft9e2NbDL+j8i+ydKbl9zQUAEBfStN2i8/pv\n1y2dWX/g2stRI75Nt4BGkQQANhxaf5gtvHsEteroLuEAgE2FnhsPz32qUFtyOACQaTmkd2tX\nAFDJkgBAmZU4Z8rclOr9N5SU1QGAU5/Za6qf++v8lRsn9+zbvoHiSWp6NOkeEOBmwWNxuByC\nIFkcLrfoqtfIX0UuXKqwrqtJjnfybWHBJrMf305m2TtXLqE7+3j0I5GNXxUeBcAPdDJedm2j\nXLeW93GPKaiwnsPg0LbuFQGg53DHY1PjZ4UE2HEpqGzd1Sz67L1MMEjsilSvxHUizjx47FXu\nrJ1BdUVsACe72c/7jz8IAPLUQ/sfZs7fNaGmkA0ADo41NVf8Ytfd85rnQbPyxo6DTagzm++k\nTa9nDjpV1JX3LkGd6Mx5y5YtcXFx+s9SqfTEiROlb2uBoGiuidC/oVG+BoD0a2PnHXjt6t2l\ng5ck+fqx05GhN+JfR+4ILfEo8eLEmplzznPNWo9taVvkq/Vt3c+mygDAstGoq7sGFb9yP9m9\n5o6U3CIBecoMABBVNpdIJAWRck1lAMh7KzecSIdYXNqdWyXi8/l8ftFB1aXjcpldRyRJkmlD\njIyMyg4qjOnxgcViMW0IRVFMG/I/9u47LGqsawD4STK9wYCgIIoNUUGxrroquvYuNmyIXdcu\nWACxd+yu2LCLImJZey+vXdfeFtRdO1bqDDB98v0RFodqwqrrN5zf4+MzE85N7k0ymTM3NwnX\neChUQ0QibpeyfZ+GSKXcBsQXYlfk8XjfoSEyGbfBaYX4quLz+XlWzGQyFVCqoMRO8/FYzaaD\nPpEu/UeOqCEVAIAu+UT7sMti+6YxJ9Z68j9ELhwxbdOIYb07RjQrybW6hUAKigNAvN5cO/t0\n2qR6HZ9iU7KU5RGzo0+bB9ev7HsV/+HD++exNyzjnZplO/KuC5hhFpFpz18U8FPI1avRAK9G\nAKBJir978/rh3btmjLi7fEe4q5DKpwQdERB006njhhU91Dc2DZ0/oXzZDTbrFkfKx2+c4ZUj\nVK++eSBBU3FgmVevXgGAollp04M7m5+phpe3ybPCtpUzD208KZ/kO2TVQUGRUODvuTzXSfKD\n25SofE1ZZmIqL9UOYD8ApL25TdP05F5dLecgNcYDZEvsCqg8QcmHeNit3voH1GqnfrPjlUE8\npZ4j+zkj9F+hzVoA0L6M7xd5vUNt5pfStLMBDVYdC99wf8gwLwfLYN2nuztnBR86dV9csnFo\nTIQsV97Wbu6qGonvZW+uL1m32qOF4PHpJVIyW8yYTTtaf3gbe/Nk9gAaACCvJNJs4Nb3hhAq\nUgpK7C6MHPURih1+/LB16cy0NG5tqImmBx6Kal+rOIDb1G1/HDlku2/svoiHo79DXYU2TZS8\ndRcvfujk42o5PTlu1aiQqzOj9tb4JzsxGxLmjBj1RFqlVYPqHnUqtejYOHDMrKx4iTxbq4u3\nnTC1I+Xff+68452ntcn5a1uvurw4/Lz/hCAXAQUAYruS9Vt2qd3QvWvPkB0v1ZP/uc1KzlLq\na8fi06Yt7CImCXHdQVN9Hs8JDZEYVdVnuOQOfnN0B03TjzfOGGUx8frGu8PnNc6zwtmxPbGY\n3zqh9eZs3x7EP53MUgFBSXft3Gw5E4LM2TFZcOWrDqqvHhf50dDmxeZLdp6/OvJJNnMODAy0\nvPgjOTm5gHYpFAqNRmMwGL68CgCA+28sVASRfDsAkJYO/ierAwCy0fTpq44NvLvuMazOSuzo\n29umrlq0NdUs9R4WNmB0HwUvj89jhSatKgD84jisZal2jScv639kSETDzNmKxWKCICr87F0B\noG3nnpYBeo0CANJffrLc/42pzwFA7CQq+ENhiSAIW1vblJQU9mfxbG1tCYLIyMjQ6XQsi0il\nUrPZrNFoWMaLRCKxWGw2m1NTU1kWYbr3ODVEqVQCQHp6ul6vZ1lEJpMZjUatVssyXiwWi0Qi\nk8mkUqlYFqEoSi6Xp6SksIxntiAApKWlsT/QyeVyvV7PfgtKJBKhUGg0GtVqNcsiPB5PKpVy\n3YIAoFarjUYjy1IKhUKn03HaFQUCgcFgSEtL+3I0AAAIBAKRSMRpCzI9xyqVquCeM0sKhUKr\n1XLaFfl8vl6vT0/P40JPmqbt7OzyK1tQYrf0zNsS9XdkZXUAsD/iL56obFjdf0a5kaLp1ex9\n7m4C+B6JHUGKA5uXnLFjYVyzZZXk/9yYjTbtW/VApPwlK6sDgLQ3G2991G/dN9WWIgBAl/q/\nAmbr27W2QMKf0b1i8IZpj5usdxdnWyeUwOnG9evC24nj630e22fSpgBACVn+Z77NRgB4pzGC\nXAAANf1nuh/3e0w7jqqax5aIOvha7tp/x8ouWVOuzhocdmdDstFbyftqZ7nzWye2VauYtAfu\npRu8pHwASH9zhJkuKd4KzH8cTzL5ODPd5vSmqcEpDccEtsrWO1tw5eWl+5XiH934MP7Z/cRf\nltdgOWfL/dVsNiclJRXcNLPZzP7TxXWADiqCeNIaJEGIXDyyTZTXAwBt/D8HWdp4cGKrrYdj\nSzQcMGl2qLtTtpMsuoSLVy+9K9G8c6V/jhImk6lsZ3+YfPXR8Tem+g6aj+cPnH1XpXvfn22E\nWXuvZQAlri7nkUl3/jKZPp+i0CRcBYASTRzZ7/DMSB2z2cx1jB3XjxVN04X4GLIvkhXP9SP8\nozWEGZXFNR6+S0M4FWF2La5bELg3pBBHeE4NYT4a33qLcI0vREOyFNTfczNNX6JF+c91Mnxc\n8lqtrDTV8jyCTWWFUfOE61ILrdrQOQ0ck0OHjY/cf/rug4c3rpz+bdqvh94ae00ZaBnGl7vR\ntPH3Cw8+JnyIu312UehWAHj1LqWAA5t7z5k1JWlh84/nmE6JyoV0cL8QNjZ8x4E/bt9/9OjB\n5dMHZgcsl5dt4+8kBQCSAM2Ht8nJ2ZJ9gU2Dn+1E2ycvOn/rUeytSxHTR/9FlavIS1x88GmO\n+WsTDv2h1tf59ZdszRzczGxKjXiUyHX95JZVvfzWiaSkf+vSksXT19x69Neft84vmn8HAEgA\ngbz24Or224PmHL9468Wzx/vXBddP4GQAACAASURBVB+KTWzaINuVK1+uPCEYXMfh1rLZyXyP\nPi6ZvxDYzBmh/xBB2TawE6U/u2w5UZ9yBgAUXsWYty829t56OLba0HXhG+bmyOoAwJhxfGXw\nuKgL8ZYTmVHCQqUQAPQZx0ePHj3j5Jv8AoAQDCwhVT1bqLU4bD3fdgcA+lWz/xqtRAhZp4IS\nOwFBZLzJyHqb8tdctclcObChZYzmrYYSfI8BdgyCpxy/Irx/y/I3jmybM23KopXb3lBVxi+M\n6OyWbXShuFiXGf3b/hG5cMSoSRt+v9s2ZFUrt2LRQaOeafPNfAlSMnZ6t8R767f9mfMcx0+D\nw6YP7/Dh9vFlC2aGTp25Yc85xyZ+KxYPY3rTPDrV1T1aOXzCxuyFyMDls5qWSd+0ZPr0pevf\n2NZfuG5eUGi7m5tD9sZl64F/uv0oJSo9rHK2U7pS557VZYIHG68WYhXlkFW9/NcJPWzJshYO\nH36bHRy24Wjz0IkAYMMjAaD9tGU9f5btXhsWGDzr7HO7wPlLq2fvpGRT+Yr+LfQp7106DrTc\n1b44Z4T+W537e2jfh0dffJn53qw7Pn4uADQfUpF5uyz8uthpwLTADnl2qotLjFTwqL/DwtJN\n/3Qv0Ybo4G0A0KVbaQCQOY+y51N3gmemGvMOAIBek2obda8Ddv/FvDXpXwdu+UvuMqBHrhvF\nI4RQFqKAbu0xLootRE/V68zb8B7tXr7dnmeRH9L9HLN+ntI9HGXHxaNTXy749lVF34RJ/+b4\nqXv1WrW15xEAoE063mPAmqW79pUX5XddyHf1xVOxSqWS0xgahUJx+PlX6ApF1o02flrYosGN\n9zqvtj3cSsueX9p788Gnsl1/Wzy3GwDok37v9fNISZnmdWvk7DyzrTXGr1tZAHi6oXfw4v+J\nXeq36NhAbExNvLLv9MPEyj2WXwjvw0TeXunbatY5eZlGfbv+LDOm3D6zJ0cAbUwZVq/mgXiq\n+4DBP5WXndi8/NRfumU3Xo+pbpd1P6AvIknSzs4uKSmJ/alYe3t7giDS0tLYDzWTy+VmsznP\nwUB5kkgkEomEzUCLLBRFKZXKxMRE9qdiixUrBgBqtZr9CC2FQmE0GjMyMr4cCgAAUqlULBab\nTCb2ox6ZCzbZb0GCIOzt7QFApVKxP9DZ2Njo9Xr2ox5lMplIJDIYDOzHzPH5fLlcznULAkBq\nair7wYK2trZarZbTrigUCvV6Pfsxc0KhUCKRcNqCzKjHlJQU9oMFlUolp3GrCoVCIBDodLr8\nRj0yu3feNSxgvsMn11k5cn3LCfVWjGmrjd3Ta/8LsX2HPp+zOjizrHvMp4xmq/uxrCj6AZGU\nzZltGy8mSiZ0+omn+xCzbKeibI8fJKtD6L9C8BwmHD4SM2/O/84dfHDSoCxTtfPUxX36tGD+\nqlddAoCMF6fPvchZ0Bl6M4md2+CoucWW7d6x9+yWlRozv4y7V+DCkUEDWmRF1hwdc8bltwXr\noqPWLk838UvnCiB4tqsunHQNmrZr79p9GUTZqg1WHl4+soY9jhNFCBWgoB472pQ2qmGF1dc+\nP3Rh5J7n4V3LAMCt2QHTju07evWVskrvF/e3Kwp4uBX64aW/vrxqdfS9v+MNpNy9lvfg0f1d\nf5jEDnvskHXwts9jsIFUKmX6xljORCQSyWQymqaxx44N7LHDHjs2ilaPHUHJwi//3WL9bwcu\n3jWKHX/xHTWwRRnmT0+jIk++BJ8Rc5cuCcKs7v87aakGk+Y3+K9rgRBCCKF/6wtPniBIqc+w\nEJ9hOad3vvQk3c5OgBkdQgghhNAPg8Mj2ywJ7fO9Mx5CCCGEEPpP4APREUIIIYSsBCZ2CCGE\nEEJWAhM7hBBCCCErgYkdQgghhJCVwMQOIYQQQshKYGKHEEIIIWQlCnm7E4T+/+ri7lTA7bxz\nE4lEIpEoJSWFZTyfz7exsQEArrf7V6lUnG7IzuPxtFot++cWiMVigUDA/s7yAoFAoVAAANfb\n/XO9ITtFURqNhtNzCyiKYr8FhUKhXC4HgISEBJZFmNv9Jycnm0wmlkXs7OxIkkxPT2d/u3+E\nEPrqsMcOIYQQQshKYGKHEEIIIWQl8FQsKnL2PX7HsYQBgO1Zv8z492wfIv5Z4nuO8Z84LwLY\nnuf9HP+O7enRzxI5rt7Ej9wXwfZs8j8MAGxPWH+WwLUhH3JM8Lbnc14oQgj9O9hjhxBCCCFk\nJTCxQwghhBCyEpjYIYQQQghZCUzsEEIIIYSsBCZ2CCGEEEJWAhM7hBBCCCErgYkdQgghhJCV\nwMQOIYQQQshKYGKHEEIIIWQlMLFDCKEs5tvb501pX7dP1XK/tm0ZseGgzkznGfdkRfDWPc9z\nT9e8ubR+fK9hDar4epStUqvxxBX70kzZ5mDUvlgePKJVwxolXSvUadVzx5XPz7fQpZx2yIdr\n5RFft50IIWtVVB4pdmNc39nPMh9DRBCUzLZ4tXrN/Qd2dhJS/37mupRT3f1Xbti735H/bRPl\nB6ejY46ef/LqvYmSOJZya9ymR49mlZk/pb17oxY5OikFuUvp1Y/WLlx/LfatrGTlPgETGpeR\n5znzWxP7zXycnHv63gMH+UTOiR07dvRZHz2wuOSb1hyh7+xUcPO1++Nc67Zq2bxC0r3jJxb/\n+iBWt3JJ9xxhZsO7lZt3kj7d+3Urazldl3g6sN3AT0ZJnc6+ZR14qTf2b5kz7PCxWw+OzeUR\nAAC0KW1442YHXmhb9Ow/uhV9duf2oS2rvTt7+9cqSgAgBSU6d+6cs0604fDBI9LSnt+u1Qgh\na1JUEjsAEClbTpvYBABok/7Tq7iD0dEBt+PWrAlV8nKlLT+klwdnT9l4t5nvwG6D3ITmtGf3\nr0SGBz9OWzatUzkAuDhj0uHq01YNr5S74PbgebHufivG//TkyKJlk8O8o+bk12CRbdNpk5rn\nmJjn6mnTpk0lMdudp9A1R+h7Sr03Z+3+uMqjds0Z1QgAAEIrDauz8ei4P6Z2/MlWyMTQBvXr\nRzdOLB//VmtwyTWHy6MnftLTfjsu+NR0BABv+xmRg+sGHogIuD5mZb3iAPAseuD+Z6r2v13a\n3MsdAKZO7lerbJOwPrN/vbMUAPgSz4iIiBzzjN3U6+DREuuiB33DliOErEgRSuxIfnFPz39+\n9XrVbNjY69cBU2bv+ntpnwr/ZrYmHfenpGcvTgmln9+aaYrMO+/avOuec9NpY/p4MW8rVa1Z\nWfI8MHIBdMr5TZDD+Xfp9UK9HWylivat9buWqky0DZX3Iki+w+dVVGCFhw8fXnDYV6k5Qt/T\nlWnRlNA1eHjDrCnNFoSZDz0jTGbmrUn7rFfNRqZ8Ts4CwOHYJKGDP5PVAQAA5btoQeCBXldW\nP4F6xQFg++KbfEmlNT3cmT8LFDXX9ijfYkvk4aR57e1EuWeoV13tOvVc07nnGymFX6eRCCFr\nV4QSuxwECo+x9R1nH90JfaYCAG1M2rsh4sKdx/HJeufy1Xz6DW1WSQkA+tS4jau2Xr3/t0pv\nLuZcoVWvUd0buABA786dekds/Lhp2bmH4g0r6wJAyuPTK9fHxL5KlpYo27r7r72aVgAAky5+\n+6qIczdjUw1kabca3YaMaFRWnqN4ZOSUfl182q+YEzs/7Fa8SqYsXq/NgNE96ueocIaJ1iV/\nsJxSus3I0FJJNEBEf98jSVp4N6n75Qa7twflKOhX1W7n+jO/Tmt1LCLKpkK3/LK6guWocLdO\nndpG7BxYXJLfevsqNUfoOzLveZYqcZ0qs/iACJRN2/k3zXpLCpymbtwFACbtk9nDp+Sagdbs\nXKase3vLaQTfDgCM6UYAAFq/7X26vMJIkcWQjcojasGWx1GPU9rXL5G7TlsHDNM4dt/Sz/3f\nNg4hVGQU3cQOAEq1cTJcvKky0QqKiAwZd1zjMXRIYCkFEXf1yG/Bw0yrt7R0lmydNPOKvNHY\nqQPsBKZH5zdvWDTeu87O4gISAC6vnOnl3W9+v/IANwFgzqzd7YYO6uMkfHguJnLFeKPz1r6V\nbNYGTLygL//r2NCSUsPVAxuXThhrFxnhIeFlLw4AcHhyWNO+owdUK/nmesz8jfMdfonu6Zht\nBNugTlUn7gwfOP5Kk/p1vKpVq+xWSiAqV7t2OQAYFBFZYlT/41VDlg+tnLuZTYMn7/Sb+OuI\nKKlr6yVhfgWsELPhU2xsrOUUkqd0d8v8vslRYUZ+6+3f1PzGjRuvX79mXgsEgiZNmhRQZ4Ig\nBAIBSbId3UhRX2FUJbI+pvR7KQaTc/Vy93bOid72+8s3KcpyVSo37tp/bL+sVI8gxVXrNwQA\nY7o4j1mQouVHzltOEIlEL6LDAKDqsCoikUivvqMymsvXqCgSZXbO8Xg8aYlGAFGfrqlEv5TJ\nMb/kR4snX3gXfGmBQpwZz+fzs+bMsl0EQQCAUCik6Xw7GvOUtSw2KIoiSZJ9rXg8HlM39kWY\nz7hIJCpEQ5iVwHIpPB6Pfa2Y40nhGsIyPqvynA50hWsIp41IUVQhGg4AAoGA/XGYJEmuuyLz\nP6e9sdANYfZkNgiC4LQrFtyQgj8FRTqx49vKaZpOMJgFKYf3PkmdGxXoKeUDQPmKnqbrfaLX\nPGo5u45jq+6jm7WvbSMAAJcSvusPznqmMxYXCAAgtfiQns2rAYAuBQCg4ujZPRqVAIBKHjUz\nYvscX3mx6zT1iTdp4zaH/mIvAgC3Kh6Pevut3/dyuV95y+IMab0J/Vp6AUCpTgFld1yM+6SF\n7Imde68ZK6tcPHvp+p3TMXu2raNENp51Gnbr18/LUcQTCAUEQfIEQmHOD4BJ+zpi/iKdc01T\n/C13n18c+aT6r/vxvHKVyshyrxBtytmgoLOWU0R27WK2DGNe56gwAGgTD+S33v5NzQ8cOHD8\n+HHmtVKpbN8+WxdIbuw/kAjlx6R/CwDJN8fO3ve2WqvO7VraxN8+ei5i8p1bbyO2Ty5UNzc8\nP7myZcD/pCXaRflWkfEIjSYJAGSu9jLZ50+fSFoaAHSJhOVERlDv5Ur34PkNXHNMJ4g8ggsm\nlUq/HJSdUCgUCrmd/+X0BQzfqyGFOD4IBNyu5SJJkmtDuMYD94ZQFMV1C1IU9R0aIhbn9bso\nf4XYFb9PQyQStpcPMgqxK/J4vDwrZjKZCirFdTHWxJiaRhBEMT6Z9uY2TdOTe3W1/KvUGA9Q\np6NPmwfXr+x7Ff/hw/vnsTcsA5yalbJ8276mfdbrJq2dDuy4mBpLUUKXpvaZ25IgxT5OklVX\nXoFf+dzFS7T4fPhWUCTklY67ejUa4NUIADRJ8XdvXj+8e9eMEXeX7wh3zffaXjoiIOimU8cN\nK3qob2waOn9C+bIbbNYtjpSP3zjDK3e0xKFH9MY++cwqZ4UBoID19q9rjtB3RZu1AKB9Gd8v\n8nqH2kwv9bSzAQ1WHQvfcH/IMC8HTnPTfbq7c1bwoVP35WVaHr6+2y7zEiQaACCvHNFsMOeY\nknB38upnqQE3Ark2BCFUxBXpxO7NiXd8WS0FRaRIBQQl3bVzs+VfCZJvNiTMGTHqibRKqwbV\nPepUatGxceCYWVkBEnm2tWd5uObJ+ARB0bQpx1GcJAmgzXkW54sLSnH0qsuLw8/7TwhyEVAA\nILYrWb9ll9oN3bv2DNnxUj25om3epdTXjsWnTVvYRUwS4rqDpvo8nhMaIjGqqs/IfT3fl+Wo\nMADw8llv/7Lmc+bMmTNnDvPabDYnJCQUUCulUpmenq7X61m2QqFQsIxERQrJtwMAaengf7I6\nACAbTZ++6tjAu+sew2r2iR19e9vUVYu2ppql3cYtnjuprx2ZnpCQDgD6NBkApD//kLVLS6XS\nDPULAODb6HLs52v6RghtGk1yJSyni0QimUxG03RiYiLbdpGknZ1dUlKS2Zwzd8yPvb09QRBp\naWlarZZlEblcbjab09PZXkkmkUgkEonZbE5KSmJZhKIopVKZmJjI/lRssWLFAECtVut0OpZF\nFAqF0WjMyMhgGS+VSsVisclkSk7O415ReeLxeDY2Nuy3IEEQ9vb2AKBSqdgf6GxsbPR6vUaj\nYRkvk8lEIpHBYEhNTWVZhM/ny+VyrlsQAFJTUw0GA8tStra2Wq2W064oFAr1er1KpWJZRCgU\nSiQSTlvQ1tYWAFJSUoxGI8tSSqUyIyOD064oEAh0Op1arc4zgNm981R0b1BsSItbcfmDS+ve\nACAp3grMGceTTKJMwqi501ede5/2ZuOtj/rwJVP7du/oXb9WKWVaATM8evfz/n1h/2tJyV9s\nq3iYdK//l5y5R9Jm7YH4dPu6OU+ssEEJnG5cv77rdrZjgUmbAgAlZPmf/jAbAeCdJnPPq+k/\n0536kEE5jqpqV4g65JbfevsKNUfo++JJa5AEIXLxyDZRXg8AtPGsr3ynjQcnNJ87b5Oorv/c\n07fXhPazs7i3pUBWU84jk+49syyhS7wGAI4Nsx2j9aorsx4luQ2Y8f/kXkwIoR9IEeqxMxs+\nMlcG0GZDwqu4g1Exattai3qVBwCBvPbg6vZbg+aIhnarVFJ299SmQ7GJ04Mc+Vo3mr78+4UH\n7aoWT3r1aM+mSAB49S6lrtwx9/z/WDZ1r2Gwl5Po4bmYnS8yBofXlRSXtCh5ZG1QGDWsW0mp\n8fLvEXEGm9m+hUrsROVCOrjPDRsr7Nbzp8plpUIi5d2zo5Hb5WXb+DtJAYAkQPPhbXKys1L5\nuUdKYNPgZ7uV2ycvUgzv5gjJF/Zv+YsqVxGeLT74dKpPxbxWUc6LJwDAtnxFJ0HevYn5rbd/\nX3OEvjOCsm1gJ7r57DKAd9ZEfcoZAFB45fvLOIcXG3tvPRxbbei6aYEd8kjJCMHAEtJVzxZq\nzT2zLox9tuU2APTyyPZb63nMHCNNDx7yr+7EhBAqmopQYqdNPhEUdAIynzzhULV+94CB3bLu\nTtx+2jJdRPjutWHJBr5LuWqB80Ory/gg6zKj/8f1kQuPZFBl3Lx6h6xSLh0VHTSq1s6dOWZO\n8pQzBzXcsjM8KkHvVLbCgMnhHUrJAGDEsoXyVREbFk1XGUkXt1qBi0d4SgrZTfXT4LDppXf+\nfuL4sgMfNUZC6ehSvYlfgF8HpgUenerqNq0cPsE7emOAZb0Cl8/aHL5p05LpGkLqXtN74Tp/\n2+eRA6aE7K20sWulnKdBc188AQDN10aNcc53VGne6+0r1Byh761zf49LS8OjL/bu2cgVAMCs\nOz5+LgA0H5LHr6A8mHXLwq+LnQbkndUBAECvSbVXjDkXsPuvNT2Y2yG9Grvlqcy5l499tlHV\nR9Y+EUg9eztyG5qNEEIAQHC9dByh7+mLo3AKMcbu8HO2o1tQkUIbPy1s0eDGe51X2x5upWXP\nL+29+eBT2a6/LZ7bLUekMf1Wj1odXHoeWjGjVtZEfdLvvX4eKSnTvG6NzOuoigszE7zi9QKm\n9CkHALQxZVi9mgfiqe4DBv9UXnZ66/LjT3RzTt0dajE6wmxIqlC6sshz7Z+ncj5eDMfY4Rg7\nlqVwjF1RHmNXhHrsEEKoAATPYcLhIzHz5vzv3MEHJw3KMlU7T13cp08LlsX1qksAkPHi9LkX\nOf9UAfoyiR3Bs1114aRr0LRde9fuyyDKV/dedWxF96o2lsGqV8vURnPFbnnckxIhhL4IEzuE\nEMpESd16zd3a60thPGmtvXFvc0yUlVmyN26J5RRv+zzGXfAlFUJXRoUCAIBUKmX6xiwDbMvP\n/vRpNteaI4QQo+heFYsQQgghZGUwsUMIIYQQshKY2CGEEEIIWQlM7BBCCCGErAQmdgghhBBC\nVgITO4QQQgghK4GJHUIIIYSQlcDEDiGEEELISmBihxBCCCFkJfDJE6jI6eLuVMAD+HITiUQi\nkSglJYVlPJ/Pt7GxAQCuD+hUqVScHqHI4/G0Wm2O5xYUQCwWCwQC9s+CFAgECoUCALg+oJPr\nIxQpitJoNJyeNEpRFPstKBQK5XI5ACQkJLAswjygMzk52WQysSxiZ2dHkmR6ejr7B3QihNBX\nhz12CCGEEEJWAhM7hBBCCCErgadiUZGz7/E7jiUMAGzP+mXGv8/guAiAxPcc4z9xXgSwPc/7\nOf4d29OjnyVyXL2JH7kvgu3Z5H8YANiesP4sgW1DvO35nGeOEELfBvbYIYQQQghZCUzsEEII\nIYSsBCZ2CCGEEEJWAhM7hBBCCCErgYkdQgghhJCVwMQOIYQQQshKYGKHEEIIIWQlMLFDCCGE\nELISmNghhBBCCFkJfPIEQqiIoQ19PMtqTWbLaQQp2vPns6y3Gc/ORC6LePjwzw9JWofy1bx7\nBvj6NiQs4tOentq6dPWtWw/SDXy36g0GTZgd4GNnsQh9GadS6bkW8fHDawDQpZx2ceuVZ9Uk\nxbq/jF3975uIECqyMLEDAHi8duSk4x+37Y2xoTIP3SfG+K1+mbZk194KIoqZcnvmoNkPyN27\n1/OIvGfSu3Oneqt2jHGWZb1gufQHp6Njjp5/8uq9iZI4lnJr3KZHj2aVmT+lvXujFjk6KQW5\nS+nVj9YuXH8t9q2sZOU+ARMal5HnOfPdg3selI2PXF7HcuKNcX2XqFtHb+zDsob/XuHaiNC3\nYFBf1ZrMtnVaejqKP08lPj8WTPfx0FifEalQrEHnLg0U9NNze2Om+T6M3zs7oD4TkPZ46+iu\nU9KpEg06+zsIVE8P753Y/ZTq5LOZzVyYAL3qSrrJ7Fi/dYMSnxdBkJmLIAUlOnfuDAA8Hg8A\njEYjAABtOHzwiLS057dsOkLI+mFiBwDg3K4affTIgQSNf3EJANC0dmd8Gk2bo2OTp9QoxsSc\n+ksldR6SX1ZXaC8Pzp6y8W4z34HdBrkJzWnP7l+JDA9+nLZsWqdyAHBxxqTD1aetGl4pd8Ht\nwfNi3f1WjP/pyZFFyyaHeUfN+dpV+2oK3UaEvgVD6hkAqDlr+ciytnkG3JowPdlAjz55oXEp\nOQBAwOQ1zbzObOj3aWSsg4ACgPWDZqcR9lOOn/dykgBA/VmjB9RputB3YGjCSWYO2pTTANB8\n6W8rKihzz58v8YyIiAAAqVRKEERaWhoAxG7qdfBoiXXRg75BixFCRQiOsQMAkDn5Ckni7sXM\nh5FrPu5NNvL8y9s83RXLTDHp46+q9C4dPb76ojfvuufcdNqYPu28PCpWqlqzbZ9R8/wr3Ilc\n8MWC59+lV+vm7WBrX7t9a33afZWJ/up1Y5h0rB4DbzLnW4FCtxGhbyEtLhYAailF+QU8fKGm\nxB6ZWR0AkKLmzZ1pU9pdlQ4A9MmHLyVklOi4hsnqAIAvrbBgRUNt0qmFr1TMlNSHfwJACztx\nHnPPi151tevUc03n7m6kFBayVQghBACY2DEInrKDnfjDmYfM2/ij18QOPk36uqn+jmLypYwP\nB8w03ax2MQCgjUl71i4YM2xAV98+o0PCzsQl5zfbj7ePzQoc2bt7lz79h8xZvScjr9Qnw0Tr\nkj9YTindZmRo8FAaYF1/3zXv0l4fm9TdLyx3Qb+qdjfWn6Fp3bGIKJsK3bJOInNDGzp27BiT\noMma0K+Lz29v0wCgd+dOhz8lbAoL7T94GQCYdPFbl07v39u3c/eeYyeHXXyuzorf/frhrBF9\nu3T26dN/6MpdV79iGxH6FpIvfSBIQTVR8o1ju49s2XTh9OW07IPhKrvKTJrYO0nafyaY/7j8\nnqAUHjIBABjU1wFA+bOTZRFbj3oAcOLse+bt+3MfCFLgLU46fmBXxNoNu49eSjZmW0QOWwcM\n0zh239LP/Wu1ESFUZOGp2Ew/Nyn++8H9Jro9RcDZ8x+c2zVQVv7JrJ94KEnrYy96fzqWEpZs\nZisEgMiQccc1HkOHBJZSEHFXj/wWPMy0ektLZ0mOGRozHo2etdaj+4jpI9x0n+KWLY6Y6fJT\nWMfSOcIGdao6cWf4wPFXmtSv41WtWmW3UgJRudq1ywHAoIjIEqP6H68asnxo5dwVbho8eaff\nxF9HREldWy8J8yugaSbt69jYbAP+XmtNbNbJ5ZUzvbz7ze9XHoBeGzDxgr78r2NDS0oNVw9s\nXDphrF1khIeEBwCHJ4c17Tt6QLWSb67HzN843+GX6J6O2dYG1zaePHny8ePHzGuRSOTnV1Dr\nSJIUCoV8Pr+AGEsURbGMRNbqw61EIIRBjeq9VRuYKQJ7z2ERu5p4ZJ42rRe+7mTH3mFt27Xt\n29VRTj89F3X+ha7lrMPOIh4AUKIyAKC6kwjtyjDxUqk0PeUJACRcSRD4lSVJ8t0fiQQpau1Z\n56lKz8SIHbxW7D/iV8POsibMfqt/sWryhXeTry5SyqQF15wZk0cQhFT6hcgsBEEAgEQioWm2\nnfpMEaFQyP7DwuPxaJpmX6t/0xCW8VmEQiGzODYoiuJUK2YLcipCkmQhGg4AIpGI04FOIBCQ\nJNu+G2YVURT1fRoiELAdVE2SpEAg4LQrAseGUBRFkiSnhjMvxGKx2VzQD7YcpbjuigDA4/Hy\nrFjBy8XELpNzy1qmPXvOpep+EX88nqzr19SJEoua2Qr/d/KtT69yd658kpUaSgJoEw/sfZI6\nNyrQU8oHgPIVPU3X+0SvedRydp0cM9Sn3daY6dZtm7grhVCh3OwQ5VthHtc3uPeasbLKxbOX\nrt85HbNn2zpKZONZp2G3fv28HEU8gVBAECRPIBTm/DCbtK8j5i/SOdc0xd9y9/nFkU+q/7of\nzytXqUweV2ykvd0SFJRzosThy+sktfiQns2rAUDGh6gTb9LGbQ79xV4EAG5VPB719lu/7+Vy\nv/IAIK03oV9LLwAo1Smg7I6LcZ+0kD2x49rGCxcuHD9+nHmtVCqHDBlScD2FQjx7hTi4k6wF\ns6aUf/jMfq2lxqQ/T2/+bda61X5d3K+echLxAIBvU7ujf9MFiw4fWDmHKSKv5NeqpRvzWlis\ndxnJrNd7xr0Ye7aMnA8AQip59qATAKD7pOXz+Xw+/1yiljZleI7bfi7Ax9aQcHF/uP/IpSNb\ntmry6a6bOOdRd26PZUr3efd/4AAAIABJREFU4Ln1XNg3QSxme5KXIRLle945P0xDOBVh/6XF\nIAiCa0O4xgMA+xyCQVEU14aTJPkDNoQkyR+zIVyP2FwbDgAURVl3Q0ymgnpnMLHLJHboIqP2\nnnuYXMt+J/CdOtiJAKB1Q8epp/4HPV0OJWpL+VUGgLQ3t2mantyrq2VZqTEeIGdiJ7bv1MTt\n9LxBgz1r1ahSuXL1WvV+cs1jGDUAuHo1GuDVCAA0SfF3b14/vHvXjBF3l+8IdxXm9xuFjggI\nuunUccOKHuobm4bOn1C+7AabdYsj5eM3zvDKHW1TbmpeV8V+eZ04NSvFvEiNfUAJXZraZ343\nEKTYx0my6sor8CsPACVauGYVUVAk5NUvwKmNzs7OlStnduDJZLLMawbzQVGU2Wxm3xuBPXao\nxYKIJoIyXnXLAQBAyRq+U+ZSj0aHnl999NXsLuUA4PbCzgs23agzYF7fvh0cFea/r+yLCJ4X\n0j5++altjkKKIMWT5vQeNX5bcLPWTXyaK8jUhSf3xkkrA9ykxDyz2Ww2mwduiu4tLN+iCZML\nOjcfMO9/xF2PIacGRT09288tqyYkSSbcDV39LHXstTEF7+dZ8UxvAZvgLDwej2s8ADANYVmE\noiiapjn1XnBtCEEQFEUVoiEmk4nT8aEQDaFpuuAvWktFtiFMPHzjhjB9rlwbQpIk14YD94Zw\n/aoqoCFms7mA7zJM7DIRlKyLg+Tw4ed/ix4ryvozI9ZcOtTTHt731wf7VKN5cHV7AOBJBQQl\n3bVzc7ayZB6/ighKEbhkS/fYW3cf/Pnn/XP7tq3z7DxjRr/qljF61eXF4ef9JwS5CCgAENuV\nrN+yS+2G7l17hux4qZ5cMe9L9vTqa8fi06Yt7CImCXHdQVN9Hs8JDZEYVdVncPjFnx+DxW4n\nkWfuHjQNANnG8JEkAXTmJ40vLihVKkQbR4wYMWLECOa12WxOSkoqYP5KpTI9PV2v13+xaQyF\nQsEyElmrKo2a5pji2HoShJ5/t/sFdClnyri7aMtNZe0FwUH+zF8rtRw2zeHVoF6bV8T8Pbdv\nRQAo3nb+cpHbtq37bu2PyCBsvdsHXAgp7eV5U+wi1mg0Go2mat16AJCSkpK1CNvmEwBOPVl3\nP6XT595yqVS6ZcAGoU2j4HJ8y+D8iEQimUxG0zSbYAZJknZ2diqViv1Xo729PUEQGRkZWq32\ny9EAACCXy81mc3o6qwutAEAikUgkErPZzL4hFEUplcrU1FT2X43FihUDgIyMDJ1Ox7KIQqEw\nGo0ZGRks46VSKXM+jn1DeDyejY0N+3iCIOzt7QGA04HOxsZGr9drNJovhwIAgEwmE4lERqMx\nNTWVZRE+ny+Xy7luQQBIS0szGAwsS9na2mq1Wk67olAoNBgMKpWKZRGhUCiRSDhtQVtbWwBQ\nq9Xs81qlUsl1VxQIBHq9Xq3OuxuG2b3zhBdPfFa7pZP6xcGYuJSyPaowU8TFu9nxzKv2HeOJ\nynjbCABAUrwVmDOOJ5lEmYRRc6evOvc+99xSYvev37S3VOXaHXz9g2YsXDas4v0jW3LEUAKn\nG9ev77qdaDnRpE0BgBKy/LvQzUYAeKfJ3J9q+s90pz5kUI6jqtrlW6RAacbMA6Uu9XJaXlfX\n2lbxMOle/y8586NFm7UH4tPt67rmjsytkG1E6DuiRGUBgNabAECbsEdvpp17e1sG2FQdCwDv\nD77MmlKy6cCQrYfX//F8x/U7O5aPFadeAgDnVtmuqLDEE5UFALM+29eATnUx9EGi24AZX/0+\nSgihIgsTu8+KN/nZkPEoLsPQvUrmOVOCEPUuLf/7+Ft5me7MgVcgrz24uv32oDnHL9568ezx\n/nXBh2ITmzZwzD03vo3m0P5ty3adefzs5ZMH13YfjZe6NMgRQ4nKhXRwvxA2NnzHgT9u33/0\n6MHl0wdmByyXl23j7yQFAJIAzYe3ycnZfnkIbBr8bCfaPnnR+VuPYm9dipg++i+qXEVe4uKD\nTzm3meC7S/gXwmP+iv/4Mu7Wb1NWZ41vtSQp3rtFSenaoLCLtx49i7u3PWx8nMFmqC+7xK5Q\nbUToG9ElRE7q1ib86EvLifqUYwCgbFwCAEh+cQDQvMjW+WTU/A0AAvvMwS7nd+84dyTOMuDR\nqisAEFjLAQAyPm5t0aLF6P3ZFqFLPgoAxZtny/yeRU0z0vTgIRW+StMQQgjwVKwlkX0HJW97\nhrQ+c7Eno5pvWZh/t3TnillT2k9bposI3702LNnAdylXLXB+aPW8ep6kzr1mDFRtObIleGea\n1LZYhWot5o3okjvsp8Fh00vv/P3E8WUHPmqMhNLRpXoTvwC/DswveI9OdXWbVg6f4B29McCi\nEBm4fNbm8E2blkzXEFL3mt4L1/nbPo8cMCVkb6WNXSvlfQI3P1NmDV20cnfwyN/1Zrpy82GN\nUrbkFUWOWLZQvipiw6LpKiPp4lYrcPEITwnb/rZCtRGhb0Jg2zb1SeilmZO6NYsqIaQAgDal\nHwtZQhC8Ln5uACByHOAqXvx6U8gLvz1lFMxgZ/O1pSEAUGN45u1I3q6f/ft7aUnvaxXlfADI\neH92+J7nDrVmt1QK09ONImX7hD+Df580PrDNrrL/LGLD6EUEwQsYUtGyMgdWxglk1Xo7cr7S\nEyGE8kOwH6+ArBhN61PUtFLxw11e+i3G2B1+nvjlOGS93sQEjJseI7DzbNqpmQxSH1/Yd/+v\n1BojY6aMbsgEJJyZPWr0WrPQ1btzG0e56dm1AzfufXBsPGn1unFMh7b6z9VDu80FZZUWXVtD\n4pOHR4+/I8sd+ftW8+LS9PR0jUbzZNvohhN2iYpV7ePb3AZSb57Zez4upemEfbuCGmVVw2xI\ncitdWVRty6MTbVjWPGuMXWIi232YGWOXlJTEdYxdWlradxhjV/Cn2xIzQisxMZHrGDu1Wv2t\nx9iZTKbk5HxvaJoDM8aO/RbMGmOnUqm+9Rg7g8HAdYwd1y0IAKmpqd96jJ1er+c6xo7TFmTG\n2KWkpHzrMXY6na4QY+ywxw4BABCEQIkXFaCiwcV32fISNXZu2nEpZl2GkVfcvZb/kgmd2tXM\nCijWbOrqbR6RazffOrg5XU/auVbpEDSzT/+OWcMU5FVGhEeW2LBkzcUdKw1C+587DI6YObmp\nw+e7ElT0X3mpZK35qyL3bVujNvBcPWpPjwga1bmWZTVUr5apjGb3Xl//eTYIoaIMEzuEUJHj\n4u0/0du/gAC72l3Gbshj7EQW+1pdgqIyA7zt8xiWULFZ/83N+hcwB9vyszMylmY9KxYhhL4K\nvHgCIYQQQshKYGKHEEIIIWQlMLFDCCGEELISmNghhBBCCFkJTOwQQgghhKwEJnYIIYQQQlYC\nEzuEEEIIISuBiR1CCCGEkJXAxA4hhBBCyErgkydQkdPF3amAB/DlJhKJRCJRSkoKy3g+n29j\nYwMAXB/QqVKpOD1CkcfjabVa9s8tEIvFAoGA/bMgBQKBQqEAAK4P6OT6CEWKojQaDacnjVIU\nxX4LCoVCuVwOAAkJCSyLMA/oTE5ONplMLIsghNCPAHvsEEIIIYSsBPbYoSJn3+N3HEsYANh2\nDmXGv8/guAiAxPcc4z9xXgSw7Q78HP+ObS/aZ4kcV2/iR+6LYNvp+A8DAPfnsSawakieD4pF\nCKH/CvbYIYQQQghZCUzsEEIIIYSsBCZ2CCGEEEJWAhM7hBBCCCErgYkdQgghhJCVwMQOIYQQ\nQshKYGKHEEIIIWQlMLFDCCGEELISmNghhBBCCFkJTOwQQgghhKwEPlIMIVSU0IY+nmW1JrPl\nNIIU7fnzWdbbjGdnIpdFPHz454ckrUP5at49A3x9GxLZ5mK+vX3BvugDz19+cijj1rzX2Jkj\nO2ZfjPn0hnnLt+x7+PyTnWtmgJj8PI+U2BPT54afuvYg1cgvX+3nQRNm9/Mu/Q1aixAqcqwq\nsQvv53syWcu8JghCLHeo0dRneL92CooouGAh7BjU82bzect6lfvqc85Br360duH6a7FvZSUr\n9wmY0LiMPM+w79n23GiTaoCvf5LBPGprTEul6DssEaHCMaivak1m2zotPR3Fn6cSn5/3qvt4\naKzPiFQo1qBzlwYK+um5vTHTfB/G750dUD8r5lRw87X741zrtmrZvALvzxObZw2++DD88e7h\nWQGRo5sERsdWbtimX1u397eOMgFX1/Vg/pr85+Z6zUNUpFP3voNLiVTHo6Imdj/1Yc/tSY1K\nfPP2I4SsnVUldgCgrDJ4ol85AKDNpk/P76zfsn5iov26ifW/WPCHtT14Xqy734rxPz05smjZ\n5DDvqDn5ZWr/YduT/4xINoIDnzoQ86LlsErfYYkIFY4h9QwA1Jy1fGRZ2zwDbk2YnmygR5+8\n0LiUHAAgYPKaZl5nNvT7NDLWQUABQOq9OWv3x1UetWvOqEYA4G0/46deNUJ+H30wcYCPgwQA\nEm7ODIyOrTtxz+FJjQEAYCoTcGy+Txs7IQAEd5+RSthHX7/crqIDQRDjJgwdUKfpb4PGjHsc\nI/geP8QQQtbM2hI7gaKsp6dn5ptqXg7Pr0+/shMgW3Jj0qVTQul/ULlCOf8uvV6ot4OtVNG+\ntX7XUpWJtsmnE45N2/OTY51wXUVXNt4TO3QeUebivHObzcPCcOQm+mGlxcUCQK38+5UfvlBT\nYo/MrA4ASFHz5s6nIx/fVelaFJMAwJVp0ZTQNXh4w6wifVYtNu35mzBmnt7dPz6KJ3SNDPTO\nGWAyA4A26dC+jxkVeu9sUlLC/JUvrbBgRcMavU+Fv1EHlsq7Sx4hhFiy8q9gkgRK4My87t25\n0+FPCZvCQvsPXgYAJl381qXT+/f27dy959jJYRefq5kwfWrcmnkh/j19fbp0GzwqePflN8x0\nbcK932aFDOzdrZf/8FV7rjETtwzsOXjWbeb1s+iAjh07rnmVOZ+V/XyHLryf3wyfrB/t229N\nVj1T/17TyadHvN6Uuwl+Ve1urD9D07pjEVE2Fbrll9UV3Pb8GpVjnVi+ZV9Dk+7VlheqCn4t\nK/b9yZARu+tdBjP95Hj/PiP3Z4VlfNjTsWPHC6l6AKCNSXvWLhgzbEBX3z6jQ8LOxCWzbBRC\n/1LypQ8EKagmSr5xbPeRLZsunL6cln28XWVXmUkTeydJ+88E8x+X3xOUwkMmYN7ueZYqKTVO\nZvFJFNk1Gzp0aIfiTKJmXvZXqqLsBCUvZ0BrBzEA6FRXAcCxsbPlQm096gHA2Usfv3p7EUJF\njbX12OnVL2NjeQAAZtOnF3fWnU9oETAj66+XV8708u43v195AHptwMQL+vK/jg0tKTVcPbBx\n6YSxdpERHhLe1kkzr8gbjZ06wE5genR+84ZF473r7HQkk6ePnv3Goc6vAdNt6aQDG5dfSNQ4\nAzRu63x4336AmgBw++x7ikc+PBIPwyuZ9PFnU3StepQFgDxnWLpbW93htXfSBteQ8QHgzobr\nthUGlRRQuVvUNHjyTr+Jv46Ikrq2XhLmV7i251mH4gIy+zrJtoqKCa+xrOHHq+sNNG9QPUeZ\noK+j4Ni5rXG9gmsCQJ3BNVaF7Hir7+AsoADg6fZT4mIdvG0EABAZMu64xmPokMBSCiLu6pHf\ngoeZVm9p6ZzZgREdHX337l3mtUQiCQoKKqDVJEmKxWKhUFhAjCUez9r2ecTJh1uJQAiDGtV7\nqzYwUwT2nsMidjXxUDJv64WvO9mxd1jbdm37dnWU00/PRZ1/oWs567CziAcApvR7KQaTc/Vy\n93bOid72+8s3KS6Vqv3cpvfCaUMJggAAUv/wo95UsZ7n9Z0LZoVHP3yR7ORelQlgUj2iWCUA\nSLmnkfeTM3ujXC7XqJ4CQModrXxoQT12FEUBAEEQcjnbjj2mVjKZjKZpTkVEIhGfz/9iMIPP\n59M0TZJsewoK3RC5XM6+IQyRSCQQCFgG83g8iqKY6rGMBwCSJNk3hCRJTg3PwulAR1GUUChk\nf7hjIimK+nYNYbYgAEgkErPZXHBwFoqiuO6KAMDj8dhXjKIoTlvQsiHs90bmq4rTrggAfD4/\nz4oVvFxr+5JLfhRhmQZInOp7lf58SjG1+JCezasBQMaHqBNv0sZtDv3FXgQAblU8HvX2W7/v\n5XK/8o6tuo9u1r62jQAAXEr4rj8465nOSMSueqwVLV44oYKIAgD3yuIefnMBwKlZC/22NffS\nDdXExt8/aXr6uu49cR6GV0p7vZsmZX1cZACQ5wzrK9vUkm3cef59jXalzMbEDXEp9cPq5m6O\nSfs6Yv4inXNNU/wtd59fHPmk+q/78bxylcrIOLU9zzoUFwgs10mOVQTAqoYAcCzyqcylT1kR\nBSAe4G67+OZ6Lb1aRBC2FQfbUec3PUiaUssBaMPG658qj+4AANrEA3ufpM6NCvSU8gGgfEVP\n0/U+0WsetZxdh5nhw4cPT58+zbxWKpXTpk3LZ2tnYv+ZR+hOshbMmlL+4TP7tZYak/48vfm3\nWetW+3Vxv3rKScQDAL5N7Y7+TRcsOnxg5RymiLySX6uWbsxrk/4tACTfHDt739tqrTq3a2lD\nx56IXDj21JV3ry/M5wGA6S0AvL8ypMO21y269R7bzTbu0r7PAQQISv/qJQv5c8uQuHn3vWwo\nACBMH2YOOA4A+iQTy29u9l/wDPZfJ1l4PB7XX0Hs8yEGQRDfoSGFOD58h4ZwjQfuDSFJkusW\nJEnyB2xIIXbF79MQrnvjV2yIyZTH2bPPC+K0jB9f8Xpz10+uyrzWqRPPRc+dHzA6bPt6dzEP\nAJyalWL+lBr7gBK6NLXPHGdDkGIfJ8mqK6/Ar3xHnzYPrl/Z9yr+w4f3z2NvMAGfLsSLlC2Z\nrA4ABPKfasn4iQAiZevyovX7Y1Mqljmn4Zfp1KpFVPTGj4Yhnw7EyVx6yykCAPKcIQD0au40\nZe8JaDc46X5EOs95UAVFrtbQEQFBN506bljRQ31j09D5E8qX3WCzbnGkfPzGGV6c2p5fHSzX\nSe63LGoIevXNAwmaigPLvHr1CgAUzUqbHtzZ/Ew1vLwNQcmHeNit3voH1GqnfrPjlUE8pZ4j\nAKS9uU3T9OReXS3nIzXGA2Qmdp6enkajkXktkUh0Ol3u5WYRCARGo5H97z/MAou4FgsimgjK\neNVlrmcvWcN3ylzq0ejQ86uPvprdpRwA3F7YecGmG3UGzOvbt4Ojwvz3lX0RwfNC2scvP7XN\nUUjRZi0AaF/G94u83qF2CQBoV2b5Vj+PYXsWjLo2dm39EgZ9GgCon75ccPrx2AbM+da5TMDw\nSyPCf3IEoKLX9Pf0X1+3TG1//3YOZPLpXdsfyyoD3CSFdMF7O0VRzBdDwWGWCIIQCAR6vZ59\n1wLzRWI0Ggv+8rDE9NhlfWy/iGkITdN6vZ5lkUI3xGAwcDo+cGoI08PHqSEkSfL5fPZbEArb\nELPZzH4LMg0xm80Gg4FlESZx5LoFgWNDBAKByWTitCuSJMmpIUwfbSEawmlv/LoNoWm6gJ8f\n1pbYWRLK7VsNnLr2cP+oxykzqxcDAIk8s700DQDZBquRJAG02WxImDNi1BNplVYNqnvUqdSi\nY+PAMbMAAMicI9tseGQiAADRu4py1d6/Pta5LivdRaRsUJy/Yc/bdO2dpLJDawFAvjMEKOXT\nUbs//GFGvycbHxavP0mUaxF69bVj8WnTFnYRk4S47qCpPo/nhIZIjKrqM1w4tX26B+RXB8t1\nkvvtF2sIAG+O7qBp+vHGGaMsJl7feHf4vMYAUHVQffW4yI+GNi82X7Lz/NWRTwIATyogKOmu\nnZst50OQn/Otnj179uzZk3ltNpuTkpIKaKlSqdRoNOw/kwpFHukpKjqqNGqaY4pj60kQev7d\n7hfQpZwp4+6iLTeVtRcEB/kzf63Uctg0h1eDem1eEfP33L4VSb4dAEhLBzNZHQCo1ent5s6A\nPf1OzH8EB0sYaBsAsCkbOrCaXK3OHHGbGTDvpjqyEQAUaz334rayM9ftObx1uZpU/tw24EJI\naS/PmwIHc1aRPIlEIuakasFhlkiStLOzS0tL4/RVShCEVqvVarVfjgYAALlcbjab09PTWcZL\nJBImsWPfEIqiBAKBWq3mmthptVr2WZRCoTAajRkZGSzjpVKpWCw2m7+w4SzxeDwbGxv28Vnd\ngZwOdDY2Nnq9XqPRsIyXyWQURZlMJvYVY84Sct2CAJCRkcE+67K1teW6KwqFQqPRyL5iQqFQ\nIpFw2oJZDWH/G4D5quK0KwoEAoPBkF/FRKJ8rwCz5sQOAMyGRDNNC3KNDLOt4mHSxfwvWdtE\nKQIA2qw9EJ9u39o17c3GWx/1W/dNtaUIANCl/o+Jd/Quqb106rmWOeEIJu3fV1Q65rju1stD\nNW333ZT3Lr0qAkH5ush2773yQaWbXcseAPKbIQCIlC1+kq3bcurK8zdp/WdWzKv2RgB4pzGC\nXAAANf1nuh/3e0w7jqpqx6ntaW8i8qtDwb5cQ4Cog6/lrv13rOySNeXqrMFhdzYkG72VPEJe\nul8p/tGND+Of3U/8ZXkNJkBSvBWY/zieZPJxZs4U05umBqc0HBPYqiTLiiH0FVGisgBA600A\noE3YozfTbr29LQNsqo4F2Pz+4EvoW5EnrUEShMjFwzJAoKgPAOkv1QAgkNWmCELqmkdAxqu0\nrClurQdvbz1YKpUSBJGWlpb8ZDwAlPil+DdqI0Ko6LC2q2L16pex/7h349KqGbMoocvAXOcQ\nJcV7tygpXRsUdvHWo2dx97aHjY8z2Az1deXL3Wja+PuFBx8TPsTdPrsodCsAvHqXYld9REVB\nxtSQZVdu/xl39+qKydPlwsxkUVHOj9T9ve1tenMvJQBU6eTy/nyEQNG4qoQPAPnNkPnt3KNV\nyaebl5Py+h2KiSEXgU2Dn+1E2ycvOn/rUeytSxHTR/9FlavIS1x88Cmnthdch4IVXENtwqE/\n1Po6v/5iObHa4GZmU2rEI6ZDUzC4jsOtZbOT+R7MiEMAEMhrD65uvz1ozvGLt148e7x/XfCh\n2MSmDRxZVAehf0WXEDmpW5vwoy8tJ+pTjgGAsnEJACD5xQFA8yJbz5NR8zcACOzFAEBQtg3s\nROnPLlsGaFNOA0Cxug4AQPKUPvYi1dM8AuxrF2PexmyPjN4XaxnwaNUVABjuVewrNBIhVLRZ\nW4+d5QUEBE/gUuGnKctHOeVxLSc5YtlC+aqIDYumq4yki1utwMUjPCV8kHSZ0f/j+siFRzKo\nMm5evUNWKZeOig4aVWvnzlkrQ1f/tm3FvFAQFfP2Dfr1+tJIZkZ8x66O4phkZRMbIQDY12xF\n048cG7VnFiMulu8MK4ioUp060XuWu3bplU9ryMDlszaHb9q0ZLqGkLrX9F64zt/2eeSAKSF7\nK23sWinn7VXzbXv+dfji+iy4hk+3H6VEpYdVzlYTqXPP6rK9DzZehd86AEBF/xb6IZHlegVb\n/oZoP22ZLiJ899qwZAPfpVy1wPmh1WU49A19cwLbtqlPQi/NnNStWVQJIQUAtCn9WMgSguB1\n8XMDAJHjAFfx4tebQl747SmjyLy/ybWlIQBQY7g7M5PO/T0uLQ2Pvti7ZyNXAACzbuPQ2QAw\naFJmL93Y4Z775qwIO+sX1DRbgN+YzHt3//3bzN/ipRWa32gslQJAxvuzw/c8t/ea/Ist5ysD\nEEIoB4LrpePoK9IkHOo5aNO8nbs9JD9ohv2f15DNGLv09HROY+wOP0/8GlVD/y+9iQkYNz1G\nYOfZtFMzGaQ+vrDv/l+pNUbGTBmdecPhhDOzR41eaxa6endu4yg3Pbt24Ma9D46NJ61eN44Z\nZEobPy1s0eDGe51X2x5upWWp1/aevPPJs/eqe5G/kiSZnp6erno1oM5Px97qmnTuVauM7P65\n3UzAuRW+zCKSHoR7NZ8Fdh4D+3ciP8Ueijn0jiy389Zpb/svPI4va4xdYiLbfZgZY5eUlMR+\njJ29vT1zgvibjrFj7nlR8KfbEkVRSqUyMTGR/XdWsWLFAECtVn/rMXYmkyk5me3NOJkxduy3\nIEEQ9vb2AKBSqb7pGDuRSGQwGFJTU1kWYcbYcd2CAJCamvqtx9jp9XqVSsWyCDPGjtMWtLW1\nBYCUlBROY+wyMjK4jrHT6XT5jbFjdu+8a8hyGegro40Gs+nEin2yUr1/0Kzux68hQty5+C5b\nXqLGzk07LsWsyzDyirvX8l8yoVO7mlkBxZpNXb3NI3Lt5lsHN6frSTvXKh2CZvbp3zHr0iGC\n5zDh8JGYeXP+d+7gg5MGpwrVxixYHjqoZdYcSL7DhksnFofO2nVi/8XDhhLlcwbYVR11/WCJ\nkFmrYtYt1guL1ekwOGLm5JpfyuoQQogN/ML+b+hSz3X3X0nylcN/a/tf1yVvP34NESocF2//\nid7+BQTY1e4ydkOXAgIoqVuvuVuZAQre9nmMIuDLKoas2B6S/xyc63bbeqRb1sUTrOqNEEIs\nYGL33xDa/LJ6qavAuZzjj9oZ9uPXECGEEEI54Hf2f4TguVTI+wYiP4ofv4YIIYQQys7abneC\nEEIIIVRkYWKHEEIIIWQlMLFDCCGEELISmNghhBBCCFkJTOwQQgghhKwEJnYIIYQQQlYCEzuE\nEEIIISuB97FDRU4Xd6cCHsCXm0gkEolEKSkpLOP5fL6NjQ0AcH1Ap0ql4vQIRR6Pp9Vq2T+3\nQCwWCwQC9s+CFAgECoUCALg+oJPrIxQpitJoNJyeNEpRFPstKBQK5XI5ACQkJLAswjygMzk5\n2WQysSyCEEI/AuyxQwghhBCyEthjh4qcfY/fcSxhAGDbOZQZ/z6D4yIAEt9zjP/EeRHAtjvw\nc/w7tr1onyVyXL2JH7kvgm2n4z8MANyfx5rw5Ybk+aBYhBD6D2GPHUIIIYSQlcDEDiGEEELI\nSmBihxBCCCFkJTCxQwghhBCyEpjYIYQQQghZCUzsEEIIIYSsBCZ2CCGEEEJWAhM7hBBCCCEr\ngYkdQgghhJCVwMSLz7+1AAAgAElEQVQOIVRk0IY+Hi5dKzlb/utWpZxlSMazM+tG9xj9S1Vf\nL7eRXbruirmU31Nyn6wInr7jWe7pz89s7tuhiVsZF2eXMnWb+SzecTlXiPn0hjntG9Z0tLV3\nr15v0soDGjPbR/EihFDB8JFiCKGiwqC+qjWZbeu09HQUf55KfH4smO7jobE+I1KhWIPOXRoo\n6Kfn9sZM830Yv3d2QP0cszIb3q3cvFPWs+fMPtnywvcXZ/3caxHPzqNn/5EOVNrl/VFh43xu\nJJzeNdYrKyZydJPA6NjKDdsM8qny7o9Dm2cNvvgw/Oq6Ht+kzQihIgYTOwCAB6ejY46e/z/2\n7jMuiqtrAPiZmd3ZzrKAoIgNRcCGBawRjR2NgIi9YFcULFix994FoyigooI9+tiipthj7BrF\nkmiCIoLSy/ad98MSXASWGYK+CZ7/zw94994798zMzp6dubPzLOGtnhLbVnNq59WvX0dX40s5\nSa+zhbZVFLT5Hhh99oWDMd9fvpWQnM7wpTWcm3gPGuFZ19L46sBePi3D9020l5bU3Nvb23dH\n3Ag78acYpyb70bbVO36JfyOt6jpoyrR2NWXFdn57esCip+lFy48cP8EnyjjgfzhyhMqXNvMH\nAGi6eOOEWpbFVrg9bUG6lgk+d6ldNRkAwJTZ33Z0+2FnwLsJ8ZVoyliH0Wa/enTz+41T36i0\ndYv0sHLkVkLkcuHOOWcxHwAMsyb7uza5tGa4Kvi2kCQA4P2tRSFx8S2mHz45o51EIiGIpU17\nOoUeCz6zwtfLSvCJAkcIfTkwsYO/TiyZG3mvY98R/iOdBIacFw+uxYTNepqzYb6PIwBcXjjj\nZOP54YEuZnpgDHnh08f/nGLdq++ggdUVuWkpdy8eWzdzXO6WSC8HCZsxeHl5uYhK2RZlHufe\nWcvjnQdvmtr82ak1G2av8ty/tEielk9o2WH+jE4fFfKKq81mwP985AiVr5wn8QDQTCEsqcJv\nf2ZTovr5WR0AkMJOnewvxDy9l6XubCMGAL3qxYCmbfUlXDk1aJOjk3JtW88zZnUAQPIrTWlh\ne/ncq1+ztZ5yGgC+m7qfJ6gRE+JZ0GpQ+Fr94T8IvaF8gkQIfdkwsYPoA/ftO8yfOCj/QolL\nw6au4pchMSvBJ4JlD0/3zPnhteXq6DVOkvyjeduvO4nGDt674qRXOKvLK4GBgR+V6NW5lKBQ\nUljmcV5Mym05x7OSpcTim26aA+uz9IycKj61I/mVGjRoYL4348CKDtiMf76GESoX6VeSCZJu\nJEy/eeZKSnK2zMG56detpNSHqcauNaTnbsXfTVM1sTImf4Zfr74lKIv60vwzyiRdZV7kAQDQ\nq54tCZxbZAnk1m3bhA5NTItSMzQESTuKjCf8DBt+z7RwXKQw+cIktOo4ZkzH8o4VIfSFwsQO\n8vSMOj3ZtKS614Q51dIYgIhhfU+lqSBpRp+rbQ7tnVl8e0a7/uSftQM2FWR1AAAEr++0Mda/\n5X5UV5P5JDJ89/UHf2RpDDb2dboOCOrTxgEA/H18ukfEjrATD+zlMzAiMiVqw0+/iWJiCn1s\nlHmcgxtaxe74Ydz8rmci9svr+JeU1Zn30cAKBszo0o7sjLh092liusa+diPfgDEdXRQftf2n\naxihcpJ8OxUIwcy2Ld9ka40ltHWDsREH2tfP32lbhm0/5z1wVfce3Yf0tpUxz3/af/FPdZfF\nJ+2F+YdKghQ1bPUVAOhyRUX7J/mVBg0apFQqAUCZlZ6Wlnz7wv7g2yl1/L51oCkA0ObcS9Ho\n6zRz/Cl68eqII48TMqo4N/To6Ldk5nDLYs+NI4QQR5jYwUifhtNjw0ZMvda+lYdbo0auTtVo\noaO7uyMAjIyIqRw07GzD0I1jXEtqrs68+Faj797a9qNyed0OfkUm4OyeseiarO2kecOtaP2j\ni9E710z19Ii1owvdm3x1yyI3z4AVAbXLa5wdZs2OHTx93Pj9khrd1q0abGZVGLTv4uPjTUtI\nnsLZqbKZgcWETj6rrD9mdEg1C+LJ9VObZ43Vb93Vxb7Q3DuuI9+6dev169eNf0ul0i1btpgZ\nM0mSEolELGY724+iKJY1UcVzN10FBmW1oWGLArpJdGmPL0RvXrx962A/5+vnqwh5AMCXu3sP\n7bByzcnjW5Yam8hcBnft4lRShyQts7TMn65HkiQAiEQigUAAAJPr19yXkgsAdi0Dr+8dYfxC\npdRlAEDKrxP7xb7u1Lv/xD6KJ1ePxW2c+fPN1Jc/LSs1tTMugiCIgoWyZGFhwb4yQRAAIBaL\nhcISr1l/hKIohmH4fH7pVQHg70BIkmQfiHFUcrmcZf0CYrFYJComCy8WRVE8Ho+m2U75LVsg\nZdiCAMD1QEdRlHFXZMMYCI/H4xRIGbYgAEilUoZhexs4RVFcd0UA4PP5nyEQmUzGPhCSJLnu\nigBA03SxAzMYzM3cwMQOnAcs3FLv8o9Xbty9cPDwnu2UUN7A4yv/gAA3WyGPFtAEQfJogaDE\nA5Ze/RoAHGhWPxxj27VPcMdv3OU0ADhU7rvjxOIXap1d4YNIpt3o/p0aldc49apXESvWqO2b\n6hNvO/t+bcsns39/kMhzdKlZzJ0cqowfZ8780bREaNXj4K6xJQ1MlXr8yLPMZftDGkj4AFC7\nbgP9jUFx3z7qssTjn4z8zZs3BfmlQqHg8UrZSzFXQyx1XhnRnq7p1sJ4H2vVJn3nLqMeBc+5\nuPV0whI/RwC4s7rXyqibHsOXDxnS09bC8Me1oxGzlod+k7jx/B5bQTG7GUFSH+2fJEkaPyMn\nRe3zSn4Tf+vcuu3b3LyETy+sk5AERWoAIPv3hLUXX4a0rQoAAOui+jmNPLh68u2QbS3tWAZS\n6pviH9YHk0BYMn46cl3KZwiE6/GhDIEQBIGBsPfFBlKGj6qSAtHr9WZaYWIHAFDDre1wt7YA\noExLvHfrxslDBxaOv7dxX1iN4g7lHyFpOwBI1BjcC5cz+qxXiRnyqtVML316+3o9vHHtaEJi\ncvLbl/E3i+2wSsdq5TdOJmLKzFtVvHdu6pd9M2rMimm1a+2Ub18bI5saudCtaG1xpX5xkYNK\nWnrRgeW8vsMwzOwBvU0LJbpEAI+PanIauaenp51d/iecUCg0XtgqiVAo1Gg05r++mGL/XRxV\nPPXadvioxLbbDJhzMenQn+DnqM+7t2bXLYX7ylkzhxpfdekydn6lhJEDojcd/GPZkKK3wAKj\nUxfsn0KhkCAIrVar0+kAoEGHLg0AYMCwno6dW07fMPJ8ULRnFbXeAgDktRcFulsplUrjKa5e\n61eMPNjv7NI7ykPtzY+fx+MZm5h/U5giCEIoFKpUKvanFownFQoCYYOmaYZhtFoty/rGQBiG\nUalULJsYA2EfOPwdiEajMf8paIqmaYPBwD5wPp/P4/EMBoNarWbZhCRJgUDAdQsCx0AEAoFe\nr//UgdA0zXULAoBarWZ/xBYIBDqdjtMWpChKr9drNBqWTSiK4vP57AMxbkHgGIhQKNRqteUV\niMFgkEhKvDXzS0/sNFlX14ZdHDptpnEGjMiqaqsufu5fOffuH7rvr+zZdUs/NyuQt1fwtl++\nnOzjW8O0PP1JeFDo9UX7jzSR5p+LMmjfLx0f9ExSr2ubxvU9XDp7twuZuLhoh2JZMRulbOPU\nZP9yJjFn/mo/EUmIWoyc5/t06ZxQsS6r8UKHUuNiMzCehCYoyYHYaNNCgix01rAMI+/SpUuX\nLl2MfxsMhrS0NDOjomlarVZzeg+zrIm+BJSwFgAwGj0AqN4f1hgYp4GephXkDScBRL898RcU\nl9gZdMrc3PyptAKBQJn8w94TLxw6f9Nc9uH7g/03g2H61Qcn/shtZmEgXCmCkFRzMraSSCQE\nQeioJgCQ8/J9QVclEQqFxnyo1JoFSJIUCoV5eXmcPoEIglCr1Zw+6gwGA/tRicViroFQFGUM\nhGuGqlar2ScrFEXpdLq8vDyW9SUSCY/H4xSI8VIv+/oF+ZBKpWJ/oOPxeBqNhn36KJVKeTye\nXq9nPzA+n8/n87luQQBQqVTsvwPw+XyNRsNpVzTmQ+wHJhAIKIritAWNiZ1SqeT05Yfrrmjc\nG0samJnE7kt/8gRFV7l548aBO6mmhXpVBgBUlrKaL0KQopBOVf/Yt/pJtslbjtEfDX8oVHzd\nxKSTnNeRt1M0YevmDenj7dmqWTVFzicfp0EHAEnK/D2v6dBFzlRyHmUb1NCK/aLNENt1BUPe\n2TS9MJ9g/7IF4T+9LYeRI1Te1O9jZvh7hZ3+y7RQk3EGABTtKgMAybcDAOWfhQ6jOuUfAEBb\ns5oZo8k9Pnbs2GU/vDEtNM7WECgEAEDyFL7WwqznhZ5Focq4AADW7jacQ0IIoSK++MRO6Bja\n0/nSqklh+47/eufBo0cPr144vmTKRlktr6FVJABAEqBMfpOengUALw7vjd7zv6KdNBqztI1t\n+pyxU2O+u3Dv4W83r13YPH/c/97oBswdYVqNL3NiGN2xSw9T3ic/ufPjmjm7ASAhKYPN92hO\n4yxAy9u0thLunb3m4u1H8bevRCwI/p1yrMtLXXviebFLMd488ZEkTYmnjmmZ+6jG1ntnLj17\n+fafL55+t33W/+JTO7QpdB9J2UaOULmjLbtnPnt0ZdGMt+r8XZrR554JXUcQPL/BTgAgtB1e\nQ8R/FRX6Z1bBlzTDL+tDAaBJoDObRcgcZtjwqfvzl2fq/j6rxGjjZu0BAD//6saCSYENchI3\nrfrx7/zSoIocswQABk/En3JECJWDL/1SLAA0H7VqQfXYY9+f3XA8RakjFLYOjdsPnjK4p/EO\ntfo+LdRRWwKnecZFTkn88czJNIfhQ3t+1APBU0zdFHZy757zp/Ycf59FCi1qOjeZunq4p1Oh\nG7hENn4Lh6XsiFl9Ko+q6eQ2MDRcsT4obmZQs9jY8h2nSSMyZOPi6LCoqHULlITEuann6u1D\nLV/GDJ8besQlsrfLx5dBi948AQCdtu0388yMb+ZvUEeEHdq2Kl3Ld3BsFLJiTuMi5+HKNHKE\nyhnBs543t/fkBQdDOnTv4NNRCplPLx198HtmkwkHW1sJAYCgpLPXjgoK3jajXXvPXl62Mv2L\nX47fvJ9s227GaLdKbBZBCaodnv91+3nHGrdIHtqnrVSXceeHwxd+S3XttzHQIf9N5By42yuq\n+br+rW73GtCqruLe+djTt1MaDAwPrFH8I2EQQogTgv18BYQ+v1Ln2CkUitzcXPZTTywsLE6+\nTC29HqqgXl/aExu179Fvv+fpeHbOzToNnebTo6lphbRbR2O2Rd+79yhXQ1rVqNfSb9SgYd5F\nn6qny73dr1nPusNOX12Tf6uQlZUVSZK5ubkXo5eujTp099nrXD2/urObz6AJM4d3Nr04os15\ntnbO4gPfX0/O1lVxatxryIQ5I7uwuXoiFAqNPxWRmsp2HyZJ0srKKi0tjf0cO2tra4IgcnJy\n2E9skslkXOfYicXiUt/dpiiKUigUqamp7D+zbGxsACA7O5v9xCYLCwuuc+xEIpFer09PL+Z5\njMXi8XhyuZz9FiQIwtraGgCysrLYH+jkcjnXOXbG2f2ZmZksm/D5fJlMxnULAkBmZib7OXaW\nlpYqlYrTrigQCDQaTVYW26tAAoFALBZz2oLGnyDJyMhgP8dOoVDk5eVx2hWN0/Kys7OLrWDc\nvYsfIctlIIRQBeDgOXS651AzFazc/Sbt9Cu1H56k2ZEnbzyti5kn2rz/1IP9p5ppy5fWDd20\nN/TvmydycjhMt0UIIfO+9Dl2CCGEEEIVBiZ2CCGEEEIVBCZ2CCGEEEIVBCZ2CCGEEEIVBCZ2\nCCGEEEIVBCZ2CCGEEEIVBCZ2CCGEEEIVBCZ2CCGEEEIVBCZ2CCGEEEIVBD55An1x/JyrmHlO\nS1FCoVAoFGZkZLCsz+fz5XI5AHB9jlNWVhanJ+3weDyVSsX+uQUikYimafaPDKJp2sLCAgC4\nPseJ65N2KIpSKpWcHkhFURT7LSgQCGQyGQC8f/+eZRPjc5zS09P1ej3LJggh9G+AZ+wQQggh\nhCoITOwQQgghhCoIvBSLvjhHnyZxbKEFYHvVL7/+2zyOiwBIfcux/jvOiwC213k/1E9ie3n0\ng1SOqzc1hfsi2F5N/psWgO0F6w/efxyIpzWfcycIIfR54Rk7hBBCCKEKAhM7hBBCCKEKAhM7\nhBBCCKEKAhM7hBBCCKEKAhM7hBBCCKEKAhM7hBBCCKEKAhM7hBBCCKEKAhM7hBBCCKEKAhM7\nhBBCCKEKAp88gRCqoBjtoAa1VHqDaRlBCg8/fmFSYLizd+XRuOMv/3onq1anqV9QwIieApIw\n30NK8quC/778IXr+xt2/PPw9V8+vWc+978iZk/u6m9bPiP9+wbKwc788yNLStd1aj5y2JMCz\nejlHihBCf8PEDiFUMWmzr6v0BkuPLg1sRR9KiUKPBTs/q9O2757UaNG1S6c6affPfr923MN4\n9ZZ1fYrtoRJNAgBBfugh+ery1gM28qzq9x82obpEd/FQ9LIJXteTLhyY5GaskP44umWn0Cyy\nSq8Bw6rSWT8ePjS9z/nkw3dmtK38iaNHCH2hPlNi9+eRkCmxOccOR7Bvsm9k/1udlm8Y4Ojt\n7e27I26EnfjTDY/RZw3vOzRNawjafbCLQlhe3WqyH21bveOX+DfSqq6DpkxrV1NWbLWHy0fP\n+SW54L8EQUmsKjdt22PCsB6igjMH/yYDe/m0DN830V6ak/Q6W2hbRUF/VIFrRAXb+tOOG31h\ntJk/AEDTxRsn1LIstkLm/aXbvnviGnRgaVBbAACY4zLWI/L05F/neTe3FBTtoeizYtcG7iBE\nLhfunHMW862srGDp7A6Val5aM1wVfFtIEgAwq8/CTMI67sbV9lXFADBj9oThHh02j5w4+elB\n+t/45kYI/ef9B87YeXl5uYg+7TjTH0ek66ASnzp+8M8uY13Kq9u9s5bHOw/eNLX5s1NrNsxe\n5bl/aUlHclrmvjDUz/g3o9ckPPgx4vCO1+C0cYRzeQ3mU7i8cMbJxvPDA4tZY//RiFBFkvMk\nHgCalfxV7dr8OEpQY1bgVwUlHVeuMvzvBfH3tVfzPRi072Le5tq2nucszk/4SL7djNZ2Pc78\n9Wu21lNOq9L+dzQlr87AWGNWBwB8SZ2Vm75qMvB82OvskGrFf9NDCKF/4v8zsdMbGIrFGanA\nwMDy7bCoa5H3RZV6ja95eflP0Yaxq8rrjpKLSbkt53hWspRYfNNNc2B9lp6RU8UPj+RZNWjQ\noOC/Dd2aai7fjr34Pfxn06CKFxH6z0m/kkyQdCNh+s0zV1KSs2UOzk2/biWlCt7fhsMvMsU1\n5klN3pW0okOPoR1K6iHZtX6nLq0VvIIeyI2bN1s4NjFd6Pt0NUHSjiIKANRZ1wHAtp29aQXL\n+i0Bzv94JSVkACZ2CKHy9/+Q2AX4+X6zaWn8ilW3E7OkCruWXsOD+7UCANX7+xFb4+49ea7k\nVfrKO6Dg2om/j0/3iNgRdmJN5pPI8N3XH/yRpTHY2NfpOiCoTxsHMx2WVP8jenXCrj+zXCZ3\nqVtLrQ0+eSApb0AVMQCcmzp0t8pvX7ivsVpe8uH+o/dMiznsKacZXdqRnRGX7j5NTNfY127k\nGzCmo4uiaM+DG1rF7vhh3PyuZyL2y+v4l5TVFctWzCO0kr9HmLg3POKnW/GZWrK6UxP/0ePb\n1pKZKU+5c2bb3pNPXiUREmvX5l1DxvUWkwQAFDvsMoe5fVjfU2kqSJrR52qbQ3tncoqopG2N\nUDlKvp0KhGBm25ZvsrXGEtq6wdiIA+3rKwBAn3s/Q6u3b+x4P3Zp3J5jf73OUDjWc23Xe9ik\ngIJU76MeogCENg3XxB3u72YFACTfun///saayqz0V+lJv57dNe5mch2/bx1oCgB4wloAkHbz\nPfjVLBiVMukxAKT9mgYDan+uNYEQ+oL8/5yxOzl7VYchwcMbVX194+CKyBWVvo7rZ6VcELzk\ndSWPcVMWWDJpxyM3XkpV2hdutXvGomuytpPmDbei9Y8uRu9cM9XTI9aOJovtsL+t2Ex9UynX\nd2gZ3siWtlJ6iC195qfdTwbMagoAHqOahIfue6PpaU9TAPB873mRTU9POQ0AMaGTzyrrjxkd\nUs2CeHL91OZZY/Vbd3Wx/3gWYIdZs2MHTx83fr+kRrd1qwazXDmMVpXw+Mr2hOyWQd2NBdum\nTL+kqT1u0pyqEu3145Hrp02yiomoL6aKLXeGp8GLt9XvM37BeCf1uycb1kYscmi+yrt6ScMu\nc5gjI2IqBw072zB04xhXThExulTz23ru3Llnz541/q1QKM6fP2++fwsLC5brFn1R7qarwKCs\nNjRsUUA3iS7t8YXozYu3bx3s53z9fBUhT695AwDptyYtOfqmUddePbrIE++c/ili9t3bbyL2\nzjamdh/1oPjt4NAJ60N8/Lq+u+dUeH7IkPo196bkAoBdqwk348YYv8VZW01yky58vH9y4toH\nbnIaAAyaN7OCfgAAXbbAxsbG2FYo5DavlyCIgrYsWVlZcaoPAFKpVCqVcmoiEolKr2SCJEmu\ngVhbW3OqDwAymUwm43BylKZpsZjblG6KorgGwrU+cD/Q8fl8iUTCtclnCEQul3OqX4Zdkabp\nzxCIpSW3kxJcd0UAEAgEAoGgaLlerzfT6v8nsZO0nBbQxQ0AqvlMqbXv8pN3qnd/hj9VCdeu\nnlZHSAGAs6uo3+BlH7Wy7donuOM37nIaABwq991xYvELtc6OpovtEGzFZuqbOhPzXOowqJaQ\nAhANd7Zce2uHitkqJAjLuqOsqItRD9PmNqsEjDbyxjvX4J4AoEo9fuRZ5rL9IQ0kfACoXbeB\n/saguG8fdVniYdqtXvUqYsUatX1TfeJtZ9+vbflk9u8PEnmOLjWL2UFV6ee8vc+Zljj7zp7S\noQoA5CXHfv86Z3L0nK+thQDgVK/+o4GDdxz9a3nnG8WXd7mjNDDdurd3VgigjuOSUMUbgczM\nsDsvLGOYPFpAEwTJowWCj2eUm4/o3Z3StzVC/1znlRHt6ZpuLYw35VRt0nfuMupR8JyLW08n\nLPFzZAwqAFD9lRgQc6Onu/Ee1fk/TmkTfiZs54PRY90qFe2h2+jVl6n7LiPPjYp7cXF4XdNl\nTYza1y35Tfytc+u2b63fmX56YZ2EJAhSfHTnyLoDtrWo6REQ0KMSmf7DgZh4aT2Am9QnnjeM\nEPpi/f8cXCp3rlHwtwVFAgPvLiUKFV2Mn/QAQMuaN5PyUwu38vb1enjj2tGExOTkty/jb5rv\n0Hz9AprsW8ffK+uOqJmQkAAAFh2r6x/ejX6RFVhbTlCy0fWttu7+FZr1yH69L0ErmtvSFgBy\nXt9hGGb2gN6m/Uh0iQCmiR0TMWXmrSreOzf1y74ZNWbFtNq1dsq3r42RTY1c6FZ0GIVvNVAl\n3L8QcWTVwc57+laTZcY/pAQOHazzv9MTpMi3ijj8WkKmQ/HlogE+7Z0uLB85qkGzJvVcXRs3\na9m8hsLMsAnK4x+EWSIzEZW6rX18fJo2bZr/Kk3n5OSYWZBYLNZoNDqdjs2ogPtJBfTfVa9t\nh49KbLvNgDkXkw79CX6OJN8KACTVZ/2d1QEA2XbBgvAzI+5tfwpbKxXtIScnp1L32QDnnm3/\nLadPoSsKru06ukskxIhAnzptm0/dMOL7wMi2VQDAtsfqX+Mc54Yf+N+uDVmkom3PGTfmVXdx\nGi6wY3JycozfxdVqNcuI+Hy+QCBgGCY3N5dlE4IgJBJJbm4uwzAsm0gkEoIg1Gq1Vqtl2UQo\nFDIMwz4QmqZpmuYUCEmSYrGYUyDG0zwqlYr98UEoFBoMBo1Gw7K+MRCDwZCXl8eyCUmSIpGI\n6xYEjoGIRCKdTsd+CwoEAj6fr9frlUolyyYURQmFQq5bEACUSqX5E06mxGKxVqvltCvyeDxO\ngfB4PJqmOW1BYyB5eXkGg6HU+kZl+KiiKEqn06lUqqKvMgxj5uTf/09ixxdRHxcVuelBziNN\nP+wN2vdLxwc9k9Tr2qZxfQ+Xzt7tQiYuNtOh+foFXp/exzDM08iFQSaFNyLvBS5vBwANR7bK\nnhyTovX6M/qKVYNxtnwSAHgSmqAkB2KjTfsx/WkrANBk/3ImMWf+aj8RSYhajJzn+3TpnFCx\nLqvxwmIm+UExtxq4Pznf5+fjiX2DXBgGAAqtHJIkgDGUVE5QFiHrdvWJv33v4ePHD346umd7\ng14LFwY0NjPsModphpmISt3WHh4eHh756aPBYEhLSzOzIJFIpNFoOB2IWdZEFQ8lrAUAjEYP\nADxJE5IghA71TSvwZC0BQJVY/GeVSqUygD0A6FVKlUqlTLl4/Mckxx5+zWU0AIjFYoIgavoN\nh6lXHp78U+WRPyG1eodhezoMK+gk/dlUALBtq1CpVBRFEQRR7IG7JMZckH0TkiQlEolarWb/\nCWRMI7RaLful8Pl8g8HAaVTGxI59E4qixGKxSqXimthptVpOGWdJH6UljQoAOAXC4/FEIhH7\n+gWJHacDnUAg4BQIj8fjuhGNXzO4bkEA0Gg0nBI1rruiMbFj38SY1HJaVwWBcErUuO6KFEWZ\nCcRMYvdveaSYrWdVVcb5l6r8LF6v+uNaVqH4c15H3k7RhK2bN6SPt2erZtUU5s7isK+//8Qr\nWY1hJ0yEuttmxO9M1zEAIKseUI2vjvwtcceD1K/H5t/7JrbrCoa8s2l6YT7B/mULwn96W6hf\ngw4AkpT5m7zp0EXOVHIeZRvUkO1Ml7oivjIpDwAs69XXq1/9nJ6/aRmD6nhirnWLGiWVZ8R/\ntyPqSDVX9559h85cuHrD2LoPTu0yP+yyh8lFQUSlbmuE/jn1+5gZ/l5hp/8yLdRknAEARbvK\nAEBQlm2shLkvrhau8AMAWLjZlNSDOv00ANh1qgIAmryzwcHBy354Y1rBoH4FAAJF/rSYg3tj\n4o7Gm1Z4FIo7GLAAACAASURBVH4NAALdOE/oQQghNv4tiZ1N4/F16bx5oRuu3Xn85N71TbMX\nyASFTsLxZU4Mozt26WHK++Qnd35cM2c3ACQkZZT0JZRNfdX7//2arfEY97Vpw0ajOhr0mRGP\nUgEACHqUR6XbG5ak8+sPcsifG0fL3Ec1tt47c+nZy7f/fPH0u+2z/hef2qGNrWkntLxNayvh\n3tlrLt5+FH/7SsSC4N8px7q81LUnnrNcIQKK0KSlAYDYbmDnqpJtM1ddvv3oxZP7e1dNfaKV\nj+lbo6Ryvlz5v+/2bDjww9MXfz17+Muh04kShzalDLusYZIEKJPfpKdncYqo1G2N0D9HW3bP\nfPboyqIZb9X5XyEYfe6Z0HUEwfMb7GQs6TWsvuptWNzlv1M3g/rs1GUA0Gl03ZJ62Bm8hiB4\nU0bXBQCpfZA1n7o/f3mm7u9zSIx239QoAPDzz39o2B+bF00J7n8rK/9ES97bHwMPv7R2m/21\nJZ45Rgh9Ev+WCbwEz3rxljlbN+/ZtHwOCG08+84cd2N9jEkFkY3fwmEpO2JWn8qjajq5DQwN\nV6wPipsZ1Cw2ttgOzdQvmN31fO9pSlh9rGuhG1sk9v0bS488jLwOm3sCQN2hnTWjYxwHzDJN\ngb+Zv0EdEXZo26p0Ld/BsVHIijmNpR9doyRDNi6ODouKWrdASUicm3qu3j7U8mXM8LmhR1wi\ne7uUfitNNReL3It7bmV7usvo8RtWy8Ijdq5ZkKUjHZyahawd30DMB4Diy8UDFo7I2nVq16zY\nHImlTZ1GnZeP9yt12GULs75PC3XUlsBpnnGRU7hEVMq2RuifI3jW8+b2nrzgYEiH7h18Okoh\n8+mlow9+z2wy4WBrq/yZqdWHR3rsb3N4jOfz7v2cqktfXjly6+G7Wr0396wmK7aHzdeOXXyS\n0WHaUW9rIQBQdNX9oZ5dFx9r3CJ5aJ+2lXiqm9/vP33vnWu/jYF/f0EaGzl5a6fFvVp0HTLI\ni3j39PtjZ9L4dWIPsP1tToQQ4opgP18Boc+v1Dl2CoUiNzeX/dQTCwuLky9TS6+HKoTXl/bE\nRu179NvveTqenXOzTkOn+fRoalpBn/v84PKlP/90Iz1bq6jZsG3/CYMGdSZK6KFWffdBY2cG\n9Wpm2sOvcevWRh26++x1roGuVa9ZryFBIYPamX5BenPjcOji8BuPn2kENs07+sxYNLupTX5m\nabxNwfztQaaEQqFUKmUYJjWV7T5MkqSVlVVaWhr7OXbW1tbGUbGfdSSTyQwGA/t59GKxWCwW\nl/ruNkVRlEKhSE1NZf+ZZfwBi+zsbPYTmywsLHQ6Hft59BKJRCQS6fX69PR0lk14PJ5cLme/\nBQmCMP7IS1ZWFvsDnVwu12g07G8gkEqlxtlsmZmZLJvw+XyZTMZ1CwJAZmYm+zl2lpaWKpWK\n064oEAg0Gk1WFqtLSQAgEAjEYjGnLWj8oZOMjAz2c+wUCkVeXh6nXZGmabVanZ2dXWwFM7/P\n8m85Y4cQQuXOwXPodM+hZipQEqcBy3YPYNdD0WfFAkDz/lMP9p8KAFZWViRJ5ubmfvRpat/C\nf/cpf+5jRwihsvi3zLFDCCGEEEL/ECZ2CCGEEEIVBCZ2CCGEEEIVBCZ2CCGEEEIVBCZ2CCGE\nEEIVBCZ2CCGEEEIVBCZ2CCGEEEIVBCZ2CCGEEEIVBCZ2CCGEEEIVBD55An1x/JyrmHlOS1FC\noVAoFGZkZLCsz+fz5XI5AHB9jlNWVhanJ+3weDyVSsX+gVQikYimafaPDKJp2sLCAgC4PseJ\n65N2KIpSKpWcHkhFURT7LSgQCGQyGQC8f/+eZRPjc5zS09P1ej3LJggh9G+AZ+wQQgghhCoI\nTOwQQgghhCoIvBSLvjhHnyZxbKEFYHvVL7/+2zyOiwBIfcux/jvOiwC213k/1E9ie3n0g1SO\nqzc1hfsi2F5N/psWgNUFa09rPufBIITQvwmesUMIIYQQqiAwsUMIIYQQqiAwsUMIIYQQqiAw\nsUMIIYQQqiAwsUMIIYQQqiAwsUMIIYQQqiAwsUMIIYQQqiAwsUMIIYQQqiAwsUMIIYQQqiDw\nyRMIof8sRjuoQS2V3mBaRpDCw49fFPz37aXduyJi4h//odTzbGu7tRsY0se/dak9vEt5XewC\n94/rvu2l26XvVxQuNlzYuTw85vi935Otatbt2D940QRvEUn80+gQQog7TOwQQv9V2uzrKr3B\n0qNLA1vRh1Liw2PB0n9dNXHsZkpR7+v+gXIq59GZuLi5/k/Tzs4d06jYHirRJAAQZPEPFnt1\navqkIzdFVpU/Ko8Jbh8SF9+wvffYXq4JV49GLx51+bew69v7lWusCCHECiZ25ebhhbiDpy8+\nS3irp8S21ZzaefXr19HV+FKAn2+jLTFTq8rK1vO+kf1vdVq+YYAjy3IAYPRZw/sOTdMagnYf\n7KIQlm257Hl7e/vuiBthJ/7UC0LIlDbzBwBounjjhFqWxVY4ND0ShC5rfjjtIOIDADMpeFHr\n5g/CR2tG/UKTRNEezDwrVpP5i+/YvUXL399aFBIX32L64Wsre5EkmZs7r5mvS+ix4DMrfL2s\nBOURJUIIcYBz7MrHXyeWzN1yqFKzb2YvWrV07tRvmth8FzZr8fEXpbf8NNIfR6TroBKfOn7w\nz8+wOC8vLxcRfklAn1vOk3gAaFbCVxdG9+58Sq68YagxqwMAglepd1NbvfrV0xwtmx5M+tIu\n9Q3IdOjXw+rjmt9N3c8T1IgJ8SwoGRS+dunSpUThy7sIIfR54Idx+Yg+cN++w/yJg9yM/3Vp\n2NRV/DIkZiX4RPy/jOda5H1RpV7ja15e/lO0YeyqT5e/69W5lEASGBjIrrpBz5AUTj1C5ST9\nSjJB0o2E6TfPXElJzpY5ODf9upWUKtjfyQkrNoirNzZtkpWlIUh+FSFVbA/JrvU7dWmt4H38\njrmzpX/EU2L3vRXH2x2DQgmbYcPvmRaOixS8D7u10KrjmDEdyztWhBBiBRO78pGnZ9TpyaYl\n1b0mzKmWxgAYj/cGXfruFUvO3HlOim1adhsxcUArAGB0aUd2Rly6+zQxXWNfu5FvwJiOLgoA\nUL2/H7E17t6T50pepa+8AwouMpVU/hG9OmHXn1kuk7vUraXWBp88kJQ3oEr+RVJN5uOdW/bd\nefJMK63a0KODx/Mj37kt2NC/mrdP78FRB/ra5E9UCvDzbRa2d6K9VJP5JDJ89/UHf2RpDDb2\ndboOCOrTxgEABvbyGRgRmRK14affRDExc/19fLpHxI6w5ZfUT4Cfb+f5QbfWb3uZqZfb1R40\nbV7t10fX7T6XrCQdG7efP3OUhUm6l5aWplQqC/4rFpdyhZckSYqiSt1GRgSBeWXFkXw7FQjB\nzLYt32Tnn4GjrRuMjTjQvr4CAAiedXvfvsZydXZGdnrys0txYfdT7HuE2dBUsT1EAQgrNVp3\n4OjAJtYAQJIkAGS92Ndr+RWvNVe6V5GeIAAIomB/0+bcT9Ho67jXubR7yZodRx+8TKtSt2GL\nzv5LQ0dY8krf0wiCIEx6K5VxPADAdYcnSZLrns/1bcUpkILBcI2doiiGYVg2KWj47wyE6yI+\nQyBl2BvLsPdyDaQMR/h/YSBc65sPxPy7ABO78jHSp+H02LARU6+1b+Xh1qiRq1M1Wujo7v5h\n9tvtJfO8+k1YO7zqqxsHV0SuqNL5QB8bUUzo5LPK+mNGh1SzIJ5cP7V51lj91l2dbZULgpe8\nruQxbsoCSybteOTGS6lKewBGl1pseVEp13doGd7IlrZSeogtfean3U8GzGoKAIw+e3nQgueW\n7uMmzVcQmad2f7s+IcfRzVxcu2csuiZrO2necCta/+hi9M41Uz09Yu1oEgCublnk5hmwIqA2\ny1X03fJjo2YsdbMjT6xb/O2sYKtG7WcsWke8vzt/acSaaz2XtP0wIX39+vVnz541/q1QKM6f\nP2++Z6lUynIMqIK5m64Cg7La0LBFAd0kurTHF6I3L96+dbCf8/XzVYSFDm7burlfSs0DAMvG\nw1eu9C2pB8VvB4dOWD+5p0/nd/csAeRyuUGbMvSbWRYt552Y0ooAoAmCIGiFQmFsrtRnAEDK\nr8H++1919h84qbflkytH92+Y/uPN1FeXVrBI7QAABAJuU/EIgigYAEuWliV9DSyRWCwu9TvV\nR4RCbtN5SZL8DIFIJBKJRMK+Pp/PF4lEpdczQVEU10C41gfuBzoej8d1C/J4vM8QiEzGbbp5\nGXZFPp//GQKxsLDgVJ/rrggANE3TNF20XK/Xm2mFiV35cB6wcEu9yz9euXH3wsHDe7ZTQnkD\nj6/8AwLcbPOPdAq3kIDObgDg4DOl6t5L8WlqFXHuyLPMZftDGkj4AFC7bgP9jUFx3z5q3PPM\nU5Vw7eppdYQUADi7ivoNXgYA7+6EF1te1JmY51KHQbWEFIBouLPl2ls7VMxWIUGk/bb1Xo5g\n7Y6/e6gnvzlwrvm4bLv2Ce74jbucBgCHyn13nFj8Qq2zo2kAyLQb3b9TI/arqPao2d3cqwJA\n33F1T8+8vSA0oIaAgpr2fjYxlx5lQtuP7zREqFSdV0a0p2u6tTB+g6rapO/cZdSj4DkXt55O\nWOJX6KaiHsvCm6S+ff3bxRMHdk0awQ+LXiAgiaI9dBu9+jJ132XkuVFxLy4OrwsAh8a1/z7L\n4eqZ2cUmaYxBCQDZz/9ae/FlSNuqAACwNqqf08iDK4NuTN7W0u7TxY4QQsXCxK7c1HBrO9yt\nLQAo0xLv3bpx8tCBhePvbdwXVkNAAUDVbjUKalpQJADkvL7DMMzsAb1NO5HoEt9dShQqutT5\new4QLWveTMpPBSip/COa7FvH3yvrjqiZkJAAABYdq+sf3o1+kRVYW57885+mPfDFDZvL6CSz\nQXn7ej28ce1oQmJy8tuX8TdNX6rSsRqn9WPpmv/lhifhk/xKxtWSvzYKn1UePny4t7e38W+S\nJDMzM810K5PJVCqVVqtlOQyuX5jQv1m9th0+KrHtNgPmXEw69CcUTuzqtO9aBwB6B7Sq1Wva\n8ohvbwVObm5XtIfMzEyrrjMBzj3b/hCG133x44wB0U/GxP1W16DMzFQCgJZhGEZbsE+qlCIA\nkDvOH9lIajAYSJJUqTQ9Vi6Bg4POLP41M9YTzBIKhQRBmE48MI+maZFIxDBMVlYWyyYkScpk\nsuzsbIOB7c0cFhYWxlFpNBqWTcRiscFgUKlULOsLBAKhUGgwGLKzs1k2oShKKpVmZWWxvxQr\nl8sBIC8vj9PxQa/Xsw9EKBQKBAK9Xp+Tk8OyCUVREomE/RYkCMJ4ZohrIDqdTq1Ws6wvEolo\nmuYUiPGMINddEQByc3N1Oh3LVlKpVKPRcNoV+Xy+TqfLzc1l2YTP5wuFQq67IgDk5OSYP3Nm\nqgwfVTweT6vV5uXlFVvBuHsXCxO7cqDJuro27OLQaTMdaAoARFZVW3Xxc//KuXf/0H1/Zc+u\nawkAIvHHl8l5EpqgJAdio00LCZL/e9jZj2rKeWQqABT5vdP88sJen97HMMzTyIVBJoU3Iu8F\nLm9n0Hy8C/Kg+GtFWoYBAIP2/dLxQc8k9bq2aVzfw6Wzd7uQiYsL6ohlpe882hIPweZu56hd\nu3bt2vlXeA0GQ1pampnKDMPodDr27xb2H2/ov4gS1gIARqMHAPX7y9evJFXu1MtF+uFHTOx7\nDIHlNxJ+SoLmxZxO02q1DFUNAPQqNQC8uXSBYZjt/epvL1TruKWlpdimz1/xWwlBI4ogJNVd\nCvZAvV5PijwAIPevjFJ3S5qmCYJgv/d+mNvHuolxPpBWq+W65+v1ek5vK4PBwL4+n5+/Rbi+\nc7VaLdc5dlwD4VS/4DIZ+ybG8bOvXzDHjtOBjmEYToEY5wNw2ojGpZRh7/2kgRj3E06BkCTJ\nKZCCPVCn07HPUD9DIAUwsSsHFF3l5o0bgjupU1vaFhTqVRkAUFla4s9iie26guHXs2l6X3vj\nOSQmat6sjK8mDvGsqrpy/qXKeC0V9Ko/rmWpKwPYllD+kf0nXslqDNu3xa+g5PriUavu7kzX\nedq0slNd/9CDLu/JL9nqqn9Xy9Hl76zqzKs5egYAcl5H3k7R7D46z5IiAECd+TObtVG0H4Q+\nBfX7mHnj9lcfsS2o+4fT4ZqMMwCgaFcZAHR5Z7fMiq6/vvni7jULKhg0iQDAUwhK6kGdfhoA\n7DpXAQDblgEzZnQ2XejJsI3PmVpTgn344noAQPIUvtbCc8+vArQvqKPKuAAA1u425R8zQgiV\nBhO7ckAJHUN7Oi9bNUng37+5ay2JgMhIenE6Zq+sltfQKiVe+KNl7qMaW++euVQ4xt+lqvTe\n+aj/xacumGlrIxxflx4zL3TD+CHdrcjM03vCZQIKAGwaF19uSvX+f79mazrM/tq0sNGojoZx\nsRGPUqc1D6zGm1DQw8ldYfknAQm+s5h/KeygZ2B3fvarg+Fbjd8R+TInhrl67NLDHg3t0hIe\nHY6KAYCEpIwWMlsoVgn9IPQp0JbdM5/NubJohn/H/ZUFFAAw+twzoesIguc32AkARJUnWPD2\n/LFqVW7XrRLjbdeM9uclMQDQtme1knrYGbyGIHhTRtcFgEothk53L3Se+2VU2EtD3enTpxeU\nTApscHTpplU/Dl7lbwUAYFBFjlkCAIMnunye9YAQQqYwsSsfzUetWlA99tj3ZzccT1HqCIWt\nQ+P2g6cM7mn+trhv5m9QR4Qd2rYqXct3cGwUsmJOYykfwHrxljlbN+/ZtHwOCG08+84cd2N9\nDADBK77c1PO9pylh9bGuhW4ck9j3byw98jDyOrW556oNM7aE7d+4bA4prtS6Z1DP7E23AABg\n7uIxa7YcmjXhmMbAuHYa2zZjFwCIbPwWDkvZEbP6VB5V08ltYGi4Yn1Q3MygZrGxJUVUbD8I\nfQoEz3re3N6TFxwM6dC9g09HKWQ+vXT0we+ZTSYcbG0lBACStp89ue2stcfHdk3p7N1GpMt8\nfvnonfjU6r7relaRFtvD5mvHLj7J6DDtqI812xs8nQN3e0U1X9e/1YN+w1rWsbh5JubM7ZQG\nA8MDa5TxSTMIIfRPEFznK6CK5KOHkjGMJiObUVj80+cglVc/wGKOnUKhyM3NZT+11sLC4uTL\nolMT0X/V60t7YqP2Pfrt9zwdz865Waeh03x6NDWt8OS7DYf2Hfn9j0SlgW9Xu1Fr/3H9B3Qi\nSuihVn33QWNnBvVqRhCEtbV1enr6R5Ojx7vWOGnomPA0yrRQm/Ns7ZzFh87/kpSprVLHrdfQ\noDkju7D5VXCJREIQBPvp6kKhUCqVMgyTmsp2HyZJ0srKKi0tjf0cO2tra+Oo2N9DIJPJDAYD\n++nqxh+wKPXdbcr4kyKpqansP7NsbGwAIDs7m/09BBYWFjqdrqTp6kVJJBKRSKTX69PT01k2\n4fF4crmc/RY07ooAkJWVxf5AJ5fLNRoN+/typFKpUCjUarXmb1YzxefzZTIZ1y0IAJmZmezn\njVlaWqpUKk67okAg0Gg07O/qEAgEYrGY0xY0/uxORkYG+zl2CoUiLy+P065I07RarS7prg7j\n7l38CFkuA30JCIJWcPtdnk/bD0KlcvAcOt1zqJkKLr5T5vlOYdmDmWfFGm2N/2trkUK+tG7o\npr1rrKxIkszNzWX/aYoQQuUOnxX7RcMpcAghhFBFgmfsvmj9t0a0yyqHC6YIIYQQ+jfAxO6L\nRtIWVfE3GRBCCKGKAi/FIoQQQghVEJjYIYQQQghVEJjYIYQQQghVEJjYIYQQQghVEJjYIYQQ\nQghVEJjYIYQQQghVEPhzJ+iL4+dcxcxzWooSCoVCoTAjI4NlfT6fL5fLAYDrc5yysrI4PWmH\nx+OpVCr2D6QSiUQ0TbN/ZBBN0xYWFgDA9TlOXJ+0Q1GUUqnk9EAqiqLYb0GBQCCTyQDg/fv3\nLJsghNB/FJ6xQwghhBCqIDCxQwghhBCqIPBSLPriHH2axLGFFoDtVb/8+m/zOC4CIPUtx/rv\nOC8C2F7n/VA/ie3l0Q9SOa7e1BTui2B7NflvWgBWF6w9rfmcB4MQQv8meMYOIYQQQqiCwMQO\nIYQQQqiCwMQOIYQQQqiCwMQOIYQQQqiCwMQOIYQQQqiCwMQOIYQQQqiCwMQOIYQQQqiCwMQO\nIYQQQqiCwMQOIYQQQqiCwMQOIfSfxWgH1Xfo7WJv+s+/nqNplbeXdq8c3Cmgaa2+bk5Bfv6H\nDl8z09/+cd09u4Z+VPjyh+ghPds71XSwd6jZoqPv2n1Xi7QzXNi5tF3D2jKBuF7TNjO2HFca\nmHKIDiGEuKtQjxRjGPXV47Gnfr7+4nWKjhDYVavdqkPP/j1a8onPOoyHF+IOnr74LOGtnhLb\nVnNq59WvX0dX40s5Sa+zhbZVFHTRVprsR9tW7/gl/o20quugKdPa1ZQV2/m8Af73czX+3+4f\nWlVqWn5vzZj5l9/W8F67ZVRd9kPdN7L/rU7LNwxw9Pb29t0RN8JOzL4tJ2VbJwiZp82+rtIb\nLD26NLAVfSglPjwWLP3XVRPHbqYU9b7uHyinch6diYub6/807ezcMY2K9vbu/KxJR26KrCqb\nFiZfXd56wEaeVf3+wyZUonKufrd/1WTfm+8vHJjkVlAnJrh9SFx8w/beY3u5Jlw9Gr141OXf\nwq5v71f+ASOEUGkqTmLH6DN3zp14+jm/S69vfAfXpLTZfz769Vjkisv3hmyf6//ZUru/TiyZ\nG3mvY98R/iOdBIacFw+uxYTNepqzYb6PIwBcXjjjZOP54YEuRRvunbU83nnwpqnNn51as2H2\nKs/9S0saM0ERl/c8Gxra9EMRo4u++Z4iyh6ll5eXi+hT7QxlXicImafN/AEAmi7eOKGWZbEV\nDk2PBKHLmh9OO4j4AMBMCl7UuvmD8NGaUb/QZKH3izbrxvxp+4v2sDZwByFyuXDnnLOYDwCG\nWZP9XZtcWjNcFXxbSBIA8P7WopC4+BbTD19b2Yskydzcec18XUKPBZ9Z4etlJSj3kBFCyLyK\nk9jd3Tn39O/ShdvXuVkLjSXurdp2bOkQMHvPtiedAl0KHff16lxKICnzsvQGhiKLz6KiD9y3\n7zB/4qD8b/MuDZu6il+GxKwEnwjzfV5Mym05x7OSpcTim26aA+uz9IycKn4Rdl83end5p4YJ\np//O5HLfxCYYbNrJM/4oa0SBgYFlbZrvU6wThMzLeRIPAM0UwmJfZXTvzqfkWnqEGrM6ACB4\nlXo3tX3486unOdqGFiYniRntvoCRuVX69Mg69qNJDwbtu5i3ubat5xmzOgAg+ZWmtLC9fO7V\nr9laTzkNAN9N3c8T1IgJ8SxoNSh8rf7wH4TeUK6xIoQQKxUksWP06evOvqo3IbwgqzNSNOi3\neE51oCnjfwf28hkYEZkSteGn30QxMXMZXdqRnRGX7j5NTNfY127kGzCmo4sCAEoqD/Dz/WbT\n0vgVq24nZkkVdi29hgf3a/XRSPL0jDo92bSkuteEOdXSGICIYX1PpakgaUafq20O7Z35UcPB\nDa1id/wwbn7XMxH75XX8S8rqAMCixlDq8oyYhJyRNfIv1z7be9mq4SjRy7UFdTSZTyLDd19/\n8EeWxmBjX6frgKA+bRwAQPX+fsTWuHtPnit5lb7yDijIdv19fLpHxI6wE6fcObNt78knr5II\nibVr864h43qLSQIA9OrEveERP92Kz9SS1Z2a+I8e37aW7FOvE4TMS7+STJB0I2H6zTNXUpKz\nZQ7OTb9uJaUKpg6TE1ZsEFdvbNokK0tDkPwqQsq08PnOQaeeEzN/Xvq773EolI8RGzdvtnBs\nYlqUmqEhSNpRZOzBsOH3TAvHRQrehzes0KrjmDEdyy9KhBDioIIkdsrUU9l6g3eLSkVfatyi\nUJ5xdcsiN8+AFQG1ASAmdPJZZf0xo0OqWRBPrp/aPGusfuuuLvbiksoB4OTsVR2GBA9vVPX1\njYMrIldU+jquv22heWkjfRpOjw0bMfVa+1Yebo0auTpVo4WO7u6OADAyIqZy0LCzDUM3jnEt\nOs4Os2bHDp4+bvx+SY1u61YNNhctKRjV1GbrrscjF7QAAGC0UbfftVzjaljwocruGYuuydpO\nmjfcitY/uhi9c81UT49YWzJ9QfCS15U8xk1ZYMmkHY/ceClVaW/SsS7vUfDibfX7jF8w3kn9\n7smGtRGLHJqv8q4OwGybMv2Spva4SXOqSrTXj0eunzbJKiaivpj3KdbJH3/8kZqamh8rSTo5\nOZlZGQRB8Hg8hmE7V50k8YahiiP5dioQgpltW77J1hpLaOsGYyMOtK+vAACCZ93et6+xXJ2d\nkZ2e/OxSXNj9FPseYTb0h8QuL+HAgo3XPOb/4G4jekEAECSfzycIAgAE4ipDhgwxVlNmpael\nJt88FxN8O8XJP6KWRAgA2pzbKRq9k4fT5T1LV0ccefAyrYpzwxad+yyfPdKSV/rUCJIkCYLg\n8/ml1jSiqPxhs29i3OH5fL7BwO0MIkVRZVgKp/qcmhhj5/P57N/sBQ05DawMgUOZAmFZn/j7\nygynAx1BEGUIhCRJ9k14PB6nvbdgXfF4HBKPzxAIRVFlexsa1wDLVp8hkAIVJLHTqxMBoLLJ\nwXrxIP9b2Rrj32LbIXE7+xj/zrQb3b9TIwBQpR4/8ixz2f6QBhI+ANSu20B/Y1Dct488J78p\ntrzLEg8AkLScFtDFDQCq+Uypte/yk3cqKJzEOA9YuKXe5R+v3Lh74eDhPdspobyBx1f+AQFu\ntkIeLaAJguTRAsHH20mvehWxYo3avqk+8baz79e2fDL79weJPEeXmlIojvPQtmmTdioNzUUk\nkfNm/2tD5bXVpbtMKth27RPc8Rt3OQ0ADpX77jix+IVaR8SHP1UJ166eVkdIAYCzq6jf4GWm\n3Wpy7igNTLfu7Z0VAqjjuCRU8UYgA4C85NjvX+dMjp7ztbUQAJzq1X80cPCOo39tHFz7U6yT\n6OjoxEVR1AAAIABJREFUs2fPGv9WKBTnz58vdiUUEIs/1T0f6F/ubroKDMpqQ8MWBXST6NIe\nX4jevHj71sF+ztfPVxEWOrht6+Z+KTUPACwbD1+50regnNG93zRwjshtyvR+zgDAJwiC4Mvl\ncuOrUumHN2BQ3ap7U3IBwK7VhF/3jzSeU1dq0wEg+UZQ732vOvsPnNTb8smVo/vXT/vx1/ev\nLq1gkdoBANA0tzuHCIIoGCFLMlnxN2OZIRKJRCJR6fVMCATc5hSSJMk1EAsLC071gfvxgcfj\ncQ2EoiiugXCtD2UKRCgsfpZCST5PIBIJt3lQZdgVeTzeZwjE9PjARhk+qvh8frED0+v1ZlpV\nkMSOEjgAQHyetoYgP7cLmLfYT2cAgMRzW6Iff6hZpWM14x85r+8wDDN7QG/TfiS6xJzXd4st\nB/AAgMqdaxQUWlAkFPf1qYZb2+FubQFAmZZ479aNk4cOLBx/b+O+sIKxFcFETJl5q4r3zk39\nsm9GjVkxrXatnfLta2NkUyMXuhXbQGo/sAb53a4/swId5c/2XLFuPFZQ+HuDt6/XwxvXjiYk\nJie/fRl/01j47lKiUNGlzt8XoWhZ82ZSfqpJK5G1T3unC8tHjmrQrEk9V9fGzVo2r6EAgMz4\nh5TAocPfl7kJUuRbRRx+LQEG1/5k6wSh0nVeGdGerunWwvj7JlWb9J27jHoUPOfi1tMJS/wK\n/ehJj2XhTVLfvv7t4okDuyaN4IdFLxCQBABcW9D7bk6V5TsmlpqDTYza1y35Tfytc+u2b63f\nmX56YZ2EJBiDEgCyn/+19uLLkLZVAQBgbVQ/p5EHVwbdmLytpV35x4wQQmZVkMROZP2NjDr4\n/bk33frlH81ruNQz/pG6R2VaUyzLD5knoQlKciA22vRVguQrEx4VW278gy8yl4hosq6uDbs4\ndNpMB5oCAJFV1VZd/Ny/cu7dP3TfX9mz6xZ/454m+5cziTnzV/uJSELUYuQ836dL54SKdVmN\nFzqUuCSCN7xFpU1RDwOXNI+8877NemfTFw3a90vHBz2T1OvapnF9D5fO3u1CJi4GAChyc4Oc\nR5omdgRlEbJuV5/42/cePn784Keje7Y36LVwYUBjhgGAQm1JkgDG8InWSUhIiOnNHOnp6Wb6\nt7CwUCqVWq3WTB1TXL9joX+zem07fFRi220GzLmYdOhPKJzY1WnftQ4A9A5oVavXtOUR394K\nnNzcLuPeqg1Hf/f69mYdSf4bXMMwDKNJT08nCMLS0jIzM7PgCmad1p51ALr36t+lWo92szcM\nOzU64qvK6lwhAMgd5w1vIDYYDCRJKpXq7ssXwcEhZxb/kr7PE8wSiUQEQeTl5bGMVyAQiMVi\nhmEyMjJYNjEGkpGRwf4qnqWlpXFUarWaZROJRGIwGJRKJcv6QqFQJBIZDIbMzEyWTYyn9zgF\nolAoACA3N1ej0bBsIpVKdTqdSqUqvSoAAIhEIqFQqNfrs7KyWDahKEomk3HdggCQk5PD/kAn\nk8k0Gg37LSgWiwUCgU6ny87OZtmEx+NJJBKuWxAAsrOzdTody1YWFhZqtZrTrkjTtFarzcnJ\nYdmEpmmhUMhpCxrPHGdlZZk/c2bKwsJCpVJx2hX5fL5Go8nNzS36KsMwVlZWJbWtIIkdQcmn\nfl11yaHltzqEuVf6cPI5568fwp9lkDbFNBHbdQXDr2fT9L72xtPCTNS8WRlfTQxqXXx5SNeq\npQ6DoqvcvHFDcCd1akvbgkK9KgMAKktLvkxu0AFAklIHMhoAmg5d5Hx28FPGNqhhiZsNAJwG\ndUibEJmU8OwN2A9yKHSdJed15O0Uze6j8ywpAgDUmT8by209q6qunH+pGlRLSAGAXvXHtSy1\n6W92ZcR/d+i6bvQI/2qu7j0BXp2ZMSl6FwRstKxXX68++HO6qr1CCACMQXU8Mde6Ww1goQzr\nxHR/NRgMaWlp5hdhMBjYv7u4TtBB/y2UsBYAMBo9AKjfX75+Jalyp14uJnuafY8hsPxGwk9J\n0Nwu8+bPDMOcHud+ulAfJ6ysrMQ2fXLfHcx9+9PR868de/g1l324Wlqr11CYff3R2df6VpVI\nkRtFEJLqrgV7oMFgoCQtACD3r9IP+sa9kf3eW5Blsm9inKljMBi4zrHj+rZiGKYMb0P2TQrq\nc30L/9sCMc7K4lofPksgnJoYdy2uWxC4B1KGIzynQIxvjU+9RbjWL0MgBSpIYgcATSYs83wR\ntCxwQicfr/q1a8mpvJdP7578/mlXr6rnbxZTn5a5j2psvXvmUuEYf5eq0nvno/4Xn7pgpi0t\nrVpsOZsxUELH0J7Oy1ZNEvj3b+5aSyIgMpJenI7ZK6vlNbSKBABIApTJb9LT7RWKDzNFaHmb\n1lZb9s5eYxHobwvpl77b9TvlWBderD3xfJ5vib82LLbzd+IfXLz2fKWm0+nCZ+L4MieGuXrs\n0sMeDe3SEh4djooBgISkjOaNx9elx8wL3TB+SHcrMvP0nnBZ4SuhfLnyf9/F5kgU3T3qELlJ\nJ08nShx8AUBsN7Bz1VPbZq6ixvpXleiuHot4opUv6csusSvTOkGoVOr3MfPG7a8+YltQ9w+7\noibjDAAo2lUGAF3e2S2zouuvb764e82CCgZNIgDwFAIAsGw2uF9QJ9M+H0Ztec7UmhLsQ0vq\nA4Am93Rw8I7WwpbHfT/0oFe/BgCBQgAAJE/hay089/wqQPuCCqqMCwBg7V7cF0qEEPrEKk5i\nR1CKyeu+bXR4/5mfT188lk6K5E5urWZ/u6Eac+2dsvhrhd/M36COCDu0bVW6lu/g2ChkxZzG\nUr6Zcjaaj1q1oHrsse/PbjieotQRCluHxu0HTxnc0ziNur5PC3XUlsBpnnGRU0wakSEbF0eH\nRUWtW6AkJM5NPVdvH2r5Mmb43NAjLpG9XYq/gAsENayNbej5xD6znD96RWTjt3BYyo6Y1afy\nqJpObgNDwxXrg+JmBjWLjV28Zc7WzXs2LZ8DQhvPvjPH3VgfY9JQYj9g4YisXad2zYrNkVja\n1GnUefl4P+MIx29YLQuP2LlmQZaOdHBqFrJ2fAPxJ10nCJWCtuye+WzOlUUz/DvuryygAIDR\n554JXUcQPL/BTgAgqjzBgrfnj1WrcrtulRh/P4jR/rzk/9q776gmsi4A4Hcy6QklhCZioaio\nWLFXbGtbEBVRBLHr2hUbCioW7H7oig0bihX7rr2LrmXtFbE3REB6SE/m+yMsRgScsMHVeH9n\nzx4zeW/u3EleuJl5k4kFgJZeFQDAon6AX/3P1qndtealturkyZN1X8qFDmPFrE13Z87P/nWd\nBTN/DbtCtgJAD9+Kui7jRrjvn7di0dnARb5WAABa+cZhcwEgcCz+5jZC6D9A4Jkp9D376qlY\nkUhk0Bwac3Pzwy/Tv94O/QjexU0YPyuObeXetls7IWQnxu+/9yy73qi4sDEtdA2ebugbsvQ8\nz7FpB+/mPHX204v7byWkV/RZFrnQv8gV7mrheljb7k3iJoIgxGJxZmbm9eU9O845J6zYLKhX\nS6E669aZvacfpFfvvTw+KkDXRatKG9iw0bH3ig69BzRxNb9+LPbYzVT3vqvOrfD76vYLBAKC\nIOhPBuJyuUKhkKKogt8D+ioGg2FlZZWRkUH/VKxYLNZtFf2pZmZmZlqttsjJQEXi8/l8Pp/O\nRIsCJEmKRKL09HT6f7Osra0BIDc3l/4MLXNzc7VaTX/Wo0Ag4PF4Go2m5KnA+nQXbNJ/BXVv\nRQDIycmh/0FnYWGhVCrpz3oUCoVcLlelUtGfM8disczMzAx9BQEgOzub/mRBS0tLuVxu0FuR\nw+EolUr6c+Z0U1cNegV1sx6zsrLoTxYUiUQGzVs1Nzdns9kKhaK4WY+6t3fRW0gzBkIIfW8c\n/SKX29fbuWn7pbh1UjXTrppH0LJJ3bp+OgpXZciOCOvIPdv3nY1ZKdOy7Fxq+876rY9/+xLW\nWUj9MXFHbJYt3bRnx9rleRpWxWp1ghePmjqwQ0EDBstmw6UTS0Pn7DkVd3a/qpxrnbELI0MH\n/2LMPBFCiDYs7BBCPzDHVkGTWwWV0MDNZ8IMH7pn+VcnvF79xcJGfSbG9ZlYQi+WsOq0FduW\nWFkxGIy8vDz6h0kQQsjo8Ff4EUIIIYRMBBZ2CCGEEEImAgs7hBBCCCETgYUdQgghhJCJwMIO\nIYQQQshEYGGHEEIIIWQisLBDCCGEEDIRWNghhBBCCJkILOwQQgghhEwE3nkC/XR6VCtXwg34\nvsTlcrlcblZWFs32LBbLwsICAAy9QWdOTo5Bt1BkMplyuZz+nUZ5PB6bzaZ/L0g2m21ubg4A\nht6g09BbKJIkKZPJDLrTKEmS9F9BDodjZmYGAB8/fqTZBSGEflB4xA4hhBBCyERgYYcQQggh\nZCLwVCz66exPTDawhwqA7lm//PYfpAaGAEj/YGD7NINDAN3zvJ/aJ9M9PfpJuoG7Nz3V8BB0\nzyb/QwXw9RPWrcQsg7cEIYS+M3jEDiGEEELIRGBhhxBCCCFkIrCwQwghhBAyEVjYIYQQQgiZ\nCCzsEEIIIYRMBBZ2CCGEEEImAgs7hBBCCCETgYUdQgghhJCJwMIOIYQQQshE4J0nEEI/JkoV\n4O4k12j1lxEM7t5HLwoefojfEhMdm/DouUzDtHWp07pvcC/fZvrtZe8ubYtcdePq3cwsmVV5\nl65B42aN7i4kiYIGL89snrl8y9X7z/LUzArV6vYaNHlSQPPPt0N7esP85TH7H778KHZ26xAw\nYeawTjwGAQgh9F/4b47YrRvgNzj8bpmGUGSd8vb2TlVpv97UQPdP75oRPKK3b3ff3gEjJ4Xv\nPpNQ8JQk+V1yprLIXsrch7/PGN/X12/YuFkXXhV9f6rEtaO6+fTK1lAFS06MDezWzeeZXFOw\n5Nbswd19h6qpovqXKusStpk+SpMzoKePt7f3yUz5v1wVQjSpcq/INVrLhr+06Nqt4L/mXX4t\naJD596Kxw6fffUE07zOiZ5C/Vc69XWG+86LvFTRQpJ8O7tr3xPHbzm18fYcN9LDNiJk3vGHX\nsILxlXIpopn/1PNPCZ8Bo8YPD7DPurtovE/vFZ99dsWO8fSftiLHxn3YpDHNyks3zAhqOyLu\nm+wAhBAqAh6xM8zrP+aGbbzTzm+Q7+AqHK3kxb3LsVEhiZLImd2cAeBi+JTDdWeuGuH2Zcdt\nIfMTqgWumNjoyZElkdMXtdox78tv9A5da1NHjxz6KAuy4wMARcl3JkkoSrsrITOsnrWuzaln\nOQKHoUzjHQ4oYZvpy3wUnakGGxZ5KO7VL8P/1aoQokmVfQYA6s9ZPsrJssgGeyZvBK7bkjNH\nHXksAKDGjZndrNG9VUOVQ66yGQQA/DVmcpqSCtwe71PfFgBaicNjhzQOPhQ94drYqKb2ALB4\n+DqC53b61slqfBYAaEPG+1avF79koHzMTS6DAICPN2YH70poPHnv4SmtraysGIxFDTtVnHhg\nzLEFPp2tON9qTyCE0Cc/2Bw7jSKvhIffwObddx3azhwb0LVOzaputep3CRg9P8j1duzCr3a8\nkJxX27eVjaW4wa+dlJJ7OZoijrkJy/lxGMSdi/n3RJel7stUM4NcLJ7uzj8oqFEmXclROnrX\nNGJGBiluh1/eeJdn031kPfGHc5uNf4wUoaJIHicAgIeIW+SzlDrtVGqeRa1puqoOAAimTc/6\nthrF20SJSrfkcEIGxyZIV9UBAADpt2QhAFxe/QQAtKqUrR/yrOvN0FV1AMBg2UxobKtWvP07\nN38NByfuYHIqxQa3KojbL3rFvHnzCA2OA4TQf+P7OmKnzH68cdWWK/ee5yi11g6uHf1H92ru\nCAB9u3frG70xdVPkuQe82NiwQg+L6wUAWYmnV66PS3iTKbB36tTrN/+2rgBAqTP2bYiOv52Y\nlKl0cKnt039YOzdRCcv1STWUIjNFf0nFzqNCK2RQANED/I5kyCF5Sq+/mu/ZNrVQx8BaVjvX\nn/ltZsdj0TssXH0tyCKOuRFMkZcV78SZB+BbGQCSjl7l2fh49nuxfcEODdWSJECackhLUe0a\nWJe8tUVmnXrr2Npthx+/TSYE4uqNOgb/1pPPINZ9vs3FrbPQDi+02RrFm5hXOW7jf6nqpFCN\nObw7Wepfjg8AJycGbZH32L7KJ3/XpeztM3TrpNi9rSzYdHY1QiXLvJRCMNi1uZnXj11KTck1\nc6xWv01TIVnwZZUxakEkv2Jd/S45OUqCwSrHJQEAtHKtQ2Wnar/qNyBYVgCgzlPr1vB7VJSw\ncj39BulZSoLBduaRAACgjXyWbe48W6R3CJ0n/mXYsJbGzRQhhOj7vgq7LVNmXzZrOW7GQCu2\n5uGFzRuWTGzVcKcdmwEAf62cXadV/wX9XXQt9R8W2Ut3bmbenD1dhw0OKMd5cC4udsVEtcOW\nfm6WsdPGH5fVHDY0uII58fjKkd9DhmtWx/ziwC9uuf4WDu5Wa/LOqEETL3s2bVindu3qVSqw\nuc4NGjgDwODoWPvRA47XmrZ8WPUvU2sbMn1n4OTfRu4QVOq0bFFgcXugmafdgT8OaqhfSQLO\nXkhx6NpcVL2RVjn5zwy5j5j74XQCySnfzpIDAEVubWt+0Vn7V0waM2dtzV4jZ42sokh7HLk0\nerZjo0XeFQttcwl7oND+15d6Zb2KYg5uYitk97NlHzu35bF/SH0AaDik3qpp298rvRzYJAA8\n3XaKZ+3VyoJdciAAuH79+tu3b3X/ZrPZnp6eJbxnCIJgs9kMBt1jzyRJ0myJvnMpN9OB4Ext\n2eT9P8fP2GL34dG7PWuKAIBgij19/HTLFblZuZkpT+J3Rd1NdegaZc0mAQAY3OVHLuivkMvl\nvtq1CABqDa/B5XIZLMGAAQO0Wi0ASHMyM9I/XD8RO/ZmapVeG1zNBQCgktxMVWqqNHL7a1tE\nxOo9D19nOrjVadapT8S0gZb0ZkswmUxdXJops1isgk2l2YUgCADgcDgUVczM3K/FooMkSQaD\nQX+rdIkTBEG/i26Mc7ncUiSi2wk0ozCZTPpbpfs8KV0iNNsXbLxBH3SlS8SgF5EkyVIkDgBs\nNpv+5zCDwTD0raj7v0HvxlInonsn00EQhEFvxZITKXkUfF+FnW3HXmPa/drAgg0AjvZ+6/+Y\n80KhtmOzASDbbmif9rULWuo/LLJXfQAAqDpmbu+W9gDgVrO+NCHg+MqLveZo9z3JjtgR7C5g\nAYBLVXfNtYBdax62Gv++yOW/zG2ov4XV/MNX1rh49tK126fj9m5dR3It3Bu28O3fv44tl8nm\nsAmCwWRzOIXfhRr52+gFSxQO9TVJN6v5tLFlMXKf3UtiOrtVFhZq6fCLh2bv3nPZija81OOZ\niv5ty5E8bjtLzvmT7338nW9fThNWGMYAkKcfKnJrW08sOuues7JkWqpTF89qIg64Os+dJnrP\nMQMA/W0ubp26PVBo/+s7FvtU6BjgxCUBeAOrWS69sV5OreYShGXVIVbkhU33M8I8bIBSbbyW\nVn2MFxS/8QW7+tChQ8ePH9f9WyQS/frrr0XGLUB/QCJTcjtTDlpZhaCo2f07CdQZj05v/n3O\nutWBPapdOVWO+9kn29pODeLTpQBgWXfgwoU+xa3w5cmVv0w4L7DvusOvhoBJAACfn/9lY4SL\n/bbUPACwazrq7+0DdZfNyuQfASDl6oju29528O07rpfl40v7ty4ed/Jy8tv4BfQnwhr0dwsA\nCIIQCgt/dJRMIBAY1B4AOBwOh2PYNMHvM5FSfD6w2WyD2jMYDEMTMbQ9GJ4ISZKGvoIkSX6D\nRHg8nkHtS/FW/DaJFHw+0FSKtyKTySxywzQazZcLP/UyNEyZ8vbpfP/a5f1vklJSPrxMuK7/\nVLl2FYp7WEKvX+uLC/7t2ancoe0XJe94FEVN9++p30ygTpK8u13kcoDPCjsAqFSn5cA6LQFA\nlpF058a1w3t2h4+8s3x7VCVOcV9BqOgJU2+U896wonfu9U3DFkxycdpgsW5prNnEjeF1CjXl\n2fQQkvvOPcj0EO8EVjkvKy4AdGphO+PUeejj+Ge6vEJgdQCQvLtVzNYKisyaJw7zrHJ6/uAh\n7h71alSvXtejSaNKhU99Fr/OhvDF/i+gzL1x6KOs6qDKb968AQDzdhU1929vfpEzwsWCIM2G\n1rRaveVv8Oia+277GxUvrIntVwMBAI/HMzc31/3bzMys5K8mBEEY9A2e/hcm9J3rsDDak125\nTmNnAAAoX88vLIJ8OCb0wuqjb+b2cNZv2TViVb30D+8eXPhjd8y4QayozbM4n/8ciSLtzs45\nIX+eumdW+Zc/r8aJSKAoSv+tNWbjto4p7x/fPLVs3eqaHdiPTy0VMAitRgoAuU9fLzn/Irhl\neYIgAJZu7F1lSNzC0VfHrWliVxZZ697Ahr7nSzFGyjTEt4nyzUJ8myiYCP0Q3ybKf5jID3PE\nTqv6OG/k6CeCGh2b163Z0K2Dd+vgsXMKnuWbfbapBQ9L7qX/4c0UsgiCZArYBCnYvXOz/toI\nBkv25mGRy/UfKnP+Whp1IWjSVEc2CQA8q/JNf+nRoEW1nn2mbX+dO71q0ZfmKXOvHkuSzFzc\ng8cgeI0Hz/BJnBc6ja/OqRvu+GVjghT2sOEfPvzyOTfR3ClINxPP0auJ/PD+ZynibLV2SF0x\nABSXBUjPFpk1QZoHL4vplXDzzv1Hj+6d2791nXv38PD+n00/KnadAPDF/i/w7uh2iqISN4aP\n1lt4beOdEfNbA0CtwU1zx8emqjq/2nzJyv03Wxbjq4EAIDQ0NDQ0VPdvrVabnp5eZGgdkUiU\nl5enVNL9xZaCkhH96Gq0bFtoiW2nKRB6IXnPK/i8sHP17OgKAD37N3XqPml+9JobI8Y3Kqi6\nqFtbZ6xasiVbK/AdvzRiSj8rUpqeLiUIQiwWZ2Vl6b4ZOzdp4QzQqZtfe8cPbUIjBxwetLa5\nvSKXAwAWTqH9a3DT09OtrKwYDIbP0oghcf5H51xJj/36TDuBQEAQhEQioZkyl8sVCoUURZU8\nKPQxGAwrK6vMzEzdOWU6xGIxQRB5eXlyOd1fLzIzM9NqtXl5dK9m4/P5fD5fq9VmZGTQ7EKS\npEgkysjIoP/X0draGgAkEolCoaDZxdzcXK1WS6VSmu0FAgGPx9NoNJmZmTS7MJlMCwsL+q+g\n7q0IALm5ufQ/6CwsLJRKpUwmo9leKBRyuVyVSpWdnU2zC4vFMjMzM/QVBICcnByVSkWzl6Wl\npVwuN+ityOFwlEplTk4OzS4cDofP5xv0ClpaWgJAdna2Wq2m2UskEkmlUoPeimw2W6FQ5OYW\n/ftourd3kb6jq2Il7zbeTFVGLZvRr5d3q6YeFUS0PuxK7nX0zqf3XPzBt/zybfh2HUErPZ6h\n4ebj7IiYterch+KW66+NZJe7fu3a7lufDUiNPAsA7IXFn4PQqgEgWZb/8tcPml2NTJGStqNr\nWRXZvMEv5XJf/RH3OMupdw3dEp6drxVTu2r/MSa3sm6OWslb+2XWWQkH12/aV6F6Ay+/oKnh\niyOHV713JKZQXDp74Es7/nhrVmnAH3qmNbDNStiQqaYAwKxi/wosxcYHSevvpbcZXu/fBELo\nq0iuEwBQSg0AKD5ePH8w7rHks78fDl37AcCbc8n5jyn1H5PaR8zfxG0cFHH61prQ/lasTx+J\n0g+nd+7c+XfuZ39KXXr0B4BHJ5MBgCWsRxKEoNJnV6lzzFsAgPQN3VoNIYSM6z8r7FSSNwmf\no4RVKEp9IP5+6seUx7fOLgndAgBvkrNK/prJMiup19+RM/ad//tZ4r2Da8N2vpL2GteYbdZg\nSF3xtqnzjl+8+epF4sF1IX8mpLdtblvccv1YJNd5mle1+EXjorYf+vvWvYcP7/91+tDcCcvN\nnDoHlRMAAIMAWcr7zMzPviiwLZo3s+Jum77kws2HCTcvRc8a84x0rspMX/rH0yIzsvNsppI+\nfCxV9aqRf7aUILh9K5o9P/7erHIv3dG4krf2y6xZFrI/D26N3H0m8cXrJ/ev7jmaJHDM//X8\ngm2mswcKkX/88+9cZcPf2ugvrD2knVaTHf0wHQCAYA9paHMzcm4mq2aAY/5EgVIEQqgQxcfY\nKb6do46+1l+ozDoGAKLW9gCglh5fGTJ+R3ySfgOtMgkAmKL8+TqvNvbdcjih9rB1URsiqpUr\nPF1GmXdo1KhREWfe6y/UKN4BAEfEAQAGU+Qj5uY8/Uu/gSzzBACIGxT7ZRohhMrUf3YqNuvJ\n+qmf/yTI6r0Hwgekro9dfERKVq5Sp++0VaL/jd41dbTHzp0lrIdn3aPIXu5rBjKYotmDW8Ts\njNrxUVnOyXXg9CivCkIA+HVmpCI6as/aRZkqlqNz7eAFoXWFrBKW62s0ZNGsijsPnDgeeShV\npiZEto51PQMnBHrpJkrX7NZYsWnliEmtdm2coNeJEbx8zuaoTZuWzZIRgmr1Wy1eF2T5MnZg\n2LR9bht7uhU+gcsVe4mY26SCpjX5n16d2n5OsOBOxe5VC5YUubWKLCgma//wQTkxR2JCdkoE\nltautTvMH9lDtx79baazB/Q93XaU5FYcXv2zFAQOfeoK993feAV+9wKAqkEdlENjnf1D9L9D\nGBoIoULYll2yn4Remj3Ft90Oew4JAJQm79i0ZQTB7BFYBQB49qPMmVufL1qU13G1QDengVKd\nnxsLAC29KgAAaBWRUdd45QbODPYqct6lmeMUa9aauzPnZ/+6zoKZv4ZdIVsBoIdvRV2bcSPc\n989bsehs4NS2lQAAtPLoATMBIHAs/kw3Qui/YfCMV4S+pa/OwinFHLvDL+nObkHfs3dxE8bP\nimNbubft1k4I2Ynx++89y643Ki5sTAtdg6cb+oYsPc9zbNrBuzlPnf304v5bCekVfZZFLvQH\nAGXGAf9mo/iV2zeul3+xkR0nv8CzazJhRqCLWCw+M7td+/CzworNgnq1FKqzbp3Ze/pBevVb\nHQ1gAAAgAElEQVTey+OjAnQttaq0gQ0bHXuv8Ozu36K69e2T2w9fT3Hvu+rcCj86KXyzOXYZ\nGRmGzrGTSCTf4Ry79PR0Q+fY5ebmmsYcu5ycHNOYY5ednW0ac+yysrK+zzl239HFEwghRJ+j\nX+Ry+3o7N22/FLdOqmbaVfMIWjapW9f6BQ2qDNkRYR25Z/u+szErZVqWnUtt31m/9fFvr3tW\nmXMJAKSvTp97VXjNrtBvRqALANQfu/eIePHSTXt2rF2ep2FVrFYnePGoqQM7FLRksGw2XDqx\nNHTO7hMHLx5WO1StH/y/qKn9PMs2c4QQKh4WdgihH5Vjq6DJrYJKaODmM2GGz4QinxJWXrbv\n8TL9Ja3ERcwHaNRnYlyfiSWEYAmrTluxbRqA7qrYvLw8+odJEELI6L6jq2IRQgghhNC/gYUd\nQgghhJCJwMIOIYQQQshEYGGHEEIIIWQisLBDCCGEEDIRWNghhBBCCJkILOwQQgghhEwEFnYI\nIYQQQiYCCzuEEEIIIROBd55AP50e1cqVcAO+L3G5XC6Xm5WVRbM9i8WysLAAAENv0JmTk2PQ\nLRSZTKZcLqd/p1Eej8dms+nfC5LNZpubmwOAoTfoNPQWiiRJymQyg+40SpIk/VeQw+GYmZkB\nwMePH2l2QQihHxQesUMIIYQQMhFY2CGEEEIImQg8FYt+OvsTkw3soQKge9Yvv/0HqYEhANI/\nGNg+zeAQQPc876f2yXRPj36SbuDuTU81PATds8n/UAF8/YR1KzHL4C1BCKHvDB6xQwghhBAy\nEVjYIYQQQgiZCCzsEEIIIYRMBBZ2CCGEEEImAgs7hBBCCCETgYUdQgghhJCJwMIOIYQQQshE\nYGGHEEIIIWQisLBDCCGEEDIReOcJhNCPiVIFuDvJNVr9ZQSDu/fRi4KHH+K3xETHJjx6LtMw\nbV3qtO4b3Mu3mX572btL2yJX3bh6NzNLZlXepWvQuFmjuwtJoqCB5M3FufNWnrh0JzVTaulQ\nRAN9mwKaL3tS68KxeUbNEyGEDICFXbHmBPjeVpVbuW25I5ssWPh4zaiZ12rHxQw3YqD7p3fF\nHb3w5M0HDcm3rVCldefevdtV1z0lSX6Xy7UtJ2J/2UuZ+3Dt4vVXE94Ly1cPmDCpdWWzIlf+\nal/whJ2SA3ujAaBv925NVm0f6yAs+Ie3t7fP+l2D7PiGbrOhHUuXI0IlUOVekWu0lg1/cbfl\nfVpKfLotWObfi8YO/50U1WjTZ4QFKXl4bNeuMN/EjONhw2rrGijSTwd3HZSm5jfs7udkw8y+\nfjBm3vDDx27ePxbBIgAAZGknWzULTNLwO/buU8uOeS9+f0ED5hel3euDIwfvuMwX25Zx3ggh\nVBIs7Eqikb+eHXlh/dS2ZRfi9R9zwzbeaec3yHdwFY5W8uLe5diokERJ5MxuzgBwMXzK4boz\nV41w+7LjtpD5CdUCV0xs9OTIksjpi1rtmFf0MYQSde7c2Y1XmveAQR1LnSNCJVBlnwGA+nOW\nj3KyLLLBnskbgeu25MxRRx4LAKhxY2Y3a3Rv1VDlkKtsBgEAf42ZnKakArfH+9S3BYBW4vDY\nIY2DD0VPuDY2qqk9AOwPGvdOSc04fGVMI1sAgGkzCxqsbGKnH0uZfbVdwMayTRghhGjAOXYl\nsW3RKvXyip1PDL3juAE2777r0Hbm2ICudWpWdatVv0vA6PlBrrdjF36144XkvNq+rWwsxQ1+\n7aSU3MvRUKWIPmLEiGbmnx0q02hprefLjiUodY4IlUDyOAEAPETcIp+l1GmnUvMsak3TVXUA\nQDBteta31SjeJkpUuiWHEzI4NkG6qg4AAEi/JQsB4PLqJ7rHa+5n8O0G5ld1RTX4J5hqnk//\nzIpB3a15gBBC/yks7Epi7uI7sbX9vvDFWUWVTZQ6Y+/ahWOHD+zpFzBm2qIzjzMBIGZQnyFz\nbukavNg1wdvbe82bXN3Dlf39hi2+V2glUg2lyEzRX1Kx86jQkGEUwLoBfmuSJW+PTekVuOjL\n6IG1rK6vP0NRimPROyxcfS2KmfRTMt9u3TalSAGgfw+fPW8fzBnZr0d3n4ABw1buvqJroFEk\nbfnfrAF9/br36jNu+qKLL3MLdUy9dWxO8Ki+vXoEDBg6b/VeaVF1YalzRKgEmZdSCAa7Njfz\n+rE9R2I2xZ/+S/LZfDvGqAWRQ8fX1e+Sk6MkGKxyXBIAQCvXOlR2avCrfgOCZQUA6jw1AIBW\npnV0qtXEq9gG/7i1sk90IrHl3AoBAz9REUL/MTwV+xUtRs8+EDhyxoZbK4d7FHoqdtr447Ka\nw4YGVzAnHl858nvIcM3qmNZdHA7vPwhQHwBunf1AMhkPjiTBCDeNMulslqJjb6dCKxncrdbk\nnVGDJl72bNqwTu3a1atUYHOdGzRwBoDB0bH2owccrzVt+bDqX25Y25DpOwMn/zZyh6BSp2WL\nAv99poenL2rbb8zA2uXfXYtbsHGBTZtdfWx5aydMjle6/DYutLxAdeXQxv9NGmcVG12Tn/+2\nUUsfjpmztmavkbNGVlGkPY5cGj3bsdEi74r/MseTJ08mJibq/s3lcgMDS8qOwWBwOBwWi1VC\nG30kSX69EfoRpNxMB4IztWWT97n5R+DYYvfh0bs9a4oAgGCKPX38dMsVuVm5mSlP4ndF3U11\n6BplrZs1y+AuP3JBf4UCgeBN3GIAqDXCnc/nA4N3++5divrsu0pBA4FAoFuS83xrj/mXui6/\n7lVOsAcACEbBU1+le9/Sb89kMgGAIAj6XQiCAAA+n18oka924XA49AcLk8mkKOrbJEKzfQEO\nh6MLRwdJkgZtle4VNKgLg8EoReIAwOVyDfqgY7PZDNrfNHS7iCTJb5MIm033hA+DwWCz2Qa9\nFcHAREiSZDAMGLYFe5XH42m12pIb6/cy9K0IAEwms8gNKzkuFnZfwWDbh4Z0HDw74rjXtk4O\nnz5T5OmH9j3JjtgR7C5gAYBLVXfNtYBdax6uDu6g3Lrmbp6qNk99IE3Wx6/SvhMXYISb5O0e\niiEMcBQWWn81//CVNS6evXTt9um4vVvXkVwL94YtfPv3r2PLZbI5bIJgMNkcTuHBrJG/jV6w\nROFQX5N0s5pPG1sWI/fZvSSms1vlwuunT9BkUv9f6gBAhW4TnLZffJwml1IHT7yTjN8c2kbM\nBYAqNWo+7Bu4fv/r5YEuui5KyS2ZlurUxbOaiAOuznOnid5ziriGw9Ac4+Pjjx8/rvu3SCQa\nOnRoyVvO4XBKnTX6cd3OlINWViEoanb/TgJ1xqPTm3+fs251YI9qV06V4372yba2U4P4dCkA\nWNYduHChT3ErfHZseftx5wT2XXf4uvGYBABwuZ+d572/f0GhBlpV6pAOE82azDg4uv4/x8wZ\nPJ5hJ2Tpf9YXMDREoUToYLFY9MsIHUMTIQjC0EQMbQ8A9GsIHZIkDU2cwTD4Rf8GiTAYjO8z\nEUM/sQ1NHABIkjTtRDQaTQm9sLD7Ouv6wwfVvro5bJXnxkkFCyXvblEUNd2/p35LgTqJK+rm\nwl1/MCGrauVzMlblbh077Ni1MVU1NO3QY6FjX7OiTphWqtNyYJ2WACDLSLpz49rhPbvDR95Z\nvj2qEqe47yhU9ISpN8p5b1jRO/f6pmELJrk4bbBYtzTWbOLG8DqlTtO+Q6WCf5uTDKAgO+E+\nyXFsK87/k0AweD7l+Ksuv4F/CjueuJtnldPzBw9x96hXo3r1uh5NGlUSFblyg3J0cHCoXj3/\nAJ5QKFSr1V+2KUCSpFarpX80Ao/YmYwOC6M92ZXrNHYGAIDy9fzCIsiHY0IvrD76Zm4PZ/2W\nXSNW1Uv/8O7BhT92x4wbxIraPIvD+GwkKtLu7JwT8uepe2aVOhy6vNMcNGo1MJlMjUaje2tJ\nk2/MGjdq+YFb+g0AIG5Y6xM55eP/nKJRq/8pa6iS37H6dF/9DfrSr+tCPwQAMJlMQ9vrtor+\nhpEkSVFUmSZCEARJkqVIpOBFpKN0iVAUVfIfWn0/bSK69lDGieiOuRqaCIPBMDRxMDwRQ/9U\nlZCIVqst4W8ZFna0dJ0+7c9+U2fvedr/nyVMAZsgBbt3btZvRjBYAETfGqJV+56lNrwmrNiD\nK2pux9qw932e/HaG07DCJ3OVOX8tjboQNGmq7hdVeFblm/7So0GLaj37TNv+Ond61aKv9VPm\nXj2WJJm5uAePQfAaD57hkzgvdBpfnVM33PHf5MjiFX6XUBQAfPb3j8EggPo0wAjSPHhZTK+E\nm3fuP3p079z+revcu4eH9/9sVlMpchw5cuTIkSN1/9ZqtRkZGSVstkgkysvLUyqVNNM0Nzen\n2RJ952q0LHy5um2nKRB6IXnPK/i8sHP17OgKAD37N3XqPml+9JobI8Y3Krimlbq1dcaqJVuy\ntQLf8UsjpvSzYimyshQEQYjF4pycHI1GfSZ6+pjZm9O1Qv0GAJB2fX7glsTB22+7aqRZWVIr\nKysAAEqTlZVFMwWBQEAQhEQiodmey+UKhUKKouiHYDAYVlZWOTk59P80isVigiCkUqlcLqfZ\nxczMTKvV5uXl0WzP5/P5fL5Wq6WfCEmSIpEoOzub/p9Ga2trAJBKpQqFgmYXc3NztVotlUpp\nthcIBLrzcfQTYTKZFhYW9Nvr3ooAYNAHnYWFhVKplMlkNNsLhUIul6tWq7Oz6V4syGKxzMzM\nDH0FAUAikahUKpq9LC0t5XK5QW9FDoejUqlycnJoduFwOHw+36BX0NLSEgByc3Pp17UikcjQ\ntyKbzVYqlbm5uUU20L29i4RTfWlh8qrOGdnk0c6ZVzPyXxW+XUfQSo9naLj5ODsiZq069wEA\nqvjXzHmx586pZEfvqkCQfo7Cu/sux+co/DzEhVZLsstdv3Zt9610/YUaeRYA2AuLP4SuVQNA\nsiz//VQ/aHY1MkVK2o6uZWW0hAEAwLJGTY3i7fnM/BFFaeWHkvLEjT8d2MtKOLh+074K1Rt4\n+QVNDV8cObzqvSMxhVZSyhwRMhzJdQIASqkBAMXHi+cPxj2WfPb3w6FrPwB4cy45/zGl/mNS\n+4j5m7iNgyJO31oT2t+K9flHIqVe/VvrPqEbhM0HHL5+r1CDtCvnKIra0LeujY2NjY0NSZLb\nUvOk6QdtbGwqVR9ZtqkihFAx8IgdXQ5tp3Q7GLj/WirXCgCAbdZgSF3xlqnzuMN83coL75za\n9GdC+qyptgBg7hzIUAzd+h5G1REBQI1ujh+WR3PMW9fiF65jSK7zNK9qEYvGcXz7NKruJOAQ\nWckvjsZuM3PqHFROAAAMAmQp7zMzHUSiT8eZ2BbNm1mt3DZ9ifkIX1vIjD8Y84x0rgovlv7x\ndIZPVSOmzLfr26H8kbVTF5HDfcsL1H8diH6sspjr96mwY1nI/jy4UyIQdWnoSuQlHz6aJHAs\nPIGpdDkiVDLFx9gZv+2oOGjt6C6f3pDKrGMAIGptDwBq6fGVIZtr/q/RnC6VCxpolUkAwBTl\nz4x5tbHvlsMJtYetmxnsVeRV5Q9W9pq1L6H1uI1xYd5ffgm2bRI0ZcovBQ95PN6BpQsSKOcJ\no71Z/BrGyBIhhAyGhR19RODc8acHzCs48PrrzEhFdNSetYsyVSxH59rBC0LrClkAwGDZ9rTl\nxWWKPC04ACCu35GiHtq2/LXIlTYasmhWxZ0HThyPPJQqUxMiW8e6noETAr10v2tfs1tjxaaV\nIya12rVxgl4nRvDyOZujNm1aNktGCKrVb7V4XZDly9iBYdP2uW3s6Vb0CdxSYYyMXGy2KnrD\nklk5aoZjFY/gpSPd9cpTgYN/+KCcmCMxITslAktr19od5o/sYaQcESoJ27JL9pPQS7On+Lbb\nYc8hAYDS5B2btowgmD0CqwAAz36UOXPr80WL8jquFujmtlKq83NjAaClVwUAAK0iMuoar9zA\n4qo60MqHLLosLD+kyKoOAKwb9Zvc6NNDKyur52uWPtO4TZ482bjJIoQQfQT9+QoIfXtlMcfu\n8Mv0r7dD3713cRPGz4pjW7m37dZOCNmJ8fvvPcuuNyoubEwLXYOnG/qGLD3Pc2zawbs5T539\n9OL+WwnpFX2WRS70BwBlxgH/ZqP4lds3rpc/R8KOk1/g2TWZMCPQha89wbcNMHfp0KVh4UkU\ndk0mhAU4F1poZWXVv5z5fk2H14/X00yh1HPs0tPpvod1c+wyMjIMnWMnkUi+wRy7kke3Pt0M\nrfT0dEPn2OXm5pb1HDuNRpOZmUmzi26OHf1XsGCOXU5OTlnPsVOpVIbOsTP0FQSA7Ozssp5j\np1QqDZ1jZ9ArqJtjl5WVVdZz7BQKRSnm2OERO4TQD8nRL3K5fb2dm7ZfilsnVTPtqnkELZvU\nrWv9ggZVhuyIsI7cs33f2ZiVMi3LzqW276zf+vi31z2rzLkEANJXp8+9KrxmV+g3I9BFnnkW\nAHKen9r1vIgGXxZ2CCH0PcDCDiH0o3JsFTS5VVAJDdx8JszwKfoUv7Dysn2Pl+kvaSX+bBas\nqOqGjIwl9H8EAQBiUyRr8/LoHyZBCCGjw6tiEUIIIYRMBBZ2CCGEEEImAgs7hBBCCCETgYUd\nQgghhJCJwMIOIYQQQshEYGGHEEIIIWQisLBDCCGEEDIRWNghhBBCCJkILOwQQgghhEwE3nkC\n/XR6VCtXwg34vsTlcrlcblZWFs32LBbLwsICAAy9QWdOTo5Bt1BkMplyuZz+nUZ5PB6bzaZ/\nL0g2m21ubg4Aht6g09BbKJIkKZPJDLrTKEmS9F9BDodjZmYGAB8/fqTZBSGEflB4xA4hhBBC\nyERgYYcQQgghZCKwsEMIIYQQMhE4xw792NRqNf3pXwDw+PFjiURibm5ub29Ps4tWq6U/YwwA\ncnJyHj58CAAuLi4kSdLspVKpDErk/v37MplMJBLZ2NjQ7GJoIpmZmQ8ePAAAV1dXBoPul0Cl\nUmlQIrdv31YqlWKxWCwW0+xCf+aiTlpa2v379wGgatWq9HsZ+orcuHFDrVbb2NiIRCKaXTQa\nDUEQ9EOkpKTcu3ePJEkXFxeaXSiKMjSRa9euabVae3t73QxLOgwdhklJSWlpaSwWy8nJiWYX\nQxOhKOry5csAUK5cOd0MSzrUarVGo6HZGABev36dkZHB4XAqVapEf8PoT6XVbZIukfLlywsE\nAvq9DBomL168yMrK4vF4FSpUoNnF0EQUCoUukYoVK3K5XJq9DE3k2bNn2dnZQqHQwcGBZhdD\nPxilUumjR48AoHLlymw2m2YvQxMpxZ+qTyiEfiajR4/28PAICwsruxA3btzw8PDw8PBITk4u\nuygDBgzw8PBYuHBh2YU4f/68LpHc3Nyyi9KrVy8PD4+VK1eWXYjDhw/rEim7EBRFde7c2cPD\nY9OmTWUXYvfu3R4eHq1atSq7EBRFtWzZ0sPDIy4uruxCbNy40cPDo0uXLmUXQqPR6F70o0eP\nll2UFStWeHh4+Pn5lV2I7OxsXSIXLlwouygREREeHh6DBg0quxBJSUm6RG7evFl2UaZPn+7h\n4TFmzJiyC5GYmKhLJDExseyijB071sPDY9q0aaXoi6diEUIIIYRMBBZ2CCGEEEImAgs7hBBC\nCCETQVCGzHhF6Ed3+/bt9PR0e3t7d3f3MgqRmZl58+ZNAGjRogX9OcKGun79enZ2tqOjo5ub\nWxmFSEtLu3v3LgB4enoymWV1odWVK1fy8vIqV67s6upaRiGSk5N1l7O0b9++jEIAwMWLFxUK\nhaura+XKlcsoxNu3bxMTE5lMpqenZxmFAIBz585pNBo3NzdHR8cyCvHy5cvnz59zudwWLVqU\nUQiKos6cOQMA7u7upZl+Ts/Tp09fv34tFAqbNGlSRiFUKtWFCxcAoE6dOvSvlDJUQkJCUlKS\npaVlgwYNyiiETCb766+/AMDDw4P+BUaGevDgwYcPH8Ricb169cooRG5u7rVr1wCgcePG9K/L\nMdSdO3c+fvxoZ2dXq1YtQ/tiYYcQQgghZCLwVCxCCCGEkInAwg4h9I3IszKlWjxFgNDPBQf+\nN4aFHfp5aM/vipo4cpBfv6EzF61/ITXgFymLEzOi/6402VdDRPX3Gzr/vn7HF6fX+HTrtvzI\n4+LWTKkz969ZOLSff49eAaOCw0/c/mD0EACgzHmyet7UwN6+vn37B4cu+uu1pCyi6MjTrwwe\nOCA2VVoWIVKuhHp/7mC63OhRXv61d15ocF/f3iPGzzx5P8PoieQmLfP+gq//DONGodSZf6xf\nMGJQoK9//+DQJVfe5hk9EQDQKD9s/33uyMGBPf0CpkSseSop+CVb40ShOfT+ZbgvohgWnU6U\nQqsqo4FfKEpZDPzi9pVxB36hKGUx8L9MxOgDXz9EWYx6LOzQz+LFvrDI3Vea9Bg6a3yQ8PmZ\n0AnrDLt9QWHU04sbDrzPUuvNUqUZ4vXZdRNXHm8zbPH4rsVe93By/qTtF1K8B45dNHdqWxfF\n6vBRB99KjBsCgFodPPPyR/tRYRELQse5kY+XTpr6UaU1dhQAAEorWx2yIldTJvsKALLuZPHE\nXiF6GpqxjBvl481N4xfvEDfsEhYxs2N1+erw4PtSlXFD8K0+SyEkJMTTlm/TqINxo5yZP2nL\nmXTvoZPmh46rzkpYPHFqqvFfdG30xIl/PtD2HjF1fug4x5yrYeP/p6TASFEMGHr/IlwRUQyN\n/rUoRayqDAb+l1GMPvCL21fGHfhFRDH2wC8ihLEHfuEQZTLqjftbyQh9p7SKUb18Jux+pnsk\nz7zo5eW19Z2kdCtLuRw5wL+nl5eXl5dXbEreV0OsDOo1JOKebvmrc9E+3t4rjpT0k+Vq+Rsf\nb+/IBxkFW78yqFf/kCtGDEFRlDzrjJeX19ksue6hKu+hl5dXVFKucaPo3Nw4IXDiGi8vr7XJ\nEuPuK5340YHDFj8ovNSoUWb37Tly7b1/HmkiZ4VF3/lYFvuqQFbizp59QtJVWiNG0Wrlvt28\nw66k6B6q5a+8vLwWv8g2biKS9zFeXl7n0mX5URRJ/Xt0i0zI/PdRDBt6pQ1XdBSjDvwiV2X0\ngV9kFOMO/OL2lY6xBn5xUYw48IsLYcSBX/K+0jHKqMcjduinoMiOfyPXdOhQXveQY9minpB9\n8/yHknsVx7Jmr9A5C5cummpoiLfxmyZEHmnz25KxXUq6aalG/qqSk1MX54I7dRL1LDiqLIkR\nQwAAg2k9aNCgxmb/3OuQYAIAn2QYNwoAZD/bP/+4fMasngVLjB7iTo5CVM9SI8v5kJpV8F3b\niFGUuVdu5Co79aryzwLG+PC5Q+uIjZ5IAUqT+7/Ze7uETrFiEkaNQmkpINn5n/wEg8cgCI2W\nMm4ikpdPCAbP0yr/t35ItkMzc07C4aR/H8WgoVfqcEVGMTR6yVGKXJXRB36RUYw78IvbV2DU\ngV9cFCMO/CJDGHfgl7CvdIw16svqt6kQ+q4o8+4BQA0+q2BJdT7z+L1sCCjN2tjm5V3NQaP8\n7Dfqvhoi6eLm8csOWXlMGdv5K38X2RYtly9vWfBQJXm86b2k0sBqyrw9xgoBACxBbR+f2gCQ\neefareTkW2f22dT06mfLl703WiIAoFUmR8zY3mnquip8smChEfeVzm2Jirr0u9/KxyqKYgps\nOvYdN9yrthGjKHOuA4DdwyNTdx1+/kFmV8nl16AxnevaGz2RAi8OzH0m9pntLgKj7i6C4I5r\nU+H3/624PH2gs5n2Qtwylrn7oIpmylRjJsK1t6G092/kKhuYsQGA0mTfzlVKXmb8+0QMGnpK\nz1KGKzKKodFLjlLkqow+8IuMYtyBX9y+Mu7ALy6KEQd+0S+uUQd+cVkUMNaoxyN26KegVeQB\ngJj56Q1vzSLVEvk3C5H7Km5c5Mm2HZ3Sbq++mmFA3Nc3joaMCFM5dw7t5FhGIVIunT1+4vT1\n5zL3GpWNnsixxTOy6o8a4mGtv9C4ITTKJAnJsrFutmZ73N7tmyb4VDuyPizmcZYRo2gUOQDw\nv9UXm/QaETFvWodqxNpZIw6+lZTRK6JVJkfsfNp9avf8h0aN0nTw+MrqRwtDxg8bFbwjPtlr\n3BhbFsO4IcwrDaltzo6csfLq3cdP7t9YP3diuloLWkVZ7a5iVltG4WhG/5dRcOB/NYSJDXwj\njnos7NBPgcHmAUCm+tPc03SVhuSxi+9h5BCytGf+M1eOGrG4g712echaOY0fBldmJq6dM2ps\nRGz5TiOiFw0VkITRQ+i4jZ62ZHlUzKoptw6smn0myYhRUq+u2pxgP3+8Z6Hlxk2EZJePi4tb\nPLqbrZDDNrNu2XtKNzHv7IYHRozCYJIA0GbWrO6ejapVr+MzfF4nS9bB1cYMoe/t0f9JBK19\nywvyoxsvikaZHPpbiKJZwJrN2/ftjp0zpsehiNE7ErKMmwhBCmesDG9ilbpucVjYgjWS6oP7\n2PAZXPMy2l3FrbaMwtGMXuooOPB/zoFvxFGPhR36KbAEtQAgUfbpJ06eytQW7pbfLIRNvZCe\nda2BYA+dP4GZdj4s9kHJa8t9fWb0sJC7UGfx+s3BAe24BGH0EDnPLh458XfBQ75DIy8r7psT\nH4wYJe3iPWXuvUE9fby9vbt17w8AR4b5+/rPMG4iX6pnx1PlpBkxCpNfBQBaV/p0+6DG5fiK\nj+/LJhFqy56Xzv6fZiYZMUrG/TWJeYz5o7qXF5uxeBZ12geNqsg7EvW30RPhiNzHzFy0efve\nuB0bg3s3fSBViT3EZfS6F7fasn6blRy9dFFw4P+sA9+Yox4LO/RT4Fq2cWCTJy6l6h6q8u78\nnaus396Yd5AsOQTxzxF1jqhRxLCGT/fNOvw6t7hVUVppxNTVnHZjV88cVs3604QMI4YAAJXs\nQvTaSN3PHAAAUJqHUjW/It+IUVyCpv/vH8uWhgNA89CIxfNHGDeRrCerBg8Z9UFZ8NVWe+G9\n1LJGVSNG4Yo6ipiMU0+yC/bV+SSpmYuLcRPRkabuuZGrHOhZ7lN040UhOVygVNmaT+CcarkA\nAAvpSURBVIcBMuRqksMxbiJa5Yfw8PAzmflniGQfT9zIVbbrVL4sdlcJ+6eMwtGMXoooOPAN\nSsSUBr5xRz0WdujnQLAn+bo9iwk/fTMx+cWDTTOX8cu1C3IU/ichKnWe3quKIGb64nR1kT9L\nBNLU7Y+kqra1+DdvfHLnYZYRQwCAyG24C1sRsmDjzQeJzxLu7v598h0ZJzDQ2YhRuHaVXAu4\nOAGAZSVnZycH4yZi7txbLE2ZGr7u+oPEpw/v7Fo+JT7PbNiQqkaMQpBmU32qnI2YeSD+xrPE\ne3t+nxovYQ34zc24iei8P3qJbdagGk/vyjbjRbF0G15dSE4PW3nlzqPniff/3Dw/9oPSe3Q9\n4ybCYNtXznq2IXTl3w+f3rt2LmLiBpsGg72suWWxu0raP2UUjmZ0w6PgwDcoEVMa+MYd9XhV\nLPpZuPaeN1KxfFfkzHQ54VKn9bw5Q43+tYZ2CKLPnND4oGmhv8evDfb88uncZ68AYPOiCP2F\n5hWmb1vVxFghAIDBspn3v+mr1+1YNueEmmVWsbLb+IUzm4s4RkykBMZMhGk9d9XszWu3/z4v\nTE6aOVdxnxIZXk/IMm6UGv0WjIDf921Yuk3BruRSfezCGc0sy2RfXbiQYu7Ur9BCY0VhMMVz\nVkfErN0WsyIiXUY6VnIdNmtVV2dzoyfSb+EcdeTaqLkhSpaoXsvAKYO9jZtIIcWt9hu8k40Y\nBQe+YYmY0MA37qgnqNLOGEUIIYQQQt8VPBWLEEIIIWQisLBDCCGEEDIRWNghhBBCCJkILOwQ\nQgghhEwEFnYIIYQQQiYCCzuEEEIIIROBhR1CCCGEkInAwg4hhMpQvH8VgiCce8Z8+dSd2R4E\nQexPl5VFXD7JqOIfXxZrpmN3mH8FG6G166Avn8p5HUZ8gc0TOtVqOmHhLpne7/PPrGRhVm5o\ncSF06wlIzCiL7Ufox4V3nkAIoTL36sCgeTe6hjWw+a835FvI+7C+T8Suyj6Tlvp2Kq6NXbOg\nfs1s/3lEybJTLhzYu3ya/8nH5MOYXrqlDCaT1OLRB4QMg4UdQgiVOTGTMb9z/1HJR0RM4r/e\nljInSzsCAEN/nzmggllxbcr/MmHJrLr6S1SRU+vb1X8YG5Cwunt1PhMAwp+nh5fxpiJkevDL\nEEIIlbmNUd6yj8c6zrpkhHVRSoX6290KUqvO0hjYhdJqAYDDMKyEZQncFzawpbSqPzPK5Nw0\nQj8JLOwQQqjMVQncOcFdfHNRl33JecW1mVLB3LzCFP0lukl4rxQaANhV3dqi0szr0cGOFkIe\nm7S0dQ6cvlULcCNmar3KdjyO0KlG4/Cdjwqt897eBa1rVRKwOdbl3fzHLUtSfirSJK/jx/fp\nWNHGkiOwcqvXdva6owXT2zZXE4tcIhVZfwd61hByrCSaIurIlGtxAZ2b2lgK2QKLqg3bz4k5\nr1t+sKaNbd0/AWCSo5nAppdBe0kt1wBARU7+qaT5Tpb6c+yu71rYvoGrGZctLlelz7jlqUqt\nft8S0tGqPq4KGVTbxZ7LYpmLK7TrPfbqR7lBG4bQDwQLO4QQKnMEQc49uY4P0mEdwrRfb140\naer2FqNjfvltxpoVC5uLM7cv6N+4T+tWk892HR42f8Yw6uWtOf0aXMpRFrRPuzWzfu9ZvJq/\nTJwyqrmzdNfvk+o2HqW7OiHv/cG61duv/vNJu95DZ04eVtvidfhvXT36xxT01aoz+tftlFKh\nw/zfV/O+OPaWdmNp1Rb+ey5mdA0YFTamfyXJzVkD23SYcQEAmkXH7V7dBACGbjtwKC6UfnZq\n2bOIRxkCO59eNrwvn723qk8j/2l/vTLvNXTiYJ8mtzdOadRrT8GzJaezvEvdMYu32jTqETpn\nznC/Rn/vW9W+dh/VtzvoidC3RSGEECozF/q4AkCCVEVRVPz0hgDgt/Wp7qnb4fUBYN9Hqe7h\nZEczM8fJ+n11DV7K1RRF7XQTA8CkM0m6p2TphwGA5DhcypTrljzb0RYA/B5+1D3UVWMT9yfm\nr0ur2vSbOwD0OPSKoqjwmmIWv/rlj7KCWAeC6wLAvOdZFEVtqmpFEETHlTeLyUnrZ8tn8avH\nJ+fpHmtUaRPrWRMMbny2gqKo1DteALD0XW6RnbNfhQKAfYuBIZ9MHftbUG1bnrBiy8NvJQUt\nIypbCO2HUBSllj21ZZN8O68HOUrdU5J3Z6rxWQDQ93F6yemopIkMgqjYeV/BU5cnN7O2tt6V\nKi0mO4R+bFjYIYRQGdIv7LSq9M7WPCbP9Y5ESRle2LH4bvrPmpEMO4+4gofZr2YBgNedVN1D\nHoMQlhum314le8onGTZ1YlR5D0iCqDXxb/1nFVkXAKDWpL8pXWHH4KYoNUVmJE3bCwDu467q\nL8xImAQAbeKeU/QKuyLV7x2SpPgUtKCwS/7LFwB8jr/RX8/fk2rpCruS01HL33AZhHnlgOtv\ncorcHoRMDJ6KRQihb4RgWm05Nk0jf96t79ZSdGcwxfoPmQRwbESfVs5gFWovquX7WXuua1cr\nrjTlojzjmIai7i9rpP9LchzL1gCQfT9b15gtrGvLKvoPhDzzOAA4BznpLxRWCAKA5JMfaOZS\nP/y2/p+ivPSkPfN73Nq9sFX/U182Tr34CgD61LfWX+gysF7+9pSYDsmpcGJBP+rtzkaVLJ1q\nNwsYFrxu14mMb3j1CULfGP7cCUIIfTs2DWZs7LZp0MEh4de8fL7WmNL+q/rjy6tSmQQQDA4w\n2ABQa8qmJW0dCjXgWOT/BAnBEJSwXUXEIpgAQJW2YOJbOfhO29NmseDqyRUAHQs9y2AyAKDQ\nTD8G95+i9mvptJqyJXXAtIMHD5+Pv/TXqZgd6yODJzQ5+OBcBzG3dFuL0PcMj9ghhNA3Fbjt\njyo81uKu/T6qv/whkc+WpNz4V7dVyHhw8LNVK179mS43d27HtepCEoQ6q1pHPe1aVcrKyiIq\n87+6Wq6oIwC83P5Kf6HkXSwA2LWz+xfby2hvyVHJEr98wqalEwDsupOuv/DDmev521NiOipJ\n4rVr196Zu/YZNmnttoP3X2Y8OjpH+uHquLDb/2JTEfp+YWGHEELfFEtQ69j6HrL0k75bnukv\n55MMecaRj6r8q2bl6VdHnk36N4Ek71dPP/Lin0eaHZO6STTaboubM7mu4TWsnsb2P/NBWtB4\n56hu/v7+b2j8TeBZ9+xhw3+8bvCVtPwfDaHUGQsCNhAMzsxfK/ybDSYJQqNI/nK5de0Ftmzy\nZP9xiXlq3RJl9t3fptzS/bvkdPJS1jRp0sRv4acyrnKDhgCg/mdVCJkYPBWLEELfmkvAjuCF\np//34LNDUN79qs6ed71O26ApgW1VHx7H/G9FijUb3pW+/uDYcBd613gQMKihi9ntc3EHLryq\n0HHuqqZ2ADD+6Or1VQM6u7h37+PtUcXqwdndsaee1BoQ28/260fsABhr/pxxsnmop4tH/8Hd\nnYSyC/s3n3iU2Tb0TDtLTqm3FgAq8ZiUNutSjrKFOVt/Ocl1OrW0R52xe+o5Ne0X2MkWUg7H\nxGY36QvHN+kalJAOJZ7d3ib6zNxWXV4MbFLTWZv16uCGTSRLHD6/3r/ZVIS+X//VVRsIIfQz\n0L8qVp/k/V4zkgF6V8VqNXlRwf7VKtmzCAIAyjcPunS5M+hdFcsxb66/BhGTUbHTqYKHOW/m\nwedXxbbafmvDrKF1ney5TLZNxVqDwtZnq7UF7bMSjw/3aW1vKWTzrdzqtpi1/pjqnyc3VbXi\nWrYrOa/3l7b36dBIbM5jcs1c6reZvflcwVN0rootdPGEzp35HgBQpe9O3cOCq2J1rm6PaFPP\nWchhmllX6DkqKlfyCP75uZOS05F++GtM7/YVrc2ZDNJM7NjaZ/CB2x9Lzg6hHxdBUXhxEEII\nfUe0ipx3aeqKjlb/9YYghH48WNghhBBCCJkIvHgCIYQQQshEYGGHEEIIIWQisLBDCCGEEDIR\nWNghhBBCCJkILOwQQgghhEwEFnYIIYQQQiYCCzuEEEIIIROBhR1CCCGEkInAwg4hhBBCyERg\nYYcQQgghZCKwsEMIIYQQMhFY2CGEEEIImYj/AwO3SeNyRtakAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "stations <- all_trips %>%\n",
    "  gather(key, stations, from_station, to_station) %>%\n",
    "  group_by(stations) %>%\n",
    "  summarise(number_of_rides = n(), first(start_lng), first(start_lat)) %>%\n",
    "  arrange(desc(number_of_rides))\n",
    "\n",
    "stations %>% \n",
    "  group_by(stations) %>% \n",
    "  summarise(number_of_rides) %>%\n",
    "  arrange(desc(number_of_rides)) %>% \n",
    "  slice(1:20) %>%\n",
    "  ggplot(aes(number_of_rides, reorder(stations, number_of_rides))) +\n",
    "  scale_x_continuous(labels = scales::label_number_si(),breaks=seq(0,180000,by=10000)) +\n",
    "  ggtitle(\"Total Rides by Station\") + \n",
    "  xlab(\"Number of Rides\") + ylab(\"Station\") +\n",
    "  theme(plot.title = element_text(hjust = 0.5)) +\n",
    "  geom_bar(stat=\"identity\",fill=\"lightblue\") +\n",
    "  geom_text(aes(label = number_of_rides))"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 280.294083,
   "end_time": "2022-07-04T14:56:42.934929",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-07-04T14:52:02.640846",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}