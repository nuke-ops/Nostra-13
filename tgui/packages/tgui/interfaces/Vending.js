import { classes } from 'common/react';
import { useBackend } from '../backend';
import { Box, Button, Section, Table } from '../components';
import { Window } from '../layouts';

const VendingRow = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    product,
    productStock,
    custom,
  } = props;
<<<<<<< HEAD
  const {
    onstation,
    department,
    user,
  } = data;
  const free = (
    !onstation
    || product.price === 0
    || (
      !product.premium
      && department
      && user
      && department === user.department
    )
  );
  return (
    <Table.Row>
      <Table.Cell collapsing>
        {product.base64 && (
=======
  const to_pay = (!product.premium
    ? Math.round(product.price * data.cost_mult)
    : product.price
  );
  const pay_text = (!product.premium
    ? to_pay + ' cr' + data.cost_text
    : to_pay + ' cr'
  );
  const free = (
    !data.onstation
    || product.price === 0
  );

  return (
    <Table.Row>
      <Table.Cell collapsing>
        {product.base64 ? (
>>>>>>> master
          <img
            src={`data:image/jpeg;base64,${product.img}`}
            style={{
              'vertical-align': 'middle',
              'horizontal-align': 'middle',
            }} />
<<<<<<< HEAD
        ) || (
=======
        ) : (
>>>>>>> master
          <span
            className={classes([
              'vending32x32',
              product.path,
            ])}
            style={{
              'vertical-align': 'middle',
              'horizontal-align': 'middle',
            }} />
        )}
      </Table.Cell>
      <Table.Cell bold>
        {product.name}
      </Table.Cell>
      <Table.Cell collapsing textAlign="center">
        <Box
<<<<<<< HEAD
          color={(
            custom && 'good'
            || productStock <= 0 && 'bad'
            || productStock <= (product.max_amount / 2) && 'average'
            || 'good'
          )}>
=======
          color={custom
            ? 'good'
            : productStock <= 0
              ? 'bad'
              : productStock <= (product.max_amount / 2)
                ? 'average'
                : 'good'}>
>>>>>>> master
          {productStock} in stock
        </Box>
      </Table.Cell>
      <Table.Cell collapsing textAlign="center">
        {custom && (
          <Button
            fluid
            content={data.access ? 'FREE' : product.price + ' cr'}
            onClick={() => act('dispense', {
              'item': product.name,
            })} />
        ) || (
          <Button
            fluid
            disabled={(
<<<<<<< HEAD
              productStock === 0
              || !free && (
                !data.user
                || product.price > data.user.cash
              )
            )}
            content={free ? 'FREE' : product.price + ' cr'}
=======
              data.stock[product.namename] === 0
                || (
                  !free
                  && (
                    !data.user
                    || to_pay > data.user.cash
                  )
                )
            )}
            content={!free ? pay_text : 'FREE'}
>>>>>>> master
            onClick={() => act('vend', {
              'ref': product.ref,
            })} />
        )}
      </Table.Cell>
    </Table.Row>
  );
};

export const Vending = (props, context) => {
  const { act, data } = useBackend(context);
<<<<<<< HEAD
  const {
    user,
    onstation,
    product_records = [],
    coin_records = [],
    hidden_records = [],
    stock,
  } = data;
  let inventory;
  let custom = false;
  if (data.vending_machine_input) {
    inventory = data.vending_machine_input || [];
    custom = true;
  }
  else {
    inventory = [
      ...product_records,
      ...coin_records,
    ];
    if (data.extended_inventory) {
      inventory = [
        ...inventory,
        ...hidden_records,
      ];
    }
  }
  // Just in case we still have undefined values in the list
  inventory = inventory.filter(item => !!item);
  return (
    <Window
      title="Vending Machine"
      width={450}
      height={600}
      resizable>
      <Window.Content scrollable>
        {!!onstation && (
          <Section title="User">
            {user && (
              <Box>
                Welcome, <b>{user.name}</b>,
                {' '}
                <b>{user.job || 'Unemployed'}</b>!
                <br />
                Your balance is <b>{user.cash} credits</b>.
              </Box>
            ) || (
              <Box color="light-grey">
=======
  let inventory;
  let custom = false;
  if (data.vending_machine_input) {
    inventory = data.vending_machine_input;
    custom = true;
  } else if (data.extended_inventory) {
    inventory = [
      ...data.product_records,
      ...data.coin_records,
      ...data.hidden_records,
    ];
  } else {
    inventory = [
      ...data.product_records,
      ...data.coin_records,
    ];
  }
  return (
    <Window resizable>
      <Window.Content scrollable>
        {!!data.onstation && (
          <Section title="User">
            {data.user && (
              <Box>
                Welcome, <b>{data.user.name}</b>,
                {' '}
                <b>{data.user.job || 'Unemployed'}</b>!
                <br />
                Your balance is <b>{data.user.cash} credits</b>.
              </Box>
            ) || (
              <Box color="light-gray">
>>>>>>> master
                No registered ID card!<br />
                Please contact your local HoP!
              </Box>
            )}
          </Section>
        )}
<<<<<<< HEAD
        <Section title="Products">
=======
        <Section title="Products" >
>>>>>>> master
          <Table>
            {inventory.map(product => (
              <VendingRow
                key={product.name}
                custom={custom}
                product={product}
<<<<<<< HEAD
                productStock={stock[product.name]} />
=======
                productStock={data.stock[product.name]} />
>>>>>>> master
            ))}
          </Table>
        </Section>
      </Window.Content>
    </Window>
  );
};
