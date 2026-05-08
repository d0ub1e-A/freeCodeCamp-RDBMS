#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate table games, teams")

# stores the unique values in the array
mapfile -t UNIQUE_TEAMS < <(
  while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPOENENT_GOALS
  do
    if [[ $WINNER != "winner" ]]
    then
      echo -e "$WINNER\n$OPPONENT"
    fi
  done < games.csv | sort | uniq
)

TEAMS=""

# modifies the team name for single query insertion
for TEAM in "${UNIQUE_TEAMS[@]}"
do
  TEAMS+="('$TEAM'),"
done

TEAMS="${TEAMS%,}" # trims the trailing comma

INSERT_QUERY_RESULT=$($PSQL "insert into teams(name) values $TEAMS;")
echo $INSERT_QUERY_RESULT

# inserts the game data in db
while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPOENENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER';")
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT';")
        
    INSERT_QUERY_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPOENENT_GOALS);")
    echo $INSERT_QUERY_RESULT
  fi
done < games.csv