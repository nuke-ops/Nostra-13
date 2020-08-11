<<<<<<< HEAD
import { useBackend } from '../backend';
import { Box, Button, LabeledList, ProgressBar, Section } from '../components';
import { Window } from '../layouts';
import { Fragment } from 'inferno';

const skillgreen = {
  color: 'lightgreen',
  fontWeight: 'bold',
};

const skillyellow = {
  color: '#FFDB58',
  fontWeight: 'bold',
};
=======
import { Fragment } from 'inferno';
import { useBackend } from '../backend';
import { Window } from '../layouts';
import { Box, Button, LabeledList, ProgressBar, Section } from '../components';
>>>>>>> master

export const SkillPanel = (props, context) => {
  const { act, data } = useBackend(context);
  const skills = data.skills || [];
<<<<<<< HEAD
  return (
    <Window
      title="Manage Skills"
      width={600}
      height={500}
      resizable>
      <Window.Content scrollable>
        <Section title={skills.playername}>
          <LabeledList>
            {skills.map(skill => (
              <LabeledList.Item
                key={skill.name}
                label={skill.name}>
                <span style={skillyellow}>
                  {skill.desc}
                </span>
                <br />
                {!!skill.level_based && (
                  <Fragment>
                    <Level
                      skill_lvl_num={skill.lvl_base_num}
                      skill_lvl={skill.lvl_base} />
                    <br />
                  </Fragment>
                )}
                Total Experience: [{skill.value_base} XP]
                <br />
                XP To Next Level: 
                {skill.level_based ? (
                  <span>
                    {skill.xp_next_lvl_base}
                  </span>
                ) : (
                  <span style={skillgreen}>
                    [MAXXED]
                  </span>
                )}
                <br />
                {skill.base_readout}
                <ProgressBar
                  value={skill.percent_base}
                  color="good" />
=======
  const see_mods = data.see_skill_mods;
  const skillgreen = {
    color: 'lightgreen',
    fontWeight: 'bold',
  };
  const skillyellow = {
    color: '#FFDB58',
    fontWeight: 'bold',
  };
  return (
    <Window>
      <Window.Content scrollable>
        <Section
          title={data.playername}
          buttons={(
            <Button
              icon={see_mods ? 'Enabled' : 'Disabled'}
              content={see_mods ? 'Modifiers Shown' : 'Modifiers Hidden'}
              onClick={() => act('toggle_mods')} />
          )}>
          <LabeledList>
            {skills.map(skill => (
              <LabeledList.Item key={skill.name} label={skill.name}>
                <span style={skillyellow}>
                  {skill.desc}
                  <br />
                  Modifiers: {skill.modifiers}
                </span>
                <br />
                {!!skill.level_based && (
                  <Box>
                    {see_mods ? (
                      <span>
                        Level: [
                        <span style={skill.mod_style}>
                          {skill.lvl_mod}
                        </span>]
                      </span>
                    ) : (
                      <span>
                        Level: [
                        <span style={skill.base_style}>
                          {skill.lvl_base}
                        </span>]
                      </span>
                    )}
                    <br />
                    Total Experience:
                    {see_mods ? (
                      <span>[{skill.value_mod} XP]</span>
                    ) : (
                      <span>[{skill.value_base} XP]</span>
                    )}
                    <br />
                    XP To Next Level:
                    {skill.max_lvl !== (see_mods
                      ? skill.lvl_mod_num
                      : skill.lvl_base_num) ? (
                        <Box inline>
                          {see_mods ? (
                            <span>{skill.xp_next_lvl_mod}</span>
                          ) : (
                            <span>{skill.xp_next_lvl_base}</span>
                          )}
                        </Box>
                      ) : (
                        <span style={skillgreen}>
                          [MAXXED]
                        </span>
                      )}
                  </Box>
                )}
                {see_mods ? (
                  <span>{skill.mod_readout}</span>
                ) : (
                  <span>{skill.base_readout}</span>
                )}
                {see_mods ? (
                  <ProgressBar
                    value={skill.percent_mod}
                    color="good" />
                ) : (
                  <ProgressBar
                    value={skill.percent_base}
                    color="good" />
                )}
>>>>>>> master
                <br />
                {!!data.admin && (
                  <Fragment>
                    <Button
                      content="Adjust Exp"
                      onClick={() => act('adj_exp', {
                        skill: skill.path,
                      })} />
                    <Button
                      content="Set Exp"
                      onClick={() => act('set_exp', {
                        skill: skill.path,
                      })} />
<<<<<<< HEAD
                    <Button
                      content="Set Level"
                      onClick={() => act('set_lvl', {
                        skill: skill.path,
                      })} />
                    <br />
                    <br />
                  </Fragment>
                )}
=======
                    {!!skill.level_based && (
                      <Button
                        content="Set Level"
                        onClick={() => act('set_lvl', {
                          skill: skill.path,
                        })} />
                    )}
                  </Fragment>
                )}
                <br />
                <br />
>>>>>>> master
              </LabeledList.Item>
            ))}
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
<<<<<<< HEAD

const Level = props => {
  const {
    skill_lvl_num,
    skill_lvl,
  } = props;
  return (
    <Box inline>
      Level: [
      <Box
        inline
        bold
        textColor={`hsl(${skill_lvl_num * 50}, 50%, 50%)`}>
        {skill_lvl}
      </Box>
      ]
    </Box>
  );
};
const XPToNextLevel = props => {
  const {
    xp_req,
    xp_prog,
  } = props;
  if (xp_req === 0) {
    return (
      <span style={skillgreen}>
        to next level: MAXXED
      </span>
    );
  }
  return (
    <span>XP to next level: [{xp_prog} / {xp_req}]</span>
  );
};
=======
>>>>>>> master
