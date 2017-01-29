module Audited::Auditor::AuditedInstanceMethods
  def last_audits(n = 5)
    audits.last(n).map do |a|
      "#{a.created_at} #{a.user.email}:\n" +
      a.audited_changes.map do |field, value|
        "    #{field}: #{value.first} => #{value.last}"
      end.join("\n")
    end.reverse.join("\n\n")
  end
end