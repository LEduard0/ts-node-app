import { User } from '@models/User'

test('it should be ok', () => {
    const user = new User();

    user.name = 'Du'

    expect(user.name).toEqual('Du')
})