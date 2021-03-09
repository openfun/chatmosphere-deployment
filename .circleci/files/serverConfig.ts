// Read Me:
// These are Server Connection Options for the Jitsi library
// Best is to Keep them as a reference
// Just duplicate the file and name it serverConfig.ts to adjust to your likings

export const connectionOptions = {
  hosts: {
     domain: 'meeting.education',
     muc: 'conference.meeting.education', 
     focus: 'focus.meeting.education',
  }, 
  externalConnectUrl: 'https://meeting.education/http-pre-bind', 
  // enableP2P: true, 
  // p2p: { 
  //    enabled: true, 
  //    preferH264: true, 
  //    disableH264: true, 
  //    useStunTurn: true,
  // }, 
  useStunTurn: true,
  bosh: 'https://meeting.education/http-bind?room=c6b6ad18-74cb-48c1-b055-b2999aa647e1', // ! if you make your own please omit the "?room=chatmosphere1234" part
  // serviceUrl: `//server.com/http-bind`,
  // websocket: 'wss://meeting.education/xmpp-websocket', 
  clientNode: 'http://jitsi.org/jitsimeet', 
}
