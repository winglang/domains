bring cloud;
bring "cdktf" as cdktf;
bring "@cdktf/provider-dnsimple" as dnsimple;

new dnsimple.provider.DnsimpleProvider();

// ~~~ test.winglang.ai ~~~

let record = new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.ai",
  name: "test",
  type: "NS",
  ttl: 3600,
  value: "\${each.value}",
);

// workaround for:
// 1. can't set costruct id dynamically right now https://github.com/winglang/wing/issues/1739
// 2. can't set simpleIterator on forEach on resource because of type mismatch https://github.com/winglang/wing/issues/2930
record.addOverride("for_each", cdktf.Fn.toset([
  "ns-2046.awsdns-63.co.uk.",
  "ns-205.awsdns-25.com.",
  "ns-1275.awsdns-31.org.",
  "ns-611.awsdns-12.net."
]));