import { useBackend } from '../backend';
import { Button, Section } from '../components';
import { Window } from '../layouts';

export const AtmosAlertConsole = (props, context) => {
  const { act, data } = useBackend(context);
  const priorityAlerts = data.priority || [];
  const minorAlerts = data.minor || [];
  return (
<<<<<<< HEAD
    <Window
      width={350}
      height={300}
      resizable>
=======
    <Window resizable>
>>>>>>> master
      <Window.Content scrollable>
        <Section title="Alarms">
          <ul>
            {priorityAlerts.length === 0 && (
              <li className="color-good">
                No Priority Alerts
              </li>
            )}
            {priorityAlerts.map(alert => (
              <li key={alert}>
                <Button
                  icon="times"
                  content={alert}
                  color="bad"
                  onClick={() => act('clear', { zone: alert })} />
              </li>
            ))}
<<<<<<< HEAD
            {minorAlerts.length === 0 && (
=======
            {minorAlerts.length > 0 && (
>>>>>>> master
              <li className="color-good">
                No Minor Alerts
              </li>
            )}
            {minorAlerts.map(alert => (
              <li key={alert}>
                <Button
                  icon="times"
                  content={alert}
                  color="average"
                  onClick={() => act('clear', { zone: alert })} />
              </li>
            ))}
          </ul>
        </Section>
      </Window.Content>
    </Window>
  );
};
