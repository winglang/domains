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
) as "winglang_ai_test_ns_record";

// workaround for:
// 1. can't set costruct id dynamically right now https://github.com/winglang/wing/issues/1739
// 2. can't set simpleIterator on forEach on resource because of type mismatch https://github.com/winglang/wing/issues/2930
record.addOverride("for_each", cdktf.Fn.toset([
  "ns-2046.awsdns-63.co.uk.",
  "ns-205.awsdns-25.com.",
  "ns-1275.awsdns-31.org.",
  "ns-611.awsdns-12.net."
]));

// ~~~ docs.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "docs",
  type: "CNAME",
  ttl: 3600,
  value: "cname.vercel-dns.com.",
) as "winglang_io_docs_cname_record";

class Domain {
  zoneName: str;

  init(zoneName: str) {
    this.zoneName = zoneName;
  }

  addRecord(
    name: str,
    type: str,
    value: str,
    ttl: num?,
  ) {
    new dnsimple.zoneRecord.ZoneRecord(
      zoneName: this.zoneName,
      name: name,
      type: type,
      ttl: ttl ?? 3600,
      value: value,
    );
  }
}

// ~~~ winglang.io ~~~

//  that's how it should be, but it's not possible to create a class with a dynamic name right now
// see issue
// let winglangIo = new Domain("winglang.io");
// winglangIo.addRecord("", "A", "75.2.70.75");
// winglangIo.addRecord("", "A", "99.83.190.102");

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "ALIAS",
  ttl: 3600,
  value: "proxy-ssl.webflow.com.",
) as "winglang_io_alias_record";

// ~~~ winglang.io TXT for ALIAS ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "TXT",
  ttl: 3600,
  value: "ALIAS for proxy-ssl.webflow.com",
) as "winglang_io_txt_record-4";

// ~~~ www.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "www",
  type: "CNAME",
  ttl: 3600,
  value: "proxy-ssl.webflow.com.",
) as "winglang_io_www_cname_record";

// ~~~ t.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "t",
  type: "CNAME",
  ttl: 3600,
  value: "cname.tinyurl.com.",
) as "winglang_io_t_cname_record";

// ~~~ playground.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "playground",
  type: "CNAME",
  ttl: 3600,
  value: "cname.vercel-dns.com.",
) as "winglang_io_playground_cname_record";

// ~~~ winglang.io TXT ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "TXT",
  ttl: 3600,
  value: "WCk1OQuXz_fxBolluwE5kKd6UYeduPZmO2HVTIdkJIg",
) as "winglang_io_txt_record-5";

// ~~~ winglang.io MX records ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "MX",
  ttl: 3600,
  priority: 1,
  value: "ASPMX.L.GOOGLE.COM.",
) as "winglang_io_mx_record-1";

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "MX",
  ttl: 3600,
  priority: 5,
  value: "ALT1.ASPMX.L.GOOGLE.COM.",
) as "winglang_io_mx_record-2";

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "MX",
  ttl: 3600,
  priority: 5,
  value: "ALT2.ASPMX.L.GOOGLE.COM.",
) as "winglang_io_mx_record-3";

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "MX",
  ttl: 3600,
  priority: 10,
  value: "ALT3.ASPMX.L.GOOGLE.COM.",
) as "winglang_io_mx_record-4";

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "MX",
  ttl: 3600,
  priority: 10,
  value: "ALT4.ASPMX.L.GOOGLE.COM.",
) as "winglang_io_mx_record-5";

// ~~~ google._domainkey.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "google._domainkey",
  type: "TXT",
  ttl: 3600,
  value: "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjmgd3I8teZ6ZNpCk2K+lKMsLaMhSUkLIxMHnIEck2Ayj5qil2AZQV0NCk/IgQcWKs7tVNZu/r+kKIB//5i9uXF3VplXGEtvEv76GQ+cUfeUDv8UfOepdLuI1MLB3ql/kSeIKvxyQXT2xYE8c1X8GhcQwXjwYA270HlrBrlB5OFkLdA+qicKNBq10bm08qGY2q3MCVlCShY0m6Hxn7j8G17qPVAM98a5dAJJ3cfRF4ECjoDRUlSpoxkwTmUyE38Og6HB4mpCnGCy4TcoGzNg1g0DJo6rAwJTaHAikBcPwgsTnPEzu56Zxlhyd8w1KHaruHwGjG7RqUGCNjiVx18hakwIDAQAB",
) as "winglang_io_google_domainkey_txt_record";

// ~~~ winglang.io SPF ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "SPF",
  ttl: 3600,
  value: "v=spf1 include:_spf.google.com all",
) as "winglang_io_spf_record";

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "TXT",
  ttl: 3600,
  value: "v=spf1 include:_spf.google.com all",
) as "winglang_io_txt_record-1";

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "TXT",
  ttl: 3600,
  value: "v=spf1 include:_spf.google.com ~all",
) as "winglang_io_txt_record-2";

// ~~~ _dmarc.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "_dmarc",
  type: "TXT",
  ttl: 3600,
  value: "v=DMARC1; p=quarantine; rua=mailto:dmarc@winglang.io",
) as "winglang_io_dmarc_txt_record-1";

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "winglang.io._report._dmarc",
  type: "TXT",
  ttl: 3600,
  value: "v=DMARC1",
) as "winglang_io_dmarc_txt_record-2";

// ~~~ go.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "go",
  type: "CNAME",
  ttl: 3600,
  value: "26754295.sites.hscoscdn-eu1.net.",
) as "winglang_io_go_cname_record";

// ~~~ email.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "email",
  type: "CNAME",
  ttl: 3600,
  value: "26754295.sites.hscoscdn-eu1.net.",
) as "winglang_io_email_cname_record";

// ~~~ _cf-custom-hostname.go.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "_cf-custom-hostname.go",
  type: "TXT",
  ttl: 3600,
  value: "8134999d-fa25-4767-b7da-7a6eb264dc77",
) as "winglang_io_cf_custom_hostname_go_txt_record";

// ~~~ play.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "play",
  type: "CNAME",
  ttl: 3600,
  value: "cname.vercel-dns.com.",
) as "winglang_io_play_cname_record";

// ~~~ compiler.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "compiler",
  type: "CNAME",
  ttl: 3600,
  value: "cname.vercel-dns.com.",
) as "winglang_io_compiler_cname_record";

// ~~~ learn.winglang.io ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "learn",
  type: "CNAME",
  ttl: 3600,
  value: "cname.vercel-dns.com.",
) as "winglang_io_learn_cname_record";

// ~~~ winglang.io TXT for Google site verification ~~~

new dnsimple.zoneRecord.ZoneRecord(
  zoneName: "winglang.io",
  name: "",
  type: "TXT",
  ttl: 3600,
  value: "google-site-verification=WCk1OQuXz_fxBolluwE5kKd6UYeduPZmO2HVTIdkJIg",
) as "winglang_io_txt_record-3";