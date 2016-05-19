class ApiController
  module Chargeback
    #
    # Conditions Subcollection Supporting Methods
    #

    def foo_resource(type, id, data = nil)
      cb = ChargebackRate.find(data['data'].first['chargeback_id'])
      tn = Tenant.find(data['data'].first['tenant_id'])

      ChargebackRate.set_assignments cb.rate_type, [{cb_rate: cb, object: tn}]

      { tags: cb.tags }
    end
  end
end
