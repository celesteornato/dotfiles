# Check for dependencies, some of these (icalendar) are not built-in
import datetime
import icalendar
from pathlib import Path
from urllib.request import urlretrieve


# Number of events to show past and including right now
EVENTS_TO_SHOW = 2

# Past this, we assume there are too many rooms for it to be meaningful (MCQ)
MAX_ROOM_NAME_LEN = 20


ics_path = ""
with open("/home/main/.config/waybar/scripts/ics_url.env") as f:  # oooh secrets
    ics_path = urlretrieve(f.readline())[0]

ics_file = Path(ics_path)
calendar = icalendar.Calendar.from_ical(ics_file.read_bytes())

shown_events = 0
events = [
    (event.start, event.end, event.get("summary"), event.get("location"))
    for event in calendar.events
]
events = sorted(events, key=lambda tup: tup[0])[0:EVENTS_TO_SHOW]
for i, (start, end, name, loc) in enumerate(events):
    # Special case if the next class is not today
    if start.day != datetime.datetime.now().day:
        print("No classes left today!" if i == 0 else "End of the day!")
        break

    # Otherwise we format the classes together as usual
    startfmt = start.astimezone().strftime("%A %H:%M")
    endfmt = end.astimezone().strftime("%H:%M")

    locationfmt = (
        f"in {loc}"
        if (len(loc) < MAX_ROOM_NAME_LEN and len(loc) > 0)
        else "(No room specified)"
    )
    separator = "\n" if i == len(events) - 1 else "  |  "
    print(f"{name} — {startfmt} to {endfmt} {locationfmt}", end=separator)
