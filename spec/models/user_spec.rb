require 'rails_helper'

RSpec.describe User, type: :model do
   describe 'admin creating' do
     it 'only first user should be marked as admin' do
       first = User.create!({ email:                  'test1@ex.com',
                              password:               'foobar123',
                              password_confirmation:  'foobar123',
                              name:                    'Peter'
                            })

       second = User.create!({ email:                  'test2@ex.com',
                               password:               'foobar123',
                               password_confirmation:  'foobar123',
                               name:                    'John'
                             })

        expect(first.admin?).to   be_truthy
        expect(second.admin?).to  be_falsey
     end
   end
end
