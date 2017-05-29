from datetime import datetime

class OfficeHours():

    def TimeCheck():
        now = datetime.now().time()
        nowHour = int(now.strftime('%H'))
        nowMinute = list(now.strftime('%M'))
        ampm = 'PM'
        if nowHour == 24:
            ampm = 'AM.'
        elif nowHour > 24:
            ampm = 'AM.'
        elif nowHour > 12:
            ampm = 'PM.'
        print (now.strftime('Time at PDX HQ is %H:%M'), ampm)

        def NYOffice(): # Checks if NY office is open
            nycHour = nowHour + 3
            ampm = 'AM'
            nycMinute = nowMinute
            if nycHour == 24:
                nycHour = nycHour - 12
                ampm = 'AM'
            elif nycHour > 24:
                nycHour = nycHour - 24
                ampm = 'AM'
            elif nycHour > 12:
                nycHour = nycHour - 12
                ampm = 'PM'

            # Checks if the NY office is open/closed
            openClosed = ''
            if ampm == 'AM':
                if nycHour < 9 or nycHour == 12:
                    openClosed = 'CLOSED'
                else:
                    openClosed = 'OPEN'
            if ampm == 'PM':
                if nycHour < 9 or nycHour == 12:
                    openClosed = 'OPEN'
                else:
                    openClosed = 'CLOSED'
            nycMinute = "".join(nycMinute)
            print ('It is %s:%s %s at the NY Office, the office is now %s.' % (nycHour, nycMinute, ampm, openClosed))


        def LDNOffice(): # Checks if London office is open
            ldnHour = nowHour + 8
            ampm = 'AM'
            ldnMinute = nowMinute

            # Checks if it is AM or PM
            if ldnHour == 24:
                ldnHour = ldnHour - 12
                ampm = 'AM'
            elif ldnHour > 24:
                ldnHour = ldnHour - 24
                ampm = 'AM'
            elif ldnHour > 12:
                ldnHour = ldnHour - 12
                ampm = 'PM'

            # Checks if the LDN office is OPEN or CLOSED
            openClosed = ''
            if ampm == 'AM':
                if ldnHour < 9 or ldnHour == 12:
                    openClosed = 'CLOSED'
                else:
                    openClosed = 'OPEN'
            if ampm == 'PM':
                if ldnHour < 9 or ldnHour == 12:
                    openClosed = 'OPEN'
                else:
                    openClosed = 'CLOSED'
            ldnMinute = "".join(ldnMinute)
            print ('It is %s:%s %s at the LDN office, the office is now %s.' % (ldnHour, ldnMinute, ampm, openClosed))

        NYOffice()
        LDNOffice()

    TimeCheck()


if __name__ == "__main__":
    OfficeHours()
