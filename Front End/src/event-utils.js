let eventGuid = 0
let todayStr = new Date().toISOString().replace(/T.*$/, '') // YYYY-MM-DD of today

export const INITIAL_EVENTS = [
  {
    id: createEventId(),
    title: 'All-day event',
    start: todayStr
  },
  {
    id: createEventId(),
    title: 'Timed event',
    start: todayStr + 'T12:00:00'
  },
  {
    id: createEventId(),
    title: 'All Day Event',
    start: '2019-12-01',
    color: '#fc9919'
  },
  {
    id: createEventId(),
    title: 'Long Event',
    start: '2019-12-07',
    end: '2019-12-10',
    color: '#ffc107' // override!
  },
  {
    groupId: '999',
    id: createEventId(),
    title: 'Repeating Event',
    start: '2019-12-09T16:00:00',
    color: '#17a2b8'
  },
  {
    groupId: '999',
    id: createEventId(),
    title: 'Repeating Event',
    start: '2019-12-16T16:00:00',
    color: '#17a2b8'
  },
  {
    id: createEventId(),
    title: 'Conference',
    start: '2019-12-11',
    end: '2019-12-13',
    color: '#27e3f4' // override!
  },
  {
    id: createEventId(),
    title: 'Meeting',
    start: '2019-12-12T10:30:00',
    end: '2019-12-12T12:30:00',
    color: '#0084ff'
  },
  {
    id: createEventId(),
    title: 'Lunch',
    start: '2019-12-12T12:00:00',
    color: '#777D74'
  },
  {
    id: createEventId(),
    title: 'Meeting',
    start: '2019-12-12T14:30:00',
    color: '#0084ff'
  },
  {
    id: createEventId(),
    title: 'Birthday Party',
    start: '2019-12-28T07:00:00',
    color: '#28a745'
  },
  {
    id: createEventId(),
    title: 'Meeting',
    start: '2020-01-12T14:30:00',
    color: '#0084ff'
  },
  {
    id: createEventId(),
    title: 'Birthday Party',
    start: '2020-01-02T07:00:00',
    color: '#28a745'
  },
  {
    id: createEventId(),
    title: 'Click for Google',
    url: 'http://google.com/',
    start: '2020-01-25'
  },
  {
    id: createEventId(),
    title: 'Birthday Party',
    start: '2020-01-13T07:00:00',
    color: '#28a745'
  },
  {
    id: createEventId(),
    title: 'Click for Google',
    url: 'http://google.com/',
    start: '2019-12-28'
  },
  {
    id: createEventId(),
    title: 'Meeting',
    start: '2020-01-12T14:30:00',
    color: '#0084ff'
  },
  {
    id: createEventId(),
    title: 'Birthday Party',
    start: '2020-01-13T07:00:00',
    color: '#28a745'
  },
  {
    id: createEventId(),
    title: 'Click for Google',
    url: 'http://google.com/',
    start: '2020-01-28'
  },
  {
    id: createEventId(),
    title: 'All Day Event',
    start: '2020-02-01',
    color: '#fc9919'
  },
  {
    id: createEventId(),
    title: 'Long Event',
    start: '2020-02-07',
    end: '2020-02-10',
    color: '#ffc107' // override!
  },
  {
    groupId: '999',
    id: createEventId(),
    title: 'Repeating Event',
    start: '2020-02-09T16:00:00',
    color: '#17a2b8'
  },
  {
    groupId: '999',
    id: createEventId(),
    title: 'Repeating Event',
    start: '2020-02-16T16:00:00',
    color: '#17a2b8'
  }
]

export function createEventId() {
  return String(eventGuid++)
}
