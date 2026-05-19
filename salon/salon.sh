#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ SALON ~~~~~\n\n"
mapfile -t SERVICES < <($PSQL "select name from services")

echo -e "Here is what we offer:\n"

function main() {
  for INDEX in "${!SERVICES[@]}";
  do
    SERIAL=$(( INDEX + 1 ))
    echo "$SERIAL) ${SERVICES[$INDEX]}"
  done

  echo -e "\nWhat you want to have today?:\n"
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")

  if [[ $SERVICE_ID_SELECTED -lt 1 || $SERVICE_ID_SELECTED -gt 3 ]]
  # if wrong service selected
  then
    echo -e "Service is not available yet. Please pick among these:\n"
    main
  # if right service selected
  else
    echo Please give us your phone number:
    read CUSTOMER_PHONE

    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_ID ]]
    # if phone number doesn't exists
    then
      echo -e "\nYou aren't registered yet. Please give us your name:\n"
      read CUSTOMER_NAME
      echo -e "\nWhen you want the service?\n"
      read SERVICE_TIME

      INSERT_CUSTOMER_QUERY_RESULT=$($PSQL "insert into customers(phone, name) values ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
      INSERT_APPOINTMENT_QUERY_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

      if [[ -n $INSERT_APPOINTMENT_QUERY_RESULT ]]
      then
        echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    # if phone number exists
    else
      echo -e "\nEnter the time when you want the service:\n"
      read SERVICE_TIME

      INSERT_APPOINTMENT_QUERY_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      
      if [[ -n $INSERT_APPOINTMENT_QUERY_RESULT ]]
      then
        echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    fi
  fi
}

main
