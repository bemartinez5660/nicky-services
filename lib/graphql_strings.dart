const String login = r'''
mutation login(
    $email: String!,
    $password: String!,
  ) {
    login(email: $email, password: $password) {
      token
      success
      errors
      refreshToken
      unarchiving
      user {
        id
        pk
        username
      }
    }
  }''';

const String forgotpassword = r'''
mutation sendPasswordResetEmail(
    $email: String!,
  ) {
  sendPasswordResetEmail(email: $email) {
    success,
    errors,
  }
}''';
const String register = r''' 
mutation register(
    $email: String!,
    $password1: String!,
    $refby: String
  ) {
  register(email: $email, username: $email, password1: $password1, password2: $password1, refby: $refby) {
    success,
    errors
  }
}
''';
const String socialJwtAuthMutation = r'''
  mutation socialJwtAuth($accessToken: String!, $provider: String!) {
    socialJwtAuth(accessToken: $accessToken, provider: $provider) {
      social {
        user {
          username
          email
        }
      }
      token
    }
  }
''';
const String serviceTypesQuery = r'''
  query GetServiceTypes {

  servicetypes
  (
    where: {root: {id: {isnull: false}}}
    orderBy: {price: ASC}
    limit: 3
  )
  {
    count
    nodes
    {
      id
      abbreviation
      servicetype
      description
      duration
      price
      isActive

      managers
      {
        nodes
        {
          username
        }
      }
      img{
        url
        size
        filename

      }
      root
      {
        servicetype
      }
      configprice


      son
      mon
      tue
      wed
      thu
      fri
      sat

      H00
      H01
      H02
      H03
      H04
      H05
      H06
      H07
      H08
      H09
      H10
      H11
      H12
      H13
      H14
      H15
      H16
      H17
      H18
      H19
      H20
      H21
      H22
      H23


    }
  }
}
  ''';
const String getReservations = r'''
query GetReservations {
    services(
      where: {
        AND: [{ isDeleted: { exact: false } }, { isActive: { exact: true } }]
      }
      orderBy: [{ id: DESC }]
    ) {
      count
      nodes {
        id
        isActive
        additional
        status
        rating
        comments
        date
        address {
          id
          address
          address2
          firstName
          lastName
          city
          phone
          zipcode
        }
        duration
        servicetype {
          id
          servicetype
        }
        serviceteam {
          id
          team
        }
        user {
          id
          username
        }
        price
        extraprice
        bonusRecurrence
        bonusWallet
        bonusPromotions
        bonusNewer
        totalprice
      }
    }
  }
''';

const String kindsOfCleaning = '''
  query {
    servicetypes (
      where: {
          AND: [
          {isDeleted: {exact: false}},
          {isActive: {exact: true}},
          {root:{abbreviation: {exact: "RL"}}},
        ]
      },
    )
    {
      count
      nodes
      {
        id
        abbreviation
        servicetype
        duration
        price
      }
    }
  }''';

const String commercialServiceTypes = '''
        query {
            servicetypes(
              where: {
                AND: [
                  { isDeleted: { exact: false } }
                  { isActive: { exact: true } }
                  { root: { abbreviation: { exact: "CL" } } }
                ]
              }
              orderBy: {id: ASC}
            ) {
              count
              nodes {
                id
                abbreviation
                root {
                  servicetype
                }
                servicetype
                duration
                price
              }
            }
          }
        ''';

const String recurrenceQuery = '''
    query {
      recurrences
      (
        where: {AND: 
          [{isDeleted: {exact: false}}, 
          {isActive: {exact: true}}]},
        orderBy: {days: ASC}
      )
      {
        nodes{
          id
          recurrence
          days
          bonus
        }
      }
    }''';

const String getDisabledMonthDays = '''
  query GetDisabledMontDays(\$year: Int!, \$month: Int!) {
    getDisabledMontDays(
      year: \$year
      month: \$month
      stId: 3
      zipcode: "90001"
      timeoffset: -4
      curId: 14
    )
  }''';

const String getEnabledHours = '''
  query GetEnabledHours(\$date: Date!) {
    getEnabledHours( 
      resDate: \$date 
      zipcode: "90001" 
      stId: 3 
      timeoffset: -4 
      curId: 14 
    ) { 
      hours 
      msg 
    } 
  }''';

const String getAddresses = '''
  query
{
  addresses(
    where: {
        AND: [
        {isDeleted: {exact: false}},
        {isActive: {exact: true}},
      ]
    },
    orderBy: [{id: ASC}] , 
    limit: 3,
  
  )
  {
    count
    nodes
    {
      id
      lastName
      firstName  
      phone
      email
      address
      address2
      city
			zipcode	
      country
      favorite
    }
    
  }
}''';

const String serviceCreateMutation = '''
              mutation ServiceCreate(\$input: userserviceCreateInput!) {
                serviceCreate(input: \$input) {
                  ok
                  errors {
                    messages
                    field
                  }
                  result {
                    id
                    date
                    servicetype {
                      servicetype
                    }
                    duration
                    serviceteam {
                      id
                      team
                    }
                    user {
                      username
                      email
                    }
                    address {
                      address
                      firstName
                      city
                      country
                    }
                    duration
                    additional
                    rating
                    comments
                    createdBy {
                      email
                    }
                    recurrence {
                      id
                      recurrence
                      bonus
                    }

                    userserviceconfigSet {
                      nodes {
                        parameter {
                          parameter
                        }
                        quantity
                        extraprice
                        total
                      }
                    }

                    bonusNewer
                    bonusWallet
                    bonusPromotions
                    discountPromotions
                    bonusRecurrence
                    discountRecurrence
                    price
                    priceest
                    extraprice
                    totalprice
                  }
                }
              }
                ''';

const String additionalServices = '''
      query
    {
     serviceparameters (
       where: {      
            AND: [
            {isDeleted: {exact: false}},
           {isActive: {exact: true}},        
          ]
          OR: [
            {id: {
            exact: "3"
             }}, {id: {
           exact: "4"
              }},
             {id: {
            exact: "6"
              }},
             {id: {
           exact: "7"
             }},
            {id: {
           exact: "8"
             }},
          ]
        },
     )
      {
       count
        nodes
       {
         id
          parameter
        }
     }
    }''';

const String serviceReservedMutation = ''' 
    mutation ServiceReserve(\$id: ID!) {
        serviceReserve(id: \$id) {
        ok
        errors
      }
    }''';

const String carpetCleaningTypes = '''
      query
      {
       serviceparameters (
       where: {
             AND: [
              {isDeleted: {exact: false}},
             {isActive: {exact: true}},
             {parameter: {contains: "type carpet cleaning"}}
           ]
          },
         orderBy: {id: ASC}
       )
       {
         count
         nodes
         {
            id
           parameter
          }
        }
      }
      ''';

const String carpetBuildingType = '''
      query
      {
        serviceparameters (
          where: {
              AND: [
              {isDeleted: {exact: false}},
              {isActive: {exact: true}},
              {parameter: {contains: "carpet located in"}}
            ]
          },
        )
        {
          count
          nodes
          {
            id
            parameter
          }
        }
      }
      ''';
const String carpetStains = '''
      query
      {
        serviceparameters (
          where: {
              AND: [
              {isDeleted: {exact: false}},
              {isActive: {exact: true}},
              {parameter: {contains: "stains in carpet"}}
            ]
          },
          orderBy: {id: ASC}
        )
        {
          count
          nodes
          {
            id
            parameter
          }
        }
      }
      ''';
      
const String typeProperty = '''
        query {
          serviceparameters(
            where: {
              AND: [{ isDeleted: { exact: false } }, { isActive: { exact: true } }]
              OR: [
                { id: { exact: "25" } }
                { id: { exact: "26" } }
                { id: { exact: "27" } }
                { id: { exact: "28" } }
                { id: { exact: "29" } }
              ]
            },
            orderBy: {id: ASC}
          ) {
            nodes {
              id
              parameter
            }
          }
        }

      ''';
